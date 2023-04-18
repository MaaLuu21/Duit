import 'dart:ffi';
import 'dart:ui';

import 'package:agenda_app/view/perfil.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';



class Tela_principal extends StatefulWidget {
  const Tela_principal({super.key});

  @override
  State<Tela_principal> createState() => _Tela_principalState();
}

class _Tela_principalState extends State<Tela_principal> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
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
                onPressed: () {
                  Navigator.pushNamed(context, 'perfil');
                },
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.orange, Colors.yellow]),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Academia',
                          style: TextStyle(
                              fontFamily: 'Lilita',
                              fontSize: 30,
                              color: Colors.white),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
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
                      Navigator.pushNamed(context, 'adicionar');
                    },
                    child: Icon(Icons.add),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
