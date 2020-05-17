

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sparktask/servives/firebase_auth.dart';

import 'Home_page.dart';
import 'Sign_up.dart';

class login_page extends StatefulWidget{

  login_pageState createState()=> login_pageState();
}

class  login_pageState extends State<login_page>{  TextEditingController _emailController;
TextEditingController _passwordController;

@override
void initState() {
  super.initState();
  _emailController = TextEditingController(text: "");
  _passwordController = TextEditingController(text: "");

}
bool selected=false;
bool textsecure= true;
bool _validatePass = false;
bool _validateEmail = false;
String erroremail='';
String errorpass='';
String erroremail2=null;
String errorpass2=null;
@override
Widget build(BuildContext context) {



  var my_height =
  MediaQuery.of(context).size.height;
  // TODO: implement build
  return Scaffold(

      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Hexcolor('#181616'),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: my_height*26.3/100),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(75.0))),
              child: ListView(
                children: <Widget>[
                  //email and email icon
                  Padding(
                      padding: EdgeInsets.fromLTRB(my_height*1.4/100,my_height*14.6/100,my_height*1.4/100,my_height*1.4/100),
                      child: Row(
                        children: <Widget>[

                          CircleAvatar(
                            radius: 20,
                            child: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),

                            backgroundColor: Colors.white.withOpacity(0.4),
                          ),
                          Expanded(
                            child:  Padding(
                              padding: EdgeInsets.all(my_height*.7/100),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  enabled: true,
                                  errorText: _validateEmail ? erroremail:erroremail2,
                                  errorStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color:  Colors.red,),
                                  labelStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 20,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.3),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(width: 1,color: Colors.black),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(width: 1,color: Colors.black),
                                  ),

                                ),
                                style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                                controller: _emailController,
                                onChanged: (value)
                                {
                                  setState(() {

                                    _validateEmail=false;
                                  });
                                },
                              ),
                            ),

                          ),

                        ],
                      )),
                  // row l password and l icon and l eye icon
                  Padding(
                      padding: EdgeInsets.all(my_height*1.4/100),
                      child: Row(
                        children: <Widget>[

                          CircleAvatar(
                            radius: 20,
                            child: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),

                            backgroundColor: Colors.white.withOpacity(0.4),
                          ),

                          Expanded(
                            child:  Padding(
                              padding: EdgeInsets.all(my_height*.7/1005),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  enabled: true,
                                  errorStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.red,),
                                  errorText: _validatePass ? errorpass : errorpass2,
                                  labelStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 20,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.3),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(width: 1,color: Colors.black),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(width: 1,color: Colors.black),
                                  ),

                                ),
                                style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                                controller: _passwordController,
                                obscureText: textsecure,
                                onChanged: (value){
                                  setState(() {
                                    _validatePass=false;
                                  });},

                              ),
                            ),

                          ),
                          Padding(
                            padding: EdgeInsets.all(my_height*.7/100),
                            child: CircleAvatar(

                              radius: 20,
                              child: IconButton(
                                icon: Icon(Icons.remove_red_eye,color: Colors.black,
                                ),
                                onPressed: (){
                                  setState(() {
                                    if (textsecure == false)
                                      textsecure=true;
                                    else
                                      textsecure=false;
                                  });
                                },

                              ),

                              backgroundColor: Colors.white.withOpacity(0.4),
                            ),
                          ),




                        ],
                      )),

                  //login button to check email
                  Padding(
                    padding: EdgeInsets.only(top:my_height*1.4/100,left: my_height*10.4/100,right: my_height*10.4/100),
                    child:SizedBox(
                      width: double.infinity,
                      height: my_height*7.4/100,
                      child: Container(
                          child: RaisedButton(
                              color: Hexcolor('#181616'),
                              textColor: Colors.white,
                              shape:   RoundedRectangleBorder(borderRadius:   BorderRadius.circular(15.0),

                              ),
                              child: Text('Login',style: TextStyle(fontSize: 22),),
                              onPressed: () async{
                                String _email=_emailController.text.toString();
                                String _pass=_passwordController.text.toString();
                                _email=_email.trim();
                                _pass=_pass.trim();
                                switch(_email)
                                {
                                  case '':
                                    {
                                      setState(() {
                                      erroremail='Email Can\'t Be Empty';
                                      _validateEmail=true;
                                    });
                                    }
                                    break;
                                  default:{
                                    setState(() {
                                      _validateEmail=false;
                                    });
                                    break;
                                  }
                                }
                                switch(_pass)
                                {
                                  case '':
                                    {
                                      setState(() {

                                        errorpass='Password Can\'t Be Empty';
                                        _validatePass=true;
                                      });
                                    }
                                    break;
                                  default:{
                                    setState(() {
                                      _validatePass=false;
                                    });
                                    break;
                                  }
                                }

                                if(_emailController.text.toString()!='' &&_passwordController.text.toString()!='')
                                {
                                  setState(() {
                                    selected=true;
                                  });
                                  if(  await  AuthProvider(). signInWithEmail(_email,_pass)!=false)
                                  {

                                    Navigator.pushReplacement(
                                        context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                homePage()));
                                  }
                                  else
                                  {
                                    if(_pass!=''&&_email!='')
                                    {
                                      errorpass2='check your password';
                                      erroremail2='check your email';
                                      setState(() {
                                        selected=false;
                                        _validatePass =false;
                                        _validateEmail=false;
                                      });
                                    }

                                  }
                                }


                              }
                          ),
                          width: double.infinity,
                          height: my_height*4.3/100
                      ),),
                  ),

                  //sign up
                  Padding(
                    padding: EdgeInsets.all(my_height*1.4/100),
                    child: InkWell(
                      onTap: (){

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Signup()));
                      },
                      child: Text("Don't have an account ? , Sign Up",textAlign: TextAlign.center,
                        style: TextStyle( color: Hexcolor('#181616'),decoration: TextDecoration.underline,
                        ),

                      ),

                    ),
                  ),
                  Container(
                    child:
                    selected? SpinKitThreeBounce(
                      color: Hexcolor('#181616'),
                      size: 50.0,
                    ):null,
                  ),
                ],
              ),
            ),
          ),


        ],
      ));


}
}