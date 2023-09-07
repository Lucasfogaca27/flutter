import 'package:colunaslinhasapp/ListaView.dart';
import 'package:colunaslinhasapp/View/ListaBanco.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../View/ListaBancoProdutos.dart';

class FormCadastroProduto extends StatefulWidget {
  const FormCadastroProduto({super.key});

  @override
  State<FormCadastroProduto> createState() => _FormCadastroProdutoState();
}

class _FormCadastroProdutoState extends State<FormCadastroProduto> {

  //Declarar os controller

  TextEditingController nome = TextEditingController();
  TextEditingController preco = TextEditingController();
  TextEditingController codigo = TextEditingController();
  TextEditingController quantidade = TextEditingController();

  void cadastroCliente(){


    var url = Uri.parse("https://florestasenegocios.com.br/aplicativo/lucasfogaca/clientes/insert.php");
    http.post(url, body: {
        'nome' : nome.text,
        'preco' : preco.text,
        'codigo' : codigo.text,
        'quantidade' : quantidade.text,
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Cadastro Produtos"),
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
                  controller: preco,
                  decoration: InputDecoration(
                      labelText: 'Preço'
                  )
              ),
            ), Padding(
              padding: EdgeInsets.all(16),
              child: TextField (
                  controller: codigo,
                  decoration: InputDecoration(
                      labelText: 'Código'
                  )
              ),
            ), Padding(
              padding: EdgeInsets.all(16),
              child: TextField (
                  controller: quantidade,
                  decoration: InputDecoration(
                      labelText: 'quantidade'
                  )
              ),
            ),Padding(
              padding: EdgeInsets.all(16),
              child: MaterialButton(
                 onPressed: (){
                   setState(() {
                     cadastroCliente();
                   });
                   Navigator.of(context).push(MaterialPageRoute(builder: (c) => ListaBancoProdutos()));
                 },
                color: Colors.blue,
                child: Text("Cadastrar Produtos", style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
      ),
    );
  }
}
