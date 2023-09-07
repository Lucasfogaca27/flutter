import 'package:flutter/material.dart';
class Alert extends StatefulWidget {
  const Alert({super.key});
  @override
  State<Alert> createState() => _AlertState();
}
class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Dialog com Flutter"),
      ),
      body: Container(
        child: Center(
          child: MaterialButton(
            child: Text("Clique aqui"),
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: (context),
                builder: (context) => AlertDialog(
                  content: Text("Mensagem Alert"),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop("ok");
                        },
                        child: Text("OK")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop("Cancelar");
                        },
                        child: Text("Cancelar"))
                  ],
                ),
              ).then((value) => {
                print("Resultado " + value.toString()),
              });
            },
          ),
        ),
      ),
    );
  }
}