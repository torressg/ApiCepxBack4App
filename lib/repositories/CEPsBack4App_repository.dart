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
      print("Erro: ${e}");

      throw e;
    }
  }

  Future<void> addCEP(CEPsBack4AppModel cepsBack4AppModel) async {
    dio.options.headers = {
      "X-Parse-Application-Id": appId,
      "X-Parse-REST-API-Key": appKey,
      "Content-Type": "application/json"
    };
    try {
      await dio.post(address, data: cepsBack4AppModel.toJson());
    } catch (e) {
      print("Erro: ${e}");
    }
  }
}
