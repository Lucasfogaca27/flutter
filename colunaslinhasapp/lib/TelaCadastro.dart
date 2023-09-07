import 'package:colunaslinhasapp/TelaLogin.dart';
import 'package:flutter/material.dart';

import 'TelaPrincipal.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {

  TextEditingController nome = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController senha = new TextEditingController();
  String valores = "";

  void cadastroUsuario(){
    var name = nome.text;
    var email1 = email.text;
    var pass = senha.text;

    if(name.isEmpty || pass.isEmpty || email1.isEmpty){
      setState(() {
        valores = "Campos em Branco";
      });
    } else if(name == "Lucas" && pass == "12345" && email1 == "Lucas123"){
      setState(() {
        valores = "Ok";

        Navigator.of(context).push(MaterialPageRoute(builder: (c) => TelaLogin()));
      });
    } else {
      setState(() {
        valores = "Verifique seu Usuário e Senha";
      });
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Cadastro"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
              controller: nome,
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'E-mail',
              ),
              controller: email,
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
              controller: senha,
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Center (
              child: MaterialButton(
                color : Colors.blue,
                minWidth: 400,
                child: Text("Concluir Cadastro" , style: TextStyle(
                  color: Colors.white
                ),),
              onPressed: () {
                  cadastroUsuario();
              },
              ),
             ),
           ),
          ],
        ),
      ),
    );
  }
}
