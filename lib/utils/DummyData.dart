
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class DummyData{

  List produc_list;
  Future<String> loadAStudentAsset() async {
    return await rootBundle.loadString('android/MyData.json');
  }
  Future loadCrossword() async {
    produc_list = json.decode(await loadAStudentAsset());

  }



  
  myData() async{
   await loadCrossword();
    return produc_list;
}


   
}