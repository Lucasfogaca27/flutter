import 'package:flutter/material.dart';
class CadastroProduto extends StatefulWidget {
  const CadastroProduto({Key? key}) : super(key: key);

  @override
  State<CadastroProduto> createState() => _CadastroProdutoState();
}

class _CadastroProdutoState extends State<CadastroProduto> {

  String? valueItem = null;
  bool resposta = true;
  bool logarCadastrar = false;

  static const items = <String>["JOGOS", "MÁQUINAS"];

  List<DropdownMenuItem<String>> meusItens = items .map((e) => DropdownMenuItem(
    value: e,
    child: Text(e),
  ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding( padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 10, 0, 0) ,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Nome Produto"
                      ),
                      controller: null,
                    ),),
                ],
              ),
              // ignore: prefer_const_constructors
              Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(5, 10, 0, 0) ,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Código Produto"
                          ),
                          controller: null,
                        ),
                      )
                  ),
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(5, 10, 0, 0) ,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Quantidade"
                          ),
                          controller: null,
                        ),
                      )
                  ),
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(5, 10, 0, 0) ,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Preço"
                          ),
                          controller: null,
                        ),
                      )
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(5, 10, 0, 0) ,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Material:"
                          ),
                          controller: null,
                        ),
                      )
                  ),
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(5, 10, 0, 0) ,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Peso:"
                          ),
                          controller: null,
                        ),
                      )
                  ),
                ],
              ),
              Container(
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 20, 0, 0),
                        child: InputDecorator(
// ignore: prefer_const_constructors
                          decoration: InputDecoration(
                            labelText: 'Categoria',
                            contentPadding: EdgeInsets.all(0),
                          ),
                          child: DropdownButton(
                            underline: Container(
                              height: 0,
                              color: Colors.black,
                            ),
                            hint: Text("Selecione:"),
                            isExpanded: true,
                            items: meusItens,
                            value: valueItem,
                            onChanged: (e) {
                              setState(() {
                                valueItem = e.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      SwitchListTile(
                          title: Text("Ativar notificação"),
                          value: resposta,
                          onChanged: (bool valor){
                            setState(() {
                              resposta = valor;

                            });
                          }
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 100),
                        child: Center(
                          child: MaterialButton(onPressed: () {
                            null;
                          },
                            color: Colors.black,
                            minWidth: double.infinity,
                            child: Text("CADASTRO DE PRODUTO",style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}