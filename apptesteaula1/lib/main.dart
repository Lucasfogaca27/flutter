import 'package:flutter/material.dart';

void main() {
  runApp(
      new MaterialApp(
        title: "Meu segundo APP com flutter",
        home:Container(color: Colors.red,
          child: Column(
            children: <Widget> [
              Text("App Turma Tecnico Senac")
            ],
          ),
      )
    )
  );
}
