import 'package:agenda_app/view/controller/tarefa_controller.dart';
import 'package:flutter/material.dart';

class WidgetTarefa extends StatefulWidget {
  final String titulo;
  final String descricao;
  final int repeticao;
  final String id;

  const WidgetTarefa(
    this.titulo,
    this.descricao,
    this.id,
    this.repeticao, {
    Key? key,
  }) : super(key: key);

  @override
  State<WidgetTarefa> createState() => _WidgetTarefaState();
}

class _WidgetTarefaState extends State<WidgetTarefa> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 100,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange, Colors.yellow],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.titulo,
                  style: TextStyle(
                    fontFamily: 'Lilita',
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  widget.descricao,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete_outline),
            onPressed: () {
              TarefaController().excluir(context, widget.id);
            },
          ),
        ],
      ),
    );
  }
}