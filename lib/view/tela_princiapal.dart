import 'package:agenda_app/model/adiciona.dart';
import 'package:agenda_app/model/adicionar1.dart';
import 'package:agenda_app/view/controller/tarefa_controller.dart';
import 'package:agenda_app/view/tarefa.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'controller/loginController.dart';

class Tela_principal extends StatefulWidget {
  const Tela_principal({Key? key}) : super(key: key);

  @override
  State<Tela_principal> createState() => _Tela_principalState();
}

class _Tela_principalState extends State<Tela_principal> {
  // Atributos
  List<Adiciona> lista = [];
  var index;
  var txtNome = TextEditingController();
  var txtTitulo = TextEditingController();
  var txtDescricao = TextEditingController();
  var txtRepeticao = TextEditingController();
  String animationType = 'idle';

  @override
  void initState() {
    index = -1;
    super.initState();

    // Buscar o nome do usuário no banco de dados
    Future<String> nomeUsuario = LoginController().usuarioLogado();

    // Atualizar o valor de txtNome.text quando os dados estiverem disponíveis
    nomeUsuario.then((nome) {
      setState(() {
        txtNome.text = nome;
      });
    });
  }

  void _abrirDialogEditarNome() async {
    TextEditingController nomeController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Nome'),
          content: TextField(
            controller: nomeController,
            decoration: const InputDecoration(labelText: 'Nome'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                String novoNome = nomeController.text.trim();
                if (novoNome.isNotEmpty) {
                  setState(() {
                    txtNome.text = novoNome;
                  });

                  // Atualiza o nome no banco de dados
                  LoginController().atualizarNomeUsuario(novoNome);

                  Navigator.of(context).pop();
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ClipOval(
          child: Container(
            padding: EdgeInsets.only(bottom: 20, left: 10),
            width: 350, // Defina a largura desejada para a imagem
            height: 350, // Defina a altura desejada para a imagem
            child: Transform.scale(
              scale: 1.4, // Ajuste o fator de escala conforme necessário
              child: FlareActor(
                'assets/Teddy.flr',
                alignment: Alignment.bottomCenter,
                fit: BoxFit.contain,
                animation: this.animationType,
                callback: (animationName) {
                  setState(() => animationType = 'idle');
                },
              ),
            ),
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  txtNome.text,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: _abrirDialogEditarNome,
            ),
            FutureBuilder<String>(
              future: LoginController().usuarioLogado(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return IconButton(
                    icon: Icon(Icons.exit_to_app),
                    onPressed: () {
                      LoginController().logout();
                      Navigator.pushReplacementNamed(context, '/');
                    },
                  );
                }
                return Text('');
              },
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.yellow, Colors.orange],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 255, 255),
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Container(
                  height: 110,
                  child: Image.asset(
                    'assets/images/perfil.png',
                    height: 100,
                  ),
                ),
                onPressed: () async {
                  var novoNome = await Navigator.pushNamed(context, 'perfil');
                  if (novoNome != null && novoNome is String) {
                    setState(() {
                      txtNome.text = novoNome;
                    });
                  }
                },
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: StreamBuilder<QuerySnapshot>(
                stream: TarefaController().listar().snapshots(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Center(
                        child: Text('Não foi possível conectar.'),
                      );
                    case ConnectionState.waiting:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      final dados = snapshot.requireData;
                      if (dados.size > 0) {
                        return ListView.builder(
                          itemCount: dados.size,
                          itemBuilder: (context, index) {
                            String id = dados.docs[index].id;
                            dynamic item = dados.docs[index].data();
                            return WidgetTarefa(
                              item['titulo'],
                              item['descricao'],
                              id,
                              item['repeticao'],
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: Text('Nenhuma tarefa encontrada.'),
                        );
                      }
                  }
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: adicionarTarefa,
        backgroundColor: Colors.black,
      ),
    );
  }

  void adicionarTarefa() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Adicionar()),
    );

    if (result != null) {
      setState(() {
        lista.add(result as Adiciona);
      });
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: Tela_principal(),
  ));
}
