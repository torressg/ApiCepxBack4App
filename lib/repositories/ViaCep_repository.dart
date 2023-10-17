// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

class ViaCepRepository {
  var dio = Dio();

  Future<Map<String, dynamic>> getCep(String cep) async {
    try {
      var result = await dio.get("https://viaCep.com.br/ws/$cep/json/");
      return result.data;
    } catch (e) {
      print("Erro: $e");
      rethrow;
    }
  }
}
