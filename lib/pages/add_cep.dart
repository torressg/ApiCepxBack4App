import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AddCEP extends StatefulWidget {
  const AddCEP({super.key});

  @override
  State<AddCEP> createState() => _AddCEPState();
}

class _AddCEPState extends State<AddCEP> {
  TextEditingController cep = TextEditingController();
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
                  var dio = Dio();
                  var resultCep = await dio
                      .get("https://viaCep.com.br/ws/${cep.text}/json/");
                  print(resultCep);
                },
                child: Text(
                  "Consultar",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )),
            Container(
              child: Card(
                  child: Column(
                children: [
                  ListTile(
                    title: Text("data"),
                  )
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
