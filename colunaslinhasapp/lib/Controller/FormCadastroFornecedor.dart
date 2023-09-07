import 'package:colunaslinhasapp/ListaView.dart';
import 'package:colunaslinhasapp/View/ListaBanco.dart';
import 'package:colunaslinhasapp/View/ListaBancoFornecedor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormCadastroFornecedor extends StatefulWidget {
  const FormCadastroFornecedor({super.key});

  @override
  State<FormCadastroFornecedor> createState() => _FormCadastroFornecedorState();
}

class _FormCadastroFornecedorState extends State<FormCadastroFornecedor> {

  //Declarar os controller

  TextEditingController nome = TextEditingController();
  TextEditingController sobrenome = TextEditingController();
  TextEditingController telefone = TextEditingController();
  TextEditingController cidade = TextEditingController();

  void cadastroCliente(){


    var url = Uri.parse("https://florestasenegocios.com.br/aplicativo/lucasfogaca/fornecedor/insert.php");
    http.post(url, body: {
        'nome' : nome.text,
        'sobrenome' : sobrenome.text,
        'telefone' : telefone.text,
        'cidade' : cidade.text,
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Cadastro Clientes"),
      ),
      body: ListView(
          children: [
            Padding(
                padding: EdgeInsets.all(16),
                  child: TextField (
                    controller: nome,
                      decoration: InputDecoration(
                        labelText: 'Nome'
                      )
                ),
            ), Padding(
              padding: EdgeInsets.all(16),
              child: TextField (
                  controller: sobrenome,
                  decoration: InputDecoration(
                      labelText: 'Sobrenome'
                  )
              ),
            ), Padding(
              padding: EdgeInsets.all(16),
              child: TextField (
                  controller: telefone,
                  decoration: InputDecoration(
                      labelText: 'Telefone'
                  )
              ),
            ), Padding(
              padding: EdgeInsets.all(16),
              child: TextField (
                  controller: cidade,
                  decoration: InputDecoration(
                      labelText: 'Cidade'
                  )
              ),
            ),Padding(
              padding: EdgeInsets.all(16),
              child: MaterialButton(
                 onPressed: (){
                   setState(() {
                     cadastroCliente();
                   });
                   Navigator.of(context).push(MaterialPageRoute(builder: (c) => ListaBancoFornecedor()));
                 },
                color: Colors.blue,
                child: Text("Cadastrar Fornecedor", style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
      ),
    );
  }
}
