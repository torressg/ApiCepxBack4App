import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:viacep_back4app/pages/add_cep.dart';
import 'package:viacep_back4app/pages/cep_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 100),
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset('lib/assets/logo.svg', height: 280),
              Text(
                "BUSCA CEP",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddCEP()));
                  },
                  child: Text(
                    "Buscar CEP",
                    style: TextStyle(fontSize: 20),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CEPList()));
                  },
                  child: Text("CEPs salvos", style: TextStyle(fontSize: 20))),
            ],
          ),
        ),
      ),
    );
  }
}
