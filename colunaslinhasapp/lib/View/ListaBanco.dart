import 'dart:convert';

import 'package:colunaslinhasapp/Controller/FormCadastroCliente.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Controller/FormEditarCliente.dart';

class ListaBanco extends StatefulWidget {
  const ListaBanco({super.key});

  @override
  State<ListaBanco> createState() => _ListaBancoState();
}

class _ListaBancoState extends State<ListaBanco> {

 Future getData() async{
   var url = 'https://florestasenegocios.com.br/aplicativo/lucasfogaca/clientes/select.php';
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
        title: Text("Lista Clientes do Back-end"),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (c) => FormCadastroCliente()));
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (c) => FormEditarCliente(list, index)));
                    },
                  ),

                    title: Text(list[index]['nome']),
                  subtitle: Text(list[index]["email"]),
                  trailing: GestureDetector(
                    child: Icon(Icons.delete),
                    onTap: (){
                      setState(() {
                        var url = Uri.parse("https://florestasenegocios.com.br/aplicativo/lucasfogaca/clientes/delete.php");
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
