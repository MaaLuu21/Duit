import 'package:flutter/material.dart';

import '../model/adiciona.dart';

//STATEFUL stf+TAB
class Adicionar extends StatefulWidget {
  const Adicionar({super.key});

  @override
  State<Adicionar> createState() => _AdicionarState();
}

class _AdicionarState extends State<Adicionar> {
  //Atributos
  List<Adicionar> lista = [];
  var index;
  var txtTitulo = TextEditingController();
  var txtDescricao = TextEditingController();
  var txtuid = 0;
  var ValRepeticao = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              adicionar(),
               Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Número de repetições ao dia: $ValRepeticao' ,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Stack(alignment: Alignment.bottomRight, children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.black,
                      onPressed: () {
                        _incrementCount();
                        
                      },
                      child: Icon(Icons.add),
                    ),
                  ]),
                ),
              ],
            ),
          ),
            ]),
            
      ),
    );
  }

  //
  // ADICIONAR CONTATOS
  //
  adicionar() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          children: [
            //CAMPO DE TEXTO
            TextField(
              controller: txtTitulo,
              decoration: InputDecoration(
                labelText: 'Título',
                labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            //CAMPO DE TEXTO
            TextField(
              controller: txtDescricao,
              decoration: InputDecoration(
                labelText: 'Descrição',
                labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            //BOTÃO> ElevatedButton; OutlinedButton; TextButton
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () async {
                      if (txtTitulo.text.isNotEmpty &&
                          txtDescricao.text.isNotEmpty) {
                        mensagem('Lembrete adicionado com sucesso!!');
                        await Future.delayed(Duration(milliseconds: 1000));

                        Navigator.pop(
                          context,
                          Adiciona(txtTitulo.text, txtDescricao.text, ValRepeticao,txtuid),
                        
                        );
                        txtTitulo.clear();
                        txtDescricao.clear();
                      } else {
                        mensagem(
                          'Os campos Título e Descrição precisam ser preenchidos.',
                        );
                      }
                    },
                    child: Text(
                      'Salvar',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancelar',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  mensagem(msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.black,
      duration: Duration(seconds: 2),
      content: Text(
        msg,
        style: TextStyle(fontSize: 16),
      ),
    ));
  }

 void _incrementCount() {
    setState(() {
      ValRepeticao++;
    });
  }
}
