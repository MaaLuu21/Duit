import 'package:flutter/material.dart';


class Editar_perfil extends StatefulWidget {
  const Editar_perfil({super.key});

  @override
  State<Editar_perfil> createState() => _Editar_perfilState();
}

class _Editar_perfilState extends State<Editar_perfil> {
  var nome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                height: 150,
                child: Image.asset(
                  'assets/images/perfil.png',
                  height: 110,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                height: 65,
                width: 100,
                child: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Nome',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 21),
                      labelStyle: TextStyle(
                        fontSize: 30,
                      ),
                      prefixIcon: Icon(
                        Icons.person_2,
                        color: Colors.black,
                      ),
                    ),
                    controller: nome,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                height: 58,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shadowColor: Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () async {
                   Navigator.pop(context);
                  },
                  child: Text(
                    'Salvar',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
