import 'package:flutter/material.dart';
import 'package:weather/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});


  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String city =  "Goa" ;
  var temp ;
  var hum ;
  var air_speed;
  var dis;
  var main;
  var icon;

   void startApp(String city) async
   {
     worker instance  =  worker(location: city);
     await instance.getData();

     temp  = instance.temp;
     hum   = instance.humidity;
     air_speed = instance.air_speed;
     dis       = instance.description;
     main      = instance.main;
     icon      = instance.icon;
     //print(hum);
     Navigator.pushReplacementNamed(context, '/home',arguments:{
       "temp_key" : temp,
       "hum_key"  : hum,
       "air_speed_key"  : air_speed,
       "dis_key"        : dis,
       "main_key"       : main,
       "icon_value"     : icon,
       "city_value"     :city,
     });
   }

   @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Map search = ModalRoute.of(context)!.settings.arguments as Map;
    if(search?.isNotEmpty ??  false){
      city  =  search['searchText'];
    }
    startApp(city);
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
                Image.asset("images/logo.png",height: 180,width: 180,),
                SizedBox(height: 10,),
                Text("Weather App",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500

                  ) ,),
                  SizedBox(height: 10,),
                Text("made by Hardik",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400
                ) ,),
          SizedBox(height: 40,),

        SpinKitThreeBounce(              // for the spinner and import the kit
          color: Colors.black26,
          size: 50.0,
        ),

            ],
          ),


      ),
      backgroundColor: Colors.white,

    );
  }
}
