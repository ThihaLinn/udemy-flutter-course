import 'package:flutter/material.dart';
import 'package:roll_dice/screen/starting_screen.dart';

void main(List<String> args) {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.purple,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: StartingScreen()),
    ),
  ));
}
