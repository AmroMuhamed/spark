
import 'package:flutter/material.dart';

class Mycart extends ChangeNotifier
{

  var data=[];

  void addData(input){
    data.add(input);
    notifyListeners();
  }
  void updateData(input){
    for(int i=0;i<data.length;i++)
    {
      if(data[i]['name']==input['name'])
      {
        data[i]['name']=input['name'];
        break;
      }
    }
  }
  void deleteData(input){
    for(int i=0;i<data.length;i++)
    {

      if(data[i]['name']==input['name'])
      {
        data.removeAt(i);
        break;
      }
    }
  }
  GetData(){
    return data;
  }

}