import 'package:agenda_app/model/adiciona.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import '../util.dart';

import 'loginController.dart';


class TarefaController {
  void adicionar(context, Adiciona t) {
    FirebaseFirestore.instance
        .collection('tarefas')
        .add(t.toJson())
        .then((value) => sucesso(context, 'Tarefa adicionada com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'))
        .whenComplete(() => Navigator.of(context).pop());
  }

  void atualizar(context, id, Adiciona t) {
    FirebaseFirestore.instance
        .collection('tarefas')
        .doc(id)
        .update(t.toJson())
        .then((value) => sucesso(context, 'Tarefa atualizada com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'))
        .whenComplete(() => Navigator.of(context).pop());
  }

  void excluir(context, id) {
    FirebaseFirestore.instance
        .collection('tarefas')
        .doc(id)
        .delete()
        .then((value) => sucesso(context, 'Tarefa excluída com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'));
  }

  listar() {
    return FirebaseFirestore.instance
        .collection('tarefas')
        .where('uid', isEqualTo: LoginController().idUsuario());
  }
}