// ignore_for_file: file_names, avoid_print

import 'package:viacep_back4app/models/CEPsBack4App_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CEPsBack4AppRepository {
  String appId = (dotenv.env['APP_ID']).toString();
  String appKey = (dotenv.env['APP_KEY']).toString();
  String address = (dotenv.env['PARSE_ADDRESS']).toString();
  var dio = Dio();

  Future<CEPsBack4AppModel> getCEPs() async {
    dio.options.headers = {
      "X-Parse-Application-Id": appId,
      "X-Parse-REST-API-Key": appKey,
      "Content-Type": "application/json"
    };

    try {
      var results = await dio.get(address);
      return CEPsBack4AppModel.fromJson(results.data);
    } catch (e) {
      print("Erro: $e");
      rethrow;
    }
  }

  Future<void> addCEP(
      String numeroCep, String bairro, String cidade, String estado) async {
    dio.options.headers = {
      "X-Parse-Application-Id": appId,
      "X-Parse-REST-API-Key": appKey,
      "Content-Type": "application/json"
    };
    var dataToSend = {
      'Numero_Cep': numeroCep,
      'Bairro': bairro,
      'Cidade': cidade,
      'Estado': estado
    };
    try {
      await dio.post(address, data: dataToSend);
    } catch (e) {
      print("Erro: $e");
    }
  }

  Future<CEPsBack4AppModel> queryCEP(String numeroCep) async {
    dio.options.headers = {
      "X-Parse-Application-Id": appId,
      "X-Parse-REST-API-Key": appKey,
      "Content-Type": "application/json"
    };
    var query = {"Numero_Cep": numeroCep};

    try {
      var result =
          await dio.get("""$address?where={ "Numero_Cep":"$numeroCep"}""");
      return CEPsBack4AppModel.fromJson(result.data);
    } catch (e) {
      print("Erro: $e");
      print(query.toString());

      rethrow;
    }
  }
}
