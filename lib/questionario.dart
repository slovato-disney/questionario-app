import 'package:flutter/material.dart';
import './questao.dart';
import './respostas.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function() responder;

  const Questionario({super.key, 
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });
  // const Questionario(this.perguntas, ,{super.key});
    bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas'] as List<String>
        : [];
    return Column(
                children: <Widget>[
                  Questao(perguntas[perguntaSelecionada]['texto'].toString()),
                  ...respostas.map((e) => Respostas(e, responder)).toList(),
                ],
              );
  }
}