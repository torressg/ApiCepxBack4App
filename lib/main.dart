import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:viacep_back4app/repositories/CEPsBack4App_repository.dart';

void main() async {
  await dotenv.load(fileName: "lib/constants/.env");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
              onPressed: () async {
                var results = await CEPsBack4AppRepository().get();
                print(results.toJson());
              },
              child: Text("aa")),
        ),
      ),
    );
  }
}
