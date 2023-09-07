import 'dart:convert';

import 'package:colunaslinhasapp/Controller/FormCadastroCliente.dart';
import 'package:colunaslinhasapp/Controller/FormCadastroFornecedor.dart';
import 'package:colunaslinhasapp/Controller/FormEditarFornecedor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Controller/FormEditarCliente.dart';

class ListaBancoFornecedor extends StatefulWidget {
  const ListaBancoFornecedor({super.key});

  @override
  State<ListaBancoFornecedor> createState() => _ListaBancoFornecedorState();
}

class _ListaBancoFornecedorState extends State<ListaBancoFornecedor> {

 Future getData() async{
   var url = 'https://florestasenegocios.com.br/aplicativo/lucasfogaca/fornecedor/select.php';
   var response = await http.get(Uri.parse(url));
   return json.decode(response.body);
 }
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista Fornecedores do Back-end"),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (c) => FormCadastroFornecedor()));
            },
              icon: Icon(Icons.add)
          )
        ],
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.hasError);
          return snapshot.hasData ? ListView.builder(
              itemCount: snapshot.data.lenght,
              itemBuilder: (context,index){
                List list = snapshot.data;
                return ListTile(
                  leading: GestureDetector(
                    child: Icon(Icons.edit),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (c) => FormEditarFornecedor(list, index)));
                    },
                  ),

                    title: Text(list[index]['nome']),
                  subtitle: Text(list[index]["email"]),
                  trailing: GestureDetector(
                    child: Icon(Icons.delete),
                    onTap: (){
                      setState(() {
                        var url = Uri.parse("https://florestasenegocios.com.br/aplicativo/lucasfogaca/fornecedor/delete.php");
                        http.post(url, body: {
                          'id' : list[index]['id'],
                        });
                      });
                    },
                  ),
                );
              }
          ): CircularProgressIndicator();
        },
      ),
    );
  }
}
