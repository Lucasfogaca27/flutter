import 'package:colunaslinhasapp/CadastroCliente.dart';
import 'package:colunaslinhasapp/LoginUsuarios.dart';
import 'package:colunaslinhasapp/View/ListaBanco.dart';
import 'package:colunaslinhasapp/View/ListaBancoFornecedor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Controller/FormCadastroCliente.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Menu com Flutter"),
            iconTheme: IconThemeData(color: Colors.deepOrange)
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget> [
              DrawerHeader(
                child: Text("Cabeçalho"),
                decoration: BoxDecoration(
                  image:  DecorationImage(
                      image: AssetImage("imagens/perfil.jpg"),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              ListTile(
                title: Text("Inicio", style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 10
                ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => FormCadastroCliente())
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text("Cadastro Cliente"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ListaBanco())
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text("Cadastro Produto"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => FormCadastroCliente())
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text("Cadastro Fornecedor"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ListaBancoFornecedor())
                  );
                },
              ),
              Divider(),
              ListTile(

                tileColor: Colors.blue,
                title: Text("Sair"),
                trailing: GestureDetector(
                  child: Icon(Icons.delete),
                  onTap: (){
                      var url = Uri.parse("https://florestasenegocios.com.br/aplicativo/lucasfogaca/sair.php");
                      http.post(url, body: {
                        'username' : username,
                    });
                    print(url);
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                          builder: (context) => LoginUsuarios() ),
                          (Route<dynamic> route) => false
                      );
                  },
                ),
              ),
            ],
          ),
        ),
        body: Center (
          child: Text("Bem Vindo" + this.username),
        )
    );
  }
}