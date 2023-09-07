import 'package:flutter/material.dart';

class CampoSelect extends StatefulWidget {
  const CampoSelect({super.key});

  @override
  State<CampoSelect> createState() => _CampoSelectState();
}

class _CampoSelectState extends State<CampoSelect> {

  String? itemdesvalor  = null;
  static const itemsvalor = <String>["Empresa" , "Usuário"];

  List<DropdownMenuItem<String>> meuarray = itemsvalor.map((e) =>
        DropdownMenuItem(
          value: e,
          child: Text(e)
        )
  ).toList();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Campo Select"),
        centerTitle: true,
        toolbarHeight: 30,
      ), body: Container(
        child: Column(
          children: [
            ListTile(
              title: Text("Selecione"),
              trailing: DropdownButton(
                hint: Text("selecione"),
                //disabledHint: Text(itemsvalor.toString()),
                items: meuarray,
                value: itemdesvalor,
                onChanged: (e){
                  setState(() {
                    itemdesvalor = e.toString();
                  });
                },
              ),
            ),
            Center(
              child: Text(itemsvalor.toString()),
            )
          ],
        ),
    )
    );
  }
}
