import 'package:agenda_app/view/editar_perfil.dart';
import 'package:agenda_app/view/tela_princiapal.dart';
import 'package:agenda_app/view/perfil.dart';
import 'package:agenda_app/view/recuperar_senha.dart';
import 'package:agenda_app/view/recuperar_senha2.dart';
import 'package:agenda_app/view/sobre.dart';
import 'package:agenda_app/view/splashView.dart';
import 'package:agenda_app/view/tela_cadastro.dart';
import 'package:agenda_app/view/tela_login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'firebase_options.dart';

//import tela_cadastro.dart

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
  );
  runApp(
    DevicePreview(
      builder: (context) => MaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
      routes: {
        '/': (context) => Tela_login(),
        'primeira': (context) => Tela_cadastro(),
        'recuperar_senha': (context) => RecuperarSenha(),
        'tela_principal': (context) => Tela_principal(),
       // 'recuperar_senha2': (context) => Recuperar_senha2(),
        'splash': (context) => SplashView(),
      //  'perfil': (context) => Perfil(),
        'sobre': (context) => Sobre(),
       // 'editar_perfil':(context) => EditarPerfil(),
        
      },
    ),
    ),
  );
}
