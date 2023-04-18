import 'package:flutter/material.dart';

class Recuperar_senha2 extends StatefulWidget {
  const Recuperar_senha2({super.key});

  @override
  State<Recuperar_senha2> createState() => _Recuperar_senha2State();
}

class _Recuperar_senha2State extends State<Recuperar_senha2> {
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
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: 300,
              child: Text(
                'Por favor informe o código de segurança enviado para o seu e-mail!',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Código',
                    hintStyle: TextStyle(color: Colors.black, fontSize: 23, ),
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
                  onPressed: () {
                      Navigator.pushNamed(
                    context,
                    '/',);
                  },
                  child: Text('OK', style: TextStyle(fontSize: 21),),
                ),
              ),
             
            ],
          ),
        ],
      ),

    );
  }
}