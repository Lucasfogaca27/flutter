import 'package:colunaslinhasapp/Applicativo.dart';
import 'package:colunaslinhasapp/TelaCadastro.dart';
import 'package:colunaslinhasapp/TelaPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:colunaslinhasapp/Menu.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {

  bool passwordVisible=false;

  @override
  void initState(){
    super.initState();
    passwordVisible=true;
  }

  TextEditingController usuario = new TextEditingController();
  TextEditingController senha = new TextEditingController();
  String valores = "";

  void loginUsuarios(){
    var user =  usuario.text;
    var pass = senha.text;

    if(user.isEmpty || pass.isEmpty){
      setState(() {
        valores = "Campos em Branco";
      });
    } else if(user == "Lucas" && pass == "12345"){
      setState(() {
        valores = "ok";
        Navigator.of(context).push(MaterialPageRoute(builder: (c) => Menu()   ));
      });
    }else{
      setState(() {
        valores = "Verifique seu Usuario se Senha";
      });
    }

    limparCampos();
  }

  void limparCampos(){
    usuario.text = "";
    senha.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Login"),
        toolbarHeight: 50,
        backgroundColor: Colors.blue,
        centerTitle: true,
      ), body: SingleChildScrollView(
      child:  Center(
        child: Column(
          children: <Widget> [
            Padding(padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Usuário",
                ),
                controller: usuario,
                // maxLength: 8,
                //  obscureText: true,
              ),
            ) ,
            // Padding(padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
            //   child: TextFormField(
            //     keyboardType: TextInputType.text,
            //     decoration: InputDecoration(
            //         labelText: "Senha",
            //     ),
            //
            //     // maxLength: 8,
            //     obscureText: true,
            //     controller: senha,
            //   ),
            // ),
            Padding(padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
              child :TextField(
                obscureText: passwordVisible, controller: senha,
                decoration: InputDecoration(

                  hintText: "Senha",
                  labelText: "Senha",
                  helperText:"A senha deve conter Caracteres Especiais",

                  suffixIcon: IconButton(
                    icon: Icon(passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(
                            () {
                          passwordVisible = !passwordVisible;
                        },
                      );
                    },
                  ),
                ),
              ),
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
                      loginUsuarios();
                    }
                ),
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(50, 10, 20, 10),
              child: Text(valores),
            ),
            Center(
              child: GestureDetector(
                child: Text("Não possue Conta? Cadastre-se" , style: TextStyle(
                    color: Colors.black
                ),),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (c) => TelaCadastro()   ));
                },
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}