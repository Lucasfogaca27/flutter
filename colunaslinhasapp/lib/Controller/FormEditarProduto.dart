import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../View/ListaBanco.dart';
import '../View/ListaBancoProdutos.dart';

class FormEditarProduto extends StatefulWidget {

  final List list;
  final int index;

  const FormEditarProduto(this.list, this.index);

  @override
  State<FormEditarProduto> createState() => _FormEditarProdutoState();
}

class _FormEditarProdutoState extends State<FormEditarProduto> {

  //Declarar os controlers

  TextEditingController nome = TextEditingController();
  TextEditingController preco = TextEditingController();
  TextEditingController codigo = TextEditingController();
  TextEditingController quantidade = TextEditingController();

  editarDadosCliente(){

    var url = Uri.parse("https://florestasenegocios.com.br/aplicativo/lucasfogaca/clientes/editar.php");
    http.post(url, body: {
      'id' : widget.list[widget.index]['id'],
      'nome' : nome.text,
      'preco' : preco.text,
      'codigo' : codigo.text,
      'quantidade' : quantidade.text,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(widget.index != null){
      nome.text = widget.list[widget.index]['nome'];
      preco.text = widget.list[widget.index]['preco'];
      codigo.text = widget.list[widget.index]['codigo'];
      quantidade.text = widget.list[widget.index]['quantidade'];
    }
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
                    labelText: 'codigo'
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
                  editarDadosCliente();
                });
                Navigator.of(context).push(MaterialPageRoute(builder: (c) => ListaBancoProdutos()));
              },
              color: Colors.blue,
              child: Text("Editar Produto", style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
