import 'package:flutter/material.dart';
import 'controller/loginController.dart';

class RecuperarSenha extends StatefulWidget {
  const RecuperarSenha({Key? key}) : super(key: key);

  @override
  _RecuperarSenhaState createState() => _RecuperarSenhaState();
}

class _RecuperarSenhaState extends State<RecuperarSenha> {
  TextEditingController txtEmail = TextEditingController();

  void _enviarEmailRecuperacao() {
    String email = txtEmail.text.trim();
    if (email.isNotEmpty) {
      LoginController().esqueceuSenha(context, email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'DUIT',
                  style: TextStyle(fontFamily: 'Lilita', fontSize: 50),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20),
            width: 300,
            child: Text(
              'Para redefinir sua senha, informe seu e-mail cadastrado.',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: txtEmail,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shadowColor: Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: _enviarEmailRecuperacao,
                  child: Text('OK', style: TextStyle(fontSize: 21),),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shadowColor: Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancelar', style: TextStyle(fontSize: 21),),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
