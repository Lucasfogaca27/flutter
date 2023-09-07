import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
class Musica extends StatefulWidget {
  const Musica({Key? key}) : super(key: key);
  @override
  _MusicaState createState() => _MusicaState();
}
//Instancia a Classe
AudioPlayer musica = AudioPlayer();
//Declarar um método para Executara mídia
_rodarMusica() async
{
  String url =
      "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";
  await musica.play(UrlSource(url));
}
class _MusicaState extends State<Musica> {
  @override
  Widget build(BuildContext context) {
    _rodarMusica();
    return Container();
  }
}