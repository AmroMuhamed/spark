
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sparktask/provider/provider_user_cart.dart';
import 'package:sparktask/utils/DummyData.dart';

import 'Cart_page.dart';

class homePage extends StatefulWidget{

  homePageState createState()=> homePageState();
}

class homePageState extends State<homePage>{
  var produc_list;
  bool selected=false;

  Future getData () async {

    produc_list=await DummyData().myData();
    setState(() {
      selected=true;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }
  @override

  @override
  Widget build(BuildContext context) {

    var my_height =
        MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Hexcolor('#181616'),
      ),
      drawer: Drawer(),
      body:  selected? Stack(
        children: <Widget>[
          //background
          Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white70
          ),


          Padding(
              padding: EdgeInsets.only( left: my_height*1.4/100,right: my_height*1.4/100),
              child:Container(
                height: my_height*76/100,
                child:   Consumer<Mycart>(builder: (context,data,widget){

                  return GridView.builder(
                    itemCount: produc_list.length,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 3,
                        crossAxisCount: (MediaQuery.of(context).orientation == Orientation.portrait) ? 1 : 3),
                    itemBuilder: (BuildContext context, int index) {

                      return
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.2),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 10,top: 20,bottom: 20),
                                  child: Container(
                                    width:my_height*22/100,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.all(  Radius.circular(5.0)),

                                        image: DecorationImage(
                                            image: AssetImage(produc_list[index]['picture']),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child:Padding(
                                      padding: EdgeInsets.only(right: 30),
                                      child:  Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child:  Text("${produc_list[index]['name']}",textAlign: TextAlign.center,
                                              style: TextStyle(color: Hexcolor('#181616'),fontWeight: FontWeight.bold,fontSize: 18),),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child:  Text("${produc_list[index]['price']} LE",textAlign: TextAlign.center,
                                              style: TextStyle(color:Colors.red,fontWeight: FontWeight.bold,fontSize: 18),),
                                          ),
                                          Expanded(child:
                                          Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child:  Row(
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
                                                        if(produc_list[index]['count']=='0')
                                                          Provider.of<Mycart>(context,listen: false).addData(produc_list[index]);
                                                        else
                                                          Provider.of<Mycart>(context,listen: false).updateData(produc_list[index]);

                                                        setState(() {

                                                          produc_list[index]['count']=(int.parse(produc_list[index]['count'])+1).toString();
                                                        });
                                                      },
                                                      child: Icon(Icons.add,color:Hexcolor('#181616')  ,size: 20),
                                                    ),
                                                  ),
                                                ),
                                                Text('${produc_list[index]['count']}',style: TextStyle(fontSize: 15),),

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

                                                        if(int.parse(produc_list[index]['count'])==1)
                                                        {

                                                          Provider.of<Mycart>(context,listen: false).deleteData(produc_list[index]);

                                                          setState(() {

                                                          });
                                                        }
                                                        if(int.parse(produc_list[index]['count'])>0)
                                                        {
                                                          setState(() {
                                                            produc_list[index]['count']=(int.parse(produc_list[index]['count'])-1).toString();
                                                            Provider.of<Mycart>(context,listen: false).updateData(produc_list[index]);
                                                          });
                                                        }

                                                      },
                                                      child: Icon(Icons.remove,color:Hexcolor('#181616') ,size: 20,),
                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),)

                                        ],
                                      ),
                                    )
                                ),
                              ],
                            ),


                          ),
                        );
                    },
                  );}),
              )
          ),


          //press to go to cart page inkwell with container
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child:InkWell(

                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Cart()));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: my_height*8.6/100,
                  decoration: BoxDecoration(
                      color:Hexcolor('#181616'),
                      borderRadius:
                      BorderRadius.only( topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0) )),

                  child:Text('Go To Cart',style: TextStyle(fontSize: 24,color: Colors.white),textAlign: TextAlign.center,),

                ),)
          ),
        ],
      ):Center(
        child: SpinKitThreeBounce(
          color: Hexcolor('#181616'),
          size: 50.0,
        ),
      )
    );
  }

}