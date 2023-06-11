import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Duit',
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'DUIT',
                style: TextStyle(
                  fontFamily: 'Lilita',
                  fontSize: 50,
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'O DUIT é um aplicativo que ajuda as pessoas a gerenciar suas tarefas diárias por meio de notificações. Ele permite que os usuários criem uma lista de tarefas, definam lembretes e marquem as tarefas'
                  ' como concluídas quando estiverem terminadas. O aplicativo é personalizável e envia notificações para lembrar os usuários das tarefas que precisam ser realizadas. O DUIT'
                  ' é ideal para pessoas que estão sempre em movimento e precisam gerenciar suas tarefas de forma eficiente.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Text(
                  'Desenvolvido por Maria Luiza Paes Martins', 
                  textAlign:TextAlign.right,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic
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
