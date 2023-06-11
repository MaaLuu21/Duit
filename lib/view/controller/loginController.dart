import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../util.dart';

class LoginController {
  // Criação de uma nova conta de usuário no Firebase Authentication
  criarConta(context, nome, email, senha) {
  FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: senha)
      .then((resultado) {
    // Conta criada com sucesso
    String uid = resultado.user!.uid;
    FirebaseFirestore.instance.collection('usuarios').doc(uid).set({
      'uid': uid,
      'nome': nome,
    });

    // Adicione o nome do usuário ao banco de dados
    atualizarNomeUsuario(nome);

    sucesso(context, 'Usuário criado com sucesso.');
    Navigator.pop(context);
  }).catchError((e) {
    // Não foi possível criar a conta
    switch (e.code) {
      case 'email-already-in-use':
        erro(context, 'O email já foi cadastrado.');
        break;
      case 'invalid-email':
        erro(context, 'O formato do email é inválido.');
        break;
      default:
        erro(context, 'ERRO: ${e.code}');
    }
  });
}


  // Efetuar o login de um usuário previamente cadastrado no serviço Firebase Authentication
  login(context, email, senhaCorreta) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senhaCorreta)
        .then((resultado) {
      sucesso(context, 'Usuário autenticado com sucesso.');
      Navigator.pushNamed(context, 'tela_principal');
    }).catchError((e) {
      switch (e.code) {
        case 'invalid-email':
          erro(context, 'O formato do email é inválido.');
          break;
        case 'user-not-found':
          erro(context, 'Usuário não encontrado.');
          break;
        case 'wrong-password':
          erro(context, 'Senha incorreta.');
          break;
        default:
          erro(context, 'ERRO: ${e.code.toString()}');
      }
    });
  }

  // Envia uma mensagem de email para recuperação de senha para uma conta de email válida
  esqueceuSenha(context, String email) {
    if (email.isNotEmpty) {
      FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
      sucesso(context, 'Email enviado com sucesso.');
    } else {
      erro(context, 'Informe o email para recuperar a conta.');
    }
    Navigator.pop(context);
  }

  // Faz logout do usuário
  logout() {
    FirebaseAuth.instance.signOut();
  }

  // Retorna o ID do usuário logado
  idUsuario() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  // Retorna o nome do usuário logado
  Future<String> usuarioLogado() async {
    var usuario = '';
    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: idUsuario())
        .get()
        .then((resultado) {
      usuario = resultado.docs[0].data()['nome'] ?? '';
    });
    return usuario;
  }

  // Atualiza o nome do usuário
void atualizarNomeUsuario(String nome) {
  String uid = idUsuario();
  FirebaseFirestore.instance
      .collection('usuarios')
      .doc(uid)
      .get()
      .then((doc) {
    if (doc.exists) {
      // O documento existe, podemos atualizar o nome
      FirebaseFirestore.instance
          .collection('usuarios')
          .doc(uid)
          .update({'nome': nome})
          .then((_) {
        print('Nome do usuário atualizado com sucesso.');
      }).catchError((error) {
        print('Erro ao atualizar o nome do usuário: $error');
      });
    } else {
      // O documento não existe, vamos criá-lo com o ID do usuário
      FirebaseFirestore.instance
          .collection('usuarios')
          .doc(uid)
          .set({'nome': nome})
          .then((_) {
        print('Novo documento de usuário criado com sucesso.');
      }).catchError((error) {
        print('Erro ao criar o novo documento de usuário: $error');
      });
    }
  }).catchError((error) {
    print('Erro ao obter o documento do usuário: $error');
  });
}

}
