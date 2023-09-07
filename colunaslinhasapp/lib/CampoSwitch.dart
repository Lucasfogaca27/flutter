import 'package:flutter/material.dart';


class CampoSwitch extends StatefulWidget {
  const CampoSwitch({super.key});

  @override
  State<CampoSwitch> createState() => _CampoSwitchState();
}

class _CampoSwitchState extends State<CampoSwitch> {

  bool resposta = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Campos Switch"),
          centerTitle: true,
          toolbarHeight: 30,
      ), body: Container(
            child: Column(
                children: [
                  SwitchListTile(title: Text("Ativar Notificação"),
                      value: resposta,
                      onChanged: (bool valor){
                        setState(() {
                           resposta = valor;
                        });
                      }
                  ),
                  Center(
                    child: Text(resposta.toString()),
                  )
                ],
            ),
    ),
    );
  }
}
