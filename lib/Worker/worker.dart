import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class worker{

  var location;
  // constructor
  worker({this.location})   // named parameter
  {
    location   = this.location;
  }



    var temp;
    var humidity;
    var air_speed ;
    var description;
    var main ;
    var icon;

    //method
     Future <void> getData() async
     {

       try{
         Response response  = await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=c20219b565b65bbc02669a9b407b8f52"));
         Map data   =  jsonDecode(response.body);

         print(data);
         // get temp , humidity
         Map temp_data   = data['main'];
         var getHumidity  = temp_data['humidityy'];
         var getTemp      =  temp_data['temp'] - 273.15 ;

         // getting air speed
         Map wind          = data['wind'];
         var getAir_speed  =  wind['speed']/0.27777777777778;




         // get Discription
         List weather_data       = data['weather'];
         Map weather_map_data    =  weather_data[0];
         var getMain_des         = weather_map_data['main'];
         var getDesc             = weather_map_data["description"];

        // print(icon);

         // asigning value
         temp  = getTemp;                 // getTemp.toString()
         humidity =  getHumidity;         // getHumidity.toString()
         air_speed = getAir_speed;   //getAir_speed.toString()
         description = getDesc;
         main        = getMain_des ;
         icon             = weather_map_data["icon"].toString();
       }
        catch(e){
          temp        = "can't find data";                 // getTemp.toString()
          humidity    =  "can't find data";         // getHumidity.toString()
          air_speed   = "can't find data";   //getAir_speed.toString()
          description = "can't find data";
          main        = "can't find data";
          icon        = "0303";


        }


     }
}

worker instance  =worker(location:"Mumbai" );
