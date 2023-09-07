
import 'package:colunaslinhasapp/CadastroProduto.dart';
import 'package:flutter/material.dart';

import 'CadastroCliente.dart';
import 'Controller/FormCadastroFornecedor.dart';

class AbasTelas extends StatefulWidget {
  const AbasTelas({super.key});

  @override
  State<AbasTelas> createState() => _AbasTelasState();
}

class _AbasTelasState extends State<AbasTelas> with SingleTickerProviderStateMixin {

 late TabController tabBarView;

 @override
  void initState() {
    // TODO: implement initState
    tabBarView = TabController(length: 7, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abas do Aplicativo"),
        bottom: TabBar(
          isScrollable: true,
          controller: tabBarView,
          tabs: <Widget> [
            Tab(
              text: "Cadastro para Cliente",
              icon: Icon(Icons.control_camera_sharp),
            ),
            Tab(
              text: "Cadastro para Fornecedor",
              icon: Icon(Icons.accessible_forward_sharp),
              ),
            Tab(
              text: "Cadastro para Produtos",
              icon: Icon(Icons.add_card_rounded),
            ),
            Tab(
              text: "Cadastro para Produtos",
              icon: Icon(Icons.add_card_rounded),
            ),
            Tab(
              text: "Cadastro para Produtos",
              icon: Icon(Icons.add_card_rounded),
            ),
            Tab(
              text: "Cadastro para Produtos",
              icon: Icon(Icons.add_card_rounded),
            ),
            Tab(
              text: "Cadastro para Produtos",
              icon: Icon(Icons.add_card_rounded),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabBarView,
        children: [
            CadastroCliente(),
            FormCadastroFornecedor(),
            CadastroProduto(),
        ],
      ),
    );
  }
}
