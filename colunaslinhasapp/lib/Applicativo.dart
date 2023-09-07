import 'dart:math';
import 'package:flutter/material.dart';

class Applicativo extends StatefulWidget {
  const Applicativo({Key? key}) : super(key: key);

  @override
  State<Applicativo> createState() => _ApplicativoState();
}

class _ApplicativoState extends State<Applicativo> {

  var letras = ["A","B", "C", "D", "E",];
  var gerar = "Texto Aleatório";

  void letrarAleatorias(){
    var randomico = new Random().nextInt((letras.length));

    setState(() {
      gerar = letras[randomico];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App com Imagem e Botão"),
        backgroundColor: Colors.blue,
        toolbarHeight: 50,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("imagens/logo(1).png", width: 200,),
            Text(gerar ,
              textAlign: TextAlign.center, style: TextStyle (
                  fontFamily: "Georgia, serif;",
                  fontSize: 20,
                  color: Colors.deepOrange
              ),
            ),
            MaterialButton(
                color: Colors.black,
                child: Text("Conteúdo do Bootão" , style: TextStyle(
                    color: Colors.white
                ),),
                onPressed: letrarAleatorias
            )
          ],
        ),
      ),
    );
  }
}