import 'dart:convert';

import 'package:colunaslinhasapp/Api.dart';
import 'package:colunaslinhasapp/HomePage.dart';
import 'package:flutter/material.dart';
import 'RegisterPage.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class LoginUsuarios extends StatefulWidget {
  const LoginUsuarios({super.key});

  @override
  State<LoginUsuarios> createState() => _LoginUsuariosState();
}

class _LoginUsuariosState extends State<LoginUsuarios> {

  String api = Api.logar;
  String msg = "";


  _recuperarSenha() async {
    final Uri url = Uri.parse('https://florestasenegocios.com.br/aplicativo/lucasfogaca/lembrar.php');
        if (!await launchUrl(url)) {
    throw Exception('Url Inválida');
    }
  }

  getApi(String _username, String _password) async{

    final res = await http.post(Uri.parse(api),body: {
      'username' : _username,
      'password' : _password,
    });

    final data = jsonDecode(res.body);

    if(data['level'] == 'admin'){
      Navigator.of(context).push(MaterialPageRoute(builder: (c) => HomePage(username: data['username']  )));
      //username.clear();
      //password.clear();
      print(data['msg']);
      setState(() {
        msg = "OK";
      });
    } else if (data['level'] == 'user'){
      Navigator.of(context).push(MaterialPageRoute(builder: (c) => HomePage(username: data['username'] )));
      //username.clear();
      //password.clear();
      print(data['msg']);
      setState(() {
        msg = "OK";
      });
    } else {
      setState(() {
        msg = 'Usuario ou senha Inválida';
      });
    }
  }

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logar"),
        actions: <Widget>[
          TextButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (c) => RegisterPage()));
              },
              child: Text("Me Cadastrar" ,style: TextStyle(
                color: Colors.white
              ),
              )
          )
        ],
      ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _username,
                    decoration: InputDecoration(
                        labelText: "Usuario",
                        hintText: "Senha"),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(

                        labelText: "Senha",
                        hintText: "Senha"),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Material(
                  color: Colors.blue,
                  child: MaterialButton(
                    onPressed: () {
                      getApi(_username.text, _password.text);
                    },
                    child: Text("LOGIN"),
                  ),
                ),

                SizedBox(
                  height: 15.0,
                ),
                Center(
                  child: Text(msg, style: TextStyle(color:

                  Colors.red)),
                ),
                Center(
                  child: GestureDetector(
                    child: Text("Não possue Conta? Cadastre-se" , style: TextStyle(
                        color: Colors.black
                    ),),
                    onTap: (){
                      _recuperarSenha();
                    },
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
