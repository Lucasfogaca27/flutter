import 'package:codapp1/TelaPrincipal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerUsuario = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _valores = "";

  void _loginUsuario()
  {
    String usuario = _controllerUsuario.text;
    String senha = _controllerSenha.text;

    if(usuario.isEmpty || senha.isEmpty)
    {
      setState(() {
        _valores =  "Verifique os Campos Digitados e Tente Novamente";
      });

    }
    else if(usuario == "Brian" && senha == "12345")
    {
      setState(() {

        _valores =  "ok";
        Navigator.of(context).push(MaterialPageRoute(
            builder: (c) =>
                TelaPrincipal()));

      });
    }

    _limparCampos();
  }

  void _limparCampos()
  {
    _controllerUsuario.text = "";
    _controllerSenha.text= "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela de Login"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),

          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("imagem/perfil.jpg"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Text(
                  "App Codeca",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "Digite Seu Email"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerUsuario,

              ),

              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Digite sua Senha"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerSenha,
                obscureText: true,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Logar",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    onPressed: _loginUsuario

                ),
              ),
              Padding(padding: EdgeInsets.only(top:15),
                child: Text
                  (
                  _valores,
                  style: TextStyle( fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}