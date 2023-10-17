// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:viacep_back4app/models/CEPsBack4App_model.dart';
import 'package:viacep_back4app/repositories/CEPsBack4App_repository.dart';
import 'package:viacep_back4app/repositories/ViaCep_repository.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddCEP extends StatefulWidget {
  const AddCEP({super.key});

  @override
  State<AddCEP> createState() => _AddCEPState();
}

class _AddCEPState extends State<AddCEP> {
  var CepRepository = CEPsBack4AppRepository();
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

  var maskFormatter = MaskTextInputFormatter(
      mask: '#####-###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Busca CEP")),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            const Text("Consulte o CEP", style: TextStyle(fontSize: 25)),
            const SizedBox(
              height: 20,
            ),
            TextField(
              inputFormatters: [maskFormatter],
              controller: cep,
              decoration: const InputDecoration(hintText: "Digite o CEP"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () async {
                  setState(() {
                    isLoading = !isLoading;
                  });
                  resultCep = await ViaCep.getCep(cep.text);

                  setState(() {
                    showDetails = true;
                    cepCard = (resultCep['cep']);
                    logradouroCard = resultCep['logradouro'];
                    bairroCard = resultCep['bairro'];
                    ufCard = resultCep['uf'];
                    cidadeCard = resultCep['localidade'];
                    isLoading = !isLoading;
                  });
                },
                child: const Text(
                  "Consultar",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )),
            isLoading
                ? const CircularProgressIndicator()
                : showDetails
                    ? Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('CEP: $cepCard'),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "$logradouroCard, $bairroCard, $cidadeCard - $ufCard "),
                                ],
                              ),
                            ),
                            const Text(
                              "Deseja cadastrar a sua lista de CEPs?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            isLoading
                                ? CircularProgressIndicator()
                                : TextButton(
                                    onPressed: () async {
                                      setState(() async {
                                        CEPsBack4AppModel result =
                                            await CepRepository.queryCEP(
                                                cep.text);
                                        if (result.results.length != 0) {
                                          // ignore: use_build_context_synchronously
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (context) => SizedBox(
                                              height: 200,
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    const Text(
                                                        'Você já tem esse CEP cadastrado'),
                                                    ElevatedButton(
                                                      child: const Text(
                                                          'Consultar outro CEP'),
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          print("n tem cep");
                                        }
                                      });
                                    },
                                    child: const Text('Sim'))
                          ],
                        ),
                      )
                    : Container()
          ],
        ),
      ),
    );
  }
}
