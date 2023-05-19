import 'package:agenda_app/model/adicionar1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/adicionar1.dart';
import '../util.dart';


class TarefaController {
  void adicionar(context, Adicionar t) {
    FirebaseFirestore.instance
        .collection('tarefas')
        .add(t.toJson())
        .then((value) => sucesso(context, 'Tarefa adicionada com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'))
        .whenComplete(() => Navigator.of(context).pop());
  }

  void atualizar(context, id, Adicionar t) {}
}