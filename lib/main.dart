import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sparktask/provider/provider_user_cart.dart';

import 'View/Login_page.dart';

void main() => runApp(MultiProvider(
  ///my cart provider
    providers: [
      ChangeNotifierProvider(create: (BuildContext context)=>Mycart()),
    ],
    child:MaterialApp(
      home: login_page(),
    )
)
);
