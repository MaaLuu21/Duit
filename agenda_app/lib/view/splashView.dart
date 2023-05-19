import 'package:agenda_app/view/tela_login.dart';
import 'package:agenda_app/view/tela_princiapal.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';



class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/images/gatinho.png'),
      logoWidth: 160,
      title: Text(
        'DUIT',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lilita',
        ),
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      loadingText: Text('Carregando...'),
      durationInSeconds: 3,
      navigator: Tela_principal(),
    );
  }
  
}