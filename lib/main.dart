import 'dart:js';

import 'package:flutter/material.dart';
import 'package:weather/home.dart';
import 'package:weather/Loading.dart';




void main(){
  
  runApp(MaterialApp(

    routes: {
      "/"     : (context)     => Loading(),
      "/home" : (context) => Home(),
      "/Loading" : (context) => Loading()
     },

  ));
}