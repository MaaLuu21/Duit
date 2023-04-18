import 'package:agenda_app/adicionar.dart';
import 'package:agenda_app/editar_perfil.dart';
import 'package:agenda_app/view/tela_principal.dart';
import 'package:agenda_app/view/perfil.dart';
import 'package:agenda_app/view/recuperar_senha.dart';
import 'package:agenda_app/view/recuperar_senha2.dart';
import 'package:agenda_app/view/sobre.dart';
import 'package:agenda_app/view/splashView.dart';
import 'package:agenda_app/view/tela_cadastro.dart';
import 'package:agenda_app/view/tela_login.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flare_flutter/base/actor_color.dart';
import 'package:flutter/material.dart';

//import tela_cadastro.dart

void main(){
  AwesomeNotifications().initialize(null, [NotificationChannel(channelKey: 'channelKey', channelName: 'channelName', channelDescription: 'channelDescription')]);
  runApp( MyApp());
  debug: true;
}
  

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Tela_login(),
        'primeira': (context) => Tela_cadastro(),
        'recuperar_senha': (context) => Recuperar_senha(),
        'tela_principal': (context) => Tela_principal(),
        'recuperar_senha2': (context) => Recuperar_senha2(),
        'splash': (context) => SplashView(),
        'perfil': (context) => Perfil(),
        'sobre': (context) => Sobre(),
        'adicionar':(context) => Adicionar(),
        'editar_perfil':(context) => Editar_perfil(),
   
      },
    );
  }
}
