import 'preguntas.dart';

int _npregunta = 0;

class PreguntasVector {
  List<Preguntas> _listapreguntas = [
    Preguntas(pregunta: 'El cielo es azul', respuesta: true),
    Preguntas(pregunta: 'Mark Zukerberg es humano', respuesta: true),
    Preguntas(pregunta: 'Windows no es un Sistema Operativo', respuesta: false),
    Preguntas(pregunta: 'Las APIs son todas gratis', respuesta: false),
    Preguntas(pregunta: 'Samsung hace celulares', respuesta: true),
    Preguntas(pregunta: 'Desarrollo Web es una profesion', respuesta: true),
    Preguntas(pregunta: 'Los Simpsons son verdes', respuesta: false),
    Preguntas(pregunta: 'Cheem es un perro', respuesta: true),
    Preguntas(pregunta: 'AR-15 no es un rifle', respuesta: false),
    Preguntas(pregunta: 'AC no es igual que DC', respuesta: true),
  ];

  void sigPregunta() {
    if (_npregunta < _listapreguntas.length - 1) {
      _npregunta++;
    }
  }

  String getPregunta() {
    return _listapreguntas[_npregunta].preguntatxt;
  }

  bool getRespuesta() {
    return _listapreguntas[_npregunta].preguntaresp;
  }

  bool ultimaPregunta() {
    if (_npregunta >= _listapreguntas.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void resetNPregunta() {
    _npregunta = 0;
  }
}
