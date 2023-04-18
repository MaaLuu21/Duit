// ignore_for_file: prefer_const_constructors

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Tela_login extends StatefulWidget {
  String animation = 'idle';

  @override
  State<Tela_login> createState() => _Tela_loginState();
}

class _Tela_loginState extends State<Tela_login> {
  String animationType = 'idle';
  String senha = 'admin';

  bool senhaCorreta = false;
  bool show_senha = false;

  TextEditingController controlarSenha = TextEditingController();
  FocusNode senhaNode = FocusNode();
  FocusNode emailNode = FocusNode();

  @override
  void initState() {
    senhaNode.addListener(() {
      if (senhaNode.hasFocus) {
        setState(() => animationType = 'hands_up');
      } else {
        setState(() => animationType = 'hands_down');
      }
    });
    emailNode.addListener(() {
      if (emailNode.hasFocus) {
        setState(() => animationType = 'test');
      } else {
        setState(() => animationType = 'idle');
      }
    });
    // T
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'DUIT',
                    style: TextStyle(
                        fontFamily: 'Lilita',
                        fontSize: 40,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 200,
                width: 200,
                margin: EdgeInsets.all(10),
                child: FlareActor('assets/Teddy.flr',
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.contain,
                    animation: this.animationType,
                    callback: (currentanimation) {
                  setState(() => animationType = 'idle');
                }),
              ),
              Container(
                padding: EdgeInsets.all(30),
                height: 100,
                width: 380,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: TextField(
                  focusNode: emailNode,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.black, fontSize: 21),
                    labelStyle: TextStyle(
                      fontSize: 30,
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(30),
                height: 90,
                width: 380,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: TextField(
                  focusNode: senhaNode,
                  controller: this.controlarSenha,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 21),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      suffixIcon: GestureDetector(
                        child: Icon(
                          show_senha == false
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black,
                        ),
                        onTap: () {
                          setState(() {
                            show_senha = !show_senha;
                          });
                        },
                      )),
                  obscureText: show_senha == false ? true : false,
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
                    bool senhaValida = await senhaCerta();
                    if (senhaValida) {
                      await Future.delayed(Duration(milliseconds: 1300));
                      Navigator.pushNamed(context, 'splash');
                      await Future.delayed(Duration(milliseconds: 3000));
                      mensagem('Seja Bem-Vindo');
                    }
                  },
                  child: Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                        fontSize: 22,
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'recuperar_senha');
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(
                            fontSize: 22,
                            decoration: TextDecoration.underline,
                            color: Colors.black),
                      ),
                      onPressed: () async {
                        await Future.delayed(Duration(milliseconds: 50));
                        Navigator.pushNamed(context, 'primeira');
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> senhaCerta() async {
    FocusScopeNode currentFocus = FocusScope.of(context);

    currentFocus.unfocus();

    await Future.delayed((Duration(milliseconds: 400)));

    if (controlarSenha.text.compareTo(senha) == 0) {
      setState(() => animationType = 'success');
      setState(() => senhaCorreta = true);
      return true;
    } else
      setState(() => animationType = 'fail');
    setState(() => senhaCorreta = false);
    return false;
    {}
  }

  mensagem(msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.black,
      duration: Duration(seconds: 2),
      content: Text(
        msg,
        style: TextStyle(fontSize: 25, fontFamily: 'Lilita'),
      ),
    ));
  }
}
