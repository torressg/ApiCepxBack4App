class CEPsBack4AppModel {
  List<CEPs> results = [];

  CEPsBack4AppModel(this.results);

  CEPsBack4AppModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <CEPs>[];
      json['results'].forEach((v) {
        results.add(CEPs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = results.map((v) => v.toJson()).toList();
    return data;
  }
}

class CEPs {
  String objectId = "";
  String numeroCep = "";
  String bairro = "";
  String cidade = "";
  String createdAt = "";
  String updatedAt = "";

  CEPs(
      {required this.objectId,
      required this.numeroCep,
      required this.bairro,
      required this.cidade,
      required this.createdAt,
      required this.updatedAt});

  CEPs.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    numeroCep = json['Numero_Cep'];
    bairro = json['Bairro'];
    cidade = json['Cidade'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['Numero_Cep'] = numeroCep;
    data['Bairro'] = bairro;
    data['Cidade'] = cidade;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
