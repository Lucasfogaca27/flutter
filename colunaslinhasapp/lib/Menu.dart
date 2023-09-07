import 'package:colunaslinhasapp/AbasTelas.dart';
import 'package:colunaslinhasapp/TelaLogin.dart';
import 'package:flutter/material.dart';

import 'Controller/FormCadastroFornecedor.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
                      builder: (context) => TelaLogin())
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text("Cadastro Cliente"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => AbasTelas())
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text("Cadastro Produto"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => AbasTelas())
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text("Cadastro Fornecedor"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>  FormCadastroFornecedor())
                  );
                },
              ),
              Divider(),
              ListTile(
                tileColor: Colors.blue,
                title: Text("Sair"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => TelaLogin())
                  );
                },
              ),
            ],
          ),
      ),
      body: Center (
          child: Text("Conteúdo do APP"),
        )
    );
  }
}
