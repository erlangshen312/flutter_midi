import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';
import 'dart:core';

void main() => runApp(Midi());

class Midi extends StatelessWidget {
  List<String> rainbowColors = [
    "red",
    "orange",
    "yellow",
    "green",
    "lightGreen",
    "blue",
    "deepPurpleAccent"
  ];

  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey({Color? color, int? soundNumber}) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(soundNumber!);
        },
        child: const Text(''),
      ),
    );
  }

  void randomClicker() async {
    for (int i = 0; i < 100; i++) {
      int rainbowNumber = Random().nextInt(7) + 1;
      String rainbowColor = rainbowColors[rainbowNumber - 1];
      buildKey(color: Colors.red, soundNumber: rainbowNumber);
      await Future.delayed(Duration(seconds: 30));
      print(
          'isClicked: $i, rainbowColor: $rainbowColor, rainbowNumber: $rainbowNumber');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildKey(color: Colors.red, soundNumber: 1),
                buildKey(color: Colors.orange, soundNumber: 2),
                buildKey(color: Colors.yellow, soundNumber: 3),
                buildKey(color: Colors.green, soundNumber: 4),
                buildKey(color: Colors.lightGreen, soundNumber: 5),
                buildKey(color: Colors.blue, soundNumber: 6),
                buildKey(color: Colors.deepPurpleAccent, soundNumber: 7),
                TextButton(
                  onPressed: () {
                    randomClicker();
                  },
                  child: Text('CLICK ME'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
