import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as notifications;
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../model/adiciona.dart';
import '../view/controller/loginController.dart';
import '../view/controller/tarefa_controller.dart';

class Adicionar extends StatefulWidget {
  const Adicionar({Key? key}) : super(key: key);

  @override
  _AdicionarState createState() => _AdicionarState();
}

class _AdicionarState extends State<Adicionar> {
  final TextEditingController txtTitulo = TextEditingController();
  final TextEditingController txtDescricao = TextEditingController();
  TimeOfDay? selectedTime;

  notifications.FlutterLocalNotificationsPlugin
      flutterLocalNotificationsPlugin =
      notifications.FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();

    final settingsAndroid =
        notifications.AndroidInitializationSettings('@mipmap/ic_launcher');
    final initSettings =
        notifications.InitializationSettings(android: settingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initSettings);
    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  children: [
                    TextField(
                      controller: txtTitulo,
                      maxLength: 15,
                      decoration: InputDecoration(
                        labelText: 'Título',
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: txtDescricao,
                      maxLength: 25,
                      decoration: InputDecoration(
                        labelText: 'Descrição',
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        _showTimePicker();
                      },
                      child: Text(
                        'Definir Horário',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            onPressed: () async {
                              if (txtTitulo.text.isNotEmpty &&
                                  txtDescricao.text.isNotEmpty &&
                                  selectedTime != null) {
                                Adiciona tarefa = Adiciona(
                                  txtTitulo.text,
                                  txtDescricao.text,
                                  selectedTime!.hour * 60 +
                                      selectedTime!.minute, // Converter para minutos
                                  LoginController().idUsuario(),
                                );

                                TarefaController().adicionar(context, tarefa);

                                await agendarNotificacao(); // Agendar a notificação

                            // Voltar para a tela anterior

                                txtTitulo.clear();
                                txtDescricao.clear();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.black,
                                    duration: Duration(seconds: 2),
                                    content: Text(
                                      'Os campos Título, Descrição e Horário precisam ser preenchidos.',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              'Salvar',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.popAndPushNamed(context,'tela_principal'); // Voltar para a tela anterior
                          },
                          child: Text(
                            'Cancelar',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> agendarNotificacao() async {
    final androidPlatformChannelSpecifics =
        notifications.AndroidNotificationDetails(
      'repeating_channel_id',
      'Repeating Channel',
      importance: notifications.Importance.max,
    );
    final platformChannelSpecifics = notifications.NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    final now = DateTime.now();
    final scheduledDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      selectedTime!.hour,
      selectedTime!.minute,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Tarefa: ${txtTitulo.text}',
      'Descrição: ${txtDescricao.text}',
      tz.TZDateTime.from(scheduledDateTime, tz.local),
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation:
          notifications.UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      matchDateTimeComponents: notifications.DateTimeComponents.time,
      payload: 'repeating notification',
    );
  }

  Future<void> _showTimePicker() async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selected != null) {
      setState(() {
        selectedTime = selected;
      });
    }
  }
}