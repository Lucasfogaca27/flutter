import 'package:codapp1/MapasFlutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Página Principal"),
        iconTheme: IconThemeData(color: Colors.red),
      ),
      drawer: Drawer(
        child: Material(
         // color: Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          children: <Widget>
          [
            DrawerHeader(
              child: Text("Cabeçalho"),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage("imagem/perfil.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: Text("Menu Home"
                ,style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 18,
                ),
              ),
               onTap: ()
              {
                 Navigator.push(context, MaterialPageRoute(
                     builder: (context) => MapasFlutter())
                 );
                 },
            ),
            ListTile(
              title: Text("Menu Empresa"),
              // onTap: ()
              // {
              //   Navigator.push(context, MaterialPageRoute(
              //       builder: (context) => Empresa())
              //   );
              // },
            ),
            ListTile(
              title: Text("Menu Sobre"),
             // onTap: ()
              // {
              //   Navigator.push(context, MaterialPageRoute(
              //       builder: (context) => Sobre())
              //   );
              // },
            ),
            Divider(),
            ListTile(
              //tileColor: Colors.teal,
              title: Text("Menu Produtos"),
              // onTap: ()
              // {
              //   Navigator.push(context, MaterialPageRoute(
              //       builder: (context) => Produtos())
              //   );
              // },
            ),
            Divider(),
            ListTile(
              title: Text("Menu Sair"),
              onTap: (){},
            ),
          ],
        ),
      ),
      ),
      body: Center(
        child: Text("Conteúdo Body"),
      ),
    );
  }
}

