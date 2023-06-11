class Adiciona {
  final String titulo;
  final String descricao;
  final int repeticao;
  final String uid;
  Adiciona(this.titulo, this.descricao, this.repeticao, this.uid);



  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'titulo': titulo,
      'descricao': descricao,
      'repeticao' : repeticao,
    };
  }

  factory Adiciona.fromJson(Map<String, dynamic> json) {
    return Adiciona(
      json['uid'],
      json['titulo'],
      json['descricao'],
      json['repeticao'],
    );
  }
}
