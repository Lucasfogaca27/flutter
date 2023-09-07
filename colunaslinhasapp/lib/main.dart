import 'package:colunaslinhasapp/Applicativo.dart';
import 'package:colunaslinhasapp/CampoSelect.dart';
import 'package:colunaslinhasapp/CamposEntrada.dart';
import 'package:colunaslinhasapp/ListaView.dart';
import 'package:colunaslinhasapp/LoginUsuarios.dart';
import 'package:colunaslinhasapp/MapasFlutter.dart';
import 'package:colunaslinhasapp/Menu.dart';
import 'package:flutter/material.dart';
import 'package:colunaslinhasapp/TelaLogin.dart';
import 'package:colunaslinhasapp/Alert.dart';
import 'package:colunaslinhasapp/Musica.dart';
import 'package:colunaslinhasapp/VideoPlayerApp.dart';
import 'package:colunaslinhasapp/View/ListaBanco.dart';
import 'AbasTelas.dart';
import 'CampoSwitch.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginUsuarios(),
    //home: ListaBanco(),
    //home: MapasFlutter(),
    //home: VideoPlayerApp(),
    //home: Musica(),
    //home: ListaView(),
    //home: Alert(),
    //home: TelaLogin(),
    //home: Menu(),
    //home: AbasTelas(),
    //home: CampoSelect(),
    //home: Applicativo(),
    //home: home(),
  ));
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aula 2 Layout"),
        backgroundColor: Colors.blue,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),

                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),

                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),

                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),

                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),

                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),

                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),

              ],
            ),


          ],
        ),
      ) ,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Padding(
          padding: EdgeInsets.all(22),
          child: Row(
            children: [
              Text("Rodape do app")
            ],
          ),
        ),
      ),
    );
  }
}