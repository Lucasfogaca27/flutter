import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


class CadastroCliente extends StatefulWidget {
  const CadastroCliente({super.key});

  @override
  State<CadastroCliente> createState() => _CadastroClienteState();
}

class _CadastroClienteState extends State<CadastroCliente> {

  String? itemdesvalor  = null;
  static const itemsvalor = <String>["Rio Grande do Sul" , "Santa Catarina" , "Paraná"];

  List<DropdownMenuItem<String>> meuarray = itemsvalor.map((e) =>
      DropdownMenuItem(
          value: e,
          child: Text(e)
      )
  ).toList();

  TextEditingController usuario = new TextEditingController();
  TextEditingController reg = new TextEditingController();
  TextEditingController  ncpf = new TextEditingController();
  TextEditingController datadenascimento = new TextEditingController();
  TextEditingController endereco = new TextEditingController();
  TextEditingController cidade = new TextEditingController();
  TextEditingController cep = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController numero = new TextEditingController();
  TextEditingController telefone1 = new TextEditingController();
  TextEditingController telefone2 = new TextEditingController();

  String valores = "";

  void validarCampos(){
    String user = usuario.text;
    String user1 = reg.text;
    String user2 = ncpf.text;
    String user3 = datadenascimento.text;
    String user4 = cidade.text;
    String user5 = cep.text;
    String user6 = email.text;
    String user7 = numero.text;
    String user8 = telefone1.text;
    String user9 = telefone2.text;

    if(user.length <= 3){
      setState(() {
        valores = "Certifique-se que todos os campos estão preenchidos";
      });
    } else{
      setState(() {
        valores = "ok";
      });
    }
  }

  var maskFormatter = new MaskTextInputFormatter(
      mask: '',

  );

  var data = new MaskTextInputFormatter(
      mask: '##/##/####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  var rg = new MaskTextInputFormatter(
      mask: '##########',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  var cpf = new MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  var cepp = new MaskTextInputFormatter(
      mask: '#####-###',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  var telefone3 = new MaskTextInputFormatter(
      mask: '(##)#####-####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: TextField(
                    inputFormatters: [maskFormatter],
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Nome",
                    ),
                    controller: usuario,
                    // maxLength: 8,
                    //  obscureText: true,
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: TextField(
                    inputFormatters: [rg],
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "RG",
                    ),
                    controller: reg,
                    // maxLength: 8,
                    //  obscureText: true,
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: TextField(
                    inputFormatters: [cpf],
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "CPF",
                    ),
                    controller: ncpf,
                    // maxLength: 8,
                    //  obscureText: true,
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: Padding(padding: EdgeInsets.fromLTRB(50, 10, 10, 10),
                  child: TextField(
                    inputFormatters: [data],
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Data de Nascimento",
                    ),
                    controller: datadenascimento,
                    // maxLength: 8,
                    //  obscureText: true,
                  ),
                ),
              ),
            ],
          ),

          Padding(padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: TextField(
              inputFormatters: [maskFormatter],
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Endereço",
              ),
              controller: endereco,
              // maxLength: 8,
              //  obscureText: true,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: TextField(
                    inputFormatters: [maskFormatter],
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Cidade",
                    ),
                    controller: cidade,
                    // maxLength: 8,
                    //  obscureText: true,
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                  child: ListTile(
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
          ),

        ],
        ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: Padding(padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: TextField(
                    inputFormatters: [cepp],
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "CEP",
                    ),
                    controller: cep,
                    // maxLength: 8,
                    //  obscureText: true,
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: Padding(padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: TextField(
                    inputFormatters: [maskFormatter],
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Número",
                    ),
                    controller: numero,
                    // maxLength: 8,
                    //  obscureText: true,
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: Padding(padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: TextField(
                    inputFormatters: [telefone3],
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Telefone 1",
                    ),
                    controller: telefone1,
                    // maxLength: 8,
                    //  obscureText: true,
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: Padding(padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: TextField(
                    inputFormatters: [telefone3],
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Telefone 2",
                    ),
                    controller: telefone2,
                    // maxLength: 8,
                    //  obscureText: true,
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: Center(
              child: MaterialButton(
                  color: Colors.blue,
                  minWidth: 400,
                  child: Text("Logar" , style: TextStyle(
                      color: Colors.white
                  ),),
                  onPressed: () {
                    validarCampos();
                  }
              ),
            ),
          ),
          Text(valores)
      ]
    )
    ),
    );
  }
}
