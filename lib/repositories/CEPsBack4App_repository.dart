import 'package:viacep_back4app/models/CEPsBack4App_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CEPsBack4AppRepository {
  String appId = (dotenv.env['APP_ID']).toString();
  String appKey = (dotenv.env['APP_KEY']).toString();
  String address = (dotenv.env['PARSE_ADDRESS']).toString();

  Future<CEPsBack4AppModel> get() async {
    var dio = Dio();
    dio.options.headers = {
      "X-Parse-Application-Id": appId,
      "X-Parse-REST-API-Key": appKey,
      "Content-Type": "application/json"
    };

    try {
      var result = await dio.get(address);
      return CEPsBack4AppModel.fromJson(result.data);
    } catch (e) {
      print("Erro: ${e}");
      print("Erro: ${appId}");
      throw e;
    }
  }
}
