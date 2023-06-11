  import 'package:flutter/material.dart';

  import 'controller/loginController.dart';

  class Tela_cadastro extends StatefulWidget {
    const Tela_cadastro({super.key});

    @override
    State<Tela_cadastro> createState() => _Tela_cadastroState();
  }

  class _Tela_cadastroState extends State<Tela_cadastro> {
    bool show_senha = false;
    bool show_senha1 = false;
    
    var txtSenha = TextEditingController();
    var txtEmail = TextEditingController();
    var txtNome = TextEditingController();

    @override
    void initState() {
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Duit',
            style: TextStyle(
              fontFamily: 'Lilita',
              fontSize: 20,
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.yellow, Colors.orange,]),
            ),
          ),
        ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                child: Image.asset('assets/images/google.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txtNome,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Nome',
                    hintStyle: TextStyle(color: Colors.black, fontSize: 21),
                    labelStyle: TextStyle(
                      fontSize: 30,
                    ),
                    prefixIcon: Icon(
                      Icons.account_box,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txtEmail,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.black,fontSize: 21),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.black,fontSize: 21),
                      labelStyle: TextStyle(
                        fontSize: 30,
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      suffixIcon: GestureDetector(
                        child: Icon(
                          show_senha1 == false
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black,
                        ),
                        onTap: () {
                          setState(() {
                            show_senha1 = !show_senha1;
                          });
                        },
                      )),
                  obscureText: show_senha1 == false ? true : false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txtSenha,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 21),
                      labelStyle: TextStyle(
                        fontSize: 30,
                      ),
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
                height: 65,
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                        LoginController().criarConta(
                        context,
                        txtNome.text,
                        txtEmail.text,
                        txtSenha.text,
                        );
                  },
                  child: Text(
                    'Salvar',
                    style: TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.amber);
    }
  }
