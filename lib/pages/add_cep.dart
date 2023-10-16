import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:viacep_back4app/repositories/ViaCep_repository.dart';

class AddCEP extends StatefulWidget {
  const AddCEP({super.key});

  @override
  State<AddCEP> createState() => _AddCEPState();
}

class _AddCEPState extends State<AddCEP> {
  var ViaCep = ViaCepRepository();
  TextEditingController cep = TextEditingController();
  bool isLoading = false;
  bool showDetails = false;
  var resultCep;
  String cepCard = "";
  String logradouroCard = "";
  String cidadeCard = "";
  String bairroCard = "";
  String ufCard = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Consulta CEP")),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Text("Consulte o CEP", style: TextStyle(fontSize: 25)),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: cep,
              decoration: InputDecoration(hintText: "Digite o CEP"),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () async {
                  resultCep = await ViaCep.getCep(cep.text);
                  print(resultCep);

                  setState(() {
                    showDetails = !showDetails;
                    cepCard = resultCep['cep'];
                    logradouroCard = resultCep['logradouro'];
                    bairroCard = resultCep['bairro'];
                    ufCard = resultCep['uf'];
                    cidadeCard = resultCep['localidade'];
                  });
                },
                child: Text(
                  "Consultar",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )),
            showDetails
                ? Container(
                    child: Card(
                        child: Column(
                    children: [
                      ListTile(
                        title: Text('CEP: $cepCard'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "$logradouroCard, $bairroCard, $cidadeCard - $ufCard ")
                          ],
                        ),
                      )
                    ],
                  )))
                : Container()
          ],
        ),
      ),
    );
  }
}
