import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ListaView extends StatefulWidget {
  const ListaView({Key? key}) : super(key: key);
  @override
  _ListaViewState createState() => _ListaViewState();
}
List _valoresarray = [];
void _carregaarray() {
  for (int i = 0; i <= 10; i++) {
    Map<String, dynamic> _array = Map();
    _array["EU"] = "Brian";
    _array["TU"] = "Brian 2";
    _array["A"] = "Brian 3";
    _array["B"] = "Brian 4";
    _valoresarray.add(_array);
  }
}
class _ListaViewState extends State<ListaView> {
  @override
  Widget build(BuildContext context) {
    _valoresarray = [];
    _carregaarray();
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Flutter"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: _valoresarray.length,
            itemBuilder: (context, valores) {
              return ListTile(
                title: Text(_valoresarray[valores]["EU"]),
                subtitle: Text(_valoresarray[valores]["TU"]),
                trailing: Text(_valoresarray[valores]["A"]),
              );
            }),
      ),
    );
  }
}