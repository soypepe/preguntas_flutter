import 'package:flutter/material.dart';
import 'preguntavector.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

PreguntasVector preguntasVector = PreguntasVector();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> puntos = [];
  int puntosCorrectos = 0;
  void revisarRespuesta(bool respuesta) {
    bool correcta = preguntasVector.getRespuesta();
    setState(() {
      if (preguntasVector.ultimaPregunta() == true) {
        Alert(
            context: context,
            title: "Fin del cuestionario",
            desc: "Ya era hora, respuestas correctas: " +
                puntosCorrectos.toString(),
            buttons: [
              DialogButton(
                child: Text(
                  'Reiniciar',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ]).show();
        preguntasVector.resetNPregunta();
        puntos = [];
        puntosCorrectos = 0;
        //procedimientos y reset van afuera de el boton apretado
        //si no se salta la primer pregunta
        // Alert(
        //   context: context,
        //   title: 'Terminado',
        //   desc: 'Cuestionario terminado',
        // ).show();
        // preguntasVector.resetNPregunta();
        // puntos = [];
      } else {
        if (respuesta == correcta) {
          puntos.add(Icon(Icons.check, color: Colors.green));
          puntosCorrectos++;
        } else {
          puntos.add(Icon(Icons.close, color: Colors.red));
        }

        preguntasVector.sigPregunta();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                preguntasVector.getPregunta(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'Verdadero',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                revisarRespuesta(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'Falso',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                revisarRespuesta(false);
              },
            ),
          ),
        ),
        Row(
          children: puntos,
        )
      ],
    );
  }
}
