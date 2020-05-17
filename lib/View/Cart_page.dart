
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sparktask/provider/provider_user_cart.dart';


class Cart extends StatefulWidget{
  CartState createState()=> CartState();
}

class CartState extends State<Cart>
{
  @override
  Widget build(BuildContext context) {

    var my_height =
        MediaQuery.of(context).size.height;
    List myCartList= Provider.of<Mycart>(context,listen: false).GetData();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Hexcolor('#181616'),
      ),
      body:Stack(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: double.infinity,
              color: Hexcolor('#181616'),
          ),
          Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: EdgeInsets.only(top: 30,left: 15,right: 15,bottom: 30),
              child: Consumer<Mycart>(builder: (context,data,widget){
                return
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: my_height*17.5/100,
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child:
                                    Image.asset('${myCartList[index]['picture']}'),
                                  ),
                                  Expanded(
                                    child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.all(5),
                                          child:
                                          Text("${myCartList[index]['name']} ${myCartList[index]['price']} LE",textAlign: TextAlign.center,
                                            style: TextStyle(color: Hexcolor('#181616'),fontWeight: FontWeight.bold,fontSize: 18),),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10,right: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text("Count",style: TextStyle(fontSize: 15),),

                                              Padding(
                                                padding: EdgeInsets.only(left: 5,right: 5),
                                                child:
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(width: 1,color: Hexcolor('#181616'),),
                                                  ),
                                                  child:
                                                  InkWell(
                                                    onTap: (){
                                                      Provider.of<Mycart>(context,listen: false).updateData(myCartList[index]);
                                                      setState(() {

                                                        myCartList[index]['count']=(int.parse(myCartList[index]['count'])+1).toString();
                                                      });
                                                    },
                                                    child: Icon(Icons.add,color:Hexcolor('#181616')  ,size: 20),
                                                  ),
                                                ),
                                              ),

                                              Text('${myCartList[index]['count']}',style: TextStyle(fontSize: 15),),
                                              Padding(
                                                padding: EdgeInsets.only(left: 5,right: 5),
                                                child:
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(width: 1,color: Hexcolor('#181616'),),
                                                  ),
                                                  child:
                                                  InkWell(
                                                    onTap: (){
                                                      setState(() {
                                                        if(int.parse(myCartList[index]['count'])==1)
                                                        {
                                                          myCartList[index]['count']=(int.parse(myCartList[index]['count'])-1).toString();

                                                          Provider.of<Mycart>(context,listen: false).deleteData(myCartList[index]);

                                                        }
                                                        else
                                                        {
                                                          setState(() {
                                                            myCartList[index]['count']=(int.parse(myCartList[index]['count'])-1).toString();
                                                            Provider.of<Mycart>(context,listen: false).updateData(myCartList[index]);
                                                          });
                                                        }



                                                      });
                                                    },
                                                    child: Icon(Icons.remove,color:Hexcolor('#181616') ,size: 20,),
                                                  ),
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                        Expanded(child:
                                        Padding(
                                            padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                                            child: Text(

                                              'Total: ${
                                                  (int.parse(myCartList[index]['count'])*int.parse(myCartList[index]['price']))}',
                                              style: TextStyle(color: Colors.red),)
                                        ),)


                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(width: 1,color: Hexcolor('#181616'),),
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                              ),
                            );},
                          itemCount: myCartList.length
                      ),
                    ),

                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1,color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    width: double.infinity,
                    height: double.infinity,        );
              }

          ))
        ],
      )
      ,
    );
  }

}