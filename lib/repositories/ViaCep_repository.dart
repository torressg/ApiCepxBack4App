import 'package:viacep_back4app/models/CEPsBack4App_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ViaCepRepository {
  var dio = Dio();

  Future<Map<String, dynamic>> getCep(String cep) async {
    try {
      var result = await dio.get("https://viaCep.com.br/ws/$cep/json/");
      return result.data;
    } catch (e) {
      print("Erro: ${e}");
      throw e;
    }
  }
}
