import 'package:agenda_app/model/adicionar1.dart';
import 'package:flutter/material.dart';

import '../model/adiciona.dart';

//STATEFUL stf+TAB
class Tela_principal extends StatefulWidget {
  const Tela_principal({super.key});

  @override
  State<Tela_principal> createState() => _Tela_principalState();
}

class _Tela_principalState extends State<Tela_principal> {
  //Atributos
  List<Adiciona> lista = [];
  var index;
  var txtNome = TextEditingController();
  var txtDose = TextEditingController();
  var ValRepeticao = 1;

  @override
  void initState() {
    index = -1;
    lista.add(Adiciona('Academia', 'BORA BILLL', ValRepeticao));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Column(children: [
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
              onPressed: () {
                Navigator.pushNamed(context, 'perfil');
              },
            ),
          ]),
          Expanded(
            flex: 2,
            child: listar(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.black,
        onPressed: () {
          receber(context);
        },
      ),
      //BARRA DE STATUS
      //persistentFooterButtons: [
      //Text('Total de Remédios: ${lista.length}'),
      //],
    );
  }

  receber(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Adicionar(),
        ));
    setState(() {
      lista.add(result);
    });
  }

  listar() {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: ListView.builder(
        //Definir a quantidade de elementos
        itemCount: lista.length,
        //Definir a aparência dos elementos
        itemBuilder: (context, index) {
          return Container(
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.yellow],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ListTile(
                  leading: Icon(Icons.catching_pokemon),
                  title: Text(
                    lista[index].titulo,
                    style: TextStyle(fontSize: 22, fontFamily: 'Lilita'),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lista[index].descricao,
                        style: TextStyle(fontSize: 19, color: Colors.black),
                      ),
                      Text(
                        'Repetição: ${lista[index].repeticao}',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete_outline),
                    onPressed: () {
                      setState(() {
                        lista.removeAt(index);
                      });
                    },
                  ),
                  onTap: () {
                    setState(() {
                      this.index = index;
                      txtNome.text = lista[index].titulo;
                      txtDose.text = lista[index].descricao;
                    });
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  mensagem(msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 2),
      content: Text(msg),
    ));
  }
}
