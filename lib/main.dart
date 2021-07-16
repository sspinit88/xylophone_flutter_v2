import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: ButtonList(),
      ),
    );
  }
}

class ButtonList extends StatefulWidget {
  const ButtonList({Key? key}) : super(key: key);

  @override
  _ButtonListState createState() => _ButtonListState();
}

class _ButtonListState extends State<ButtonList> {
  void playSound(int index) {
    final AudioCache player = AudioCache();
    player.play('note$index.wav');
  }

  Expanded buildKey(int note, Color color) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {
          setState(() {
            playSound(note);
          });
        },
        child: Card(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildKey(1, Colors.red),
        ],
      ),
    );
  }
}
