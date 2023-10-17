import 'package:flutter/material.dart';
import 'package:viacep_back4app/models/CEPsBack4App_model.dart';
import 'package:viacep_back4app/repositories/CEPsBack4App_repository.dart';

class CEPList extends StatefulWidget {
  const CEPList({super.key});

  @override
  State<CEPList> createState() => _CEPListState();
}

class _CEPListState extends State<CEPList> {
  var cepsRep = CEPsBack4AppRepository();
  int lenghtContactList = 0;
  List<String> titleCEP = [];
  List<String> subTitleCEP = [];

  Future<void> getCEPs() async {
    CEPsBack4AppModel result = await cepsRep.getCEPs();
    setState(() {
      lenghtContactList = result.results.length;
      titleCEP = result.results.map((item) => item.numeroCep).toList();
      subTitleCEP = result.results.map((item) => item.cidade).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getCEPs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CEPs cadastrados'),
      ),
      body: ListView.builder(
          itemCount: lenghtContactList,
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              leading: const Icon(Icons.location_on, size: 35),
              title: Text(titleCEP[index]),
              subtitle: Text(subTitleCEP[index]),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.pending)),
              onTap: () {},
            );
          }),
    );
  }
}
