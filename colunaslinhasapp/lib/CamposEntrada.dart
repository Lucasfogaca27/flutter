import 'package:flutter/material.dart';

class CamposEntrada extends StatefulWidget {
  const CamposEntrada({super.key});

  @override
  State<CamposEntrada> createState() => _CamposEntradaState();
}

enum escolha {m,f,o}

class _CamposEntradaState extends State<CamposEntrada> {

  escolha? genero = escolha.m;
  String resposta = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Campos de Entrada"),
        toolbarHeight: 20,
        centerTitle: true,
      ), body: Container(
          child: Column(
            children: <Widget>[
              RadioListTile(
                  title:Text("Masculino"),
                  value: escolha.m,
                  groupValue: genero,
                  onChanged: (escolha?  value){
                   setState(() {
                     genero = value;
                   });
                  }
                ),
              RadioListTile(
                  title:Text("Feminino"),
                  value: escolha.f,
                  groupValue: genero,
                  onChanged: (escolha?  value){
                    setState(() {
                      genero = value;
                    });
                  }
              ),
              RadioListTile(
                  title:Text("Gambiarra do Capeta"),
                  value: escolha.o,
                  groupValue: genero,
                  onChanged: (escolha?  value){
                    setState(() {
                      genero = value;
                    });
                  }
              ),
              Padding(padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: Center(
                  child: MaterialButton(
                      color: Colors.blue,
                      minWidth: 400,
                      child: Text("Logar" , style: TextStyle(
                          color: Colors.white
                      ),),
                      onPressed: () {
                        if(genero.toString() == "escolha.m"){
                          setState(() {
                            resposta = "Masculino";
                          });
                        } else if(genero.toString() == "escolha.f"){
                         setState(() {
                           resposta = "Feminino";
                         });
                        } else if(genero.toString() == "escolha.o"){
                          setState(() {
                            resposta = "Gambiarra do Capeta";
                          });
                        }
                      }
                  ),
                ),
              ),
              Center(
                child: Text(resposta.toString()),
              )
            ],
          ),
    )
    );
  }
}
