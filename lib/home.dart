import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart';+





class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

    TextEditingController searchController = new TextEditingController();

  // void showData() {}

  /* void timer(){
   Future.delayed(Duration(seconds: 10),(){
     print("Alarm is Ringing");
   });
  print("you can do other stuff too");
  }
*/

  @override
  void initState() {

    print("this is Init method");
   // showData();


    // timer();
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("setStaste Called");
  }

  @override
  Widget build(BuildContext context) {


    var city_name = ["Mumbai", "Delhi", "Chennai", "Dhar", "Indore", "Raipur", "chanddighar"];

    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    Map info = ModalRoute.of(context)!.settings.arguments as Map;  // loading se home me data mangvane k liye
    var temp = ((info['temp_key']).toString()).substring(0,4);
    var icon = info['icon_value'];
    var hum     = info['hum_key'];
    var air_speed = ((info['air_speed_key']).toString()).substring(0,4);
    var dis       = info['dis_key'];
    var getcity = info['city_value'];
   // print(hum);
    

    return Scaffold(
      //backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(          // top bar color  :- status bar
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blueAccent,
        ),
      ),

      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors:[
                    Colors.white24,
                    Colors.lightBlue,
                  ]
                )
              )
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    //   search wala container

                    padding: EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(24)),
                    child: Row(      // search wala row
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/Loading",arguments: {      // this for search text whitch is in side the box
                                "searchText" : searchController.text,
                            });
                          },
                          child: Container(   // search wala container
                            child: Icon(
                              Icons.search,
                              color: Colors.lightBlue,
                            ),
                            margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                          ), // for search icon
                        ),
                        // Icon(Icons.search),
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Search $city"),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        // container
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black12.withOpacity(0.5)),
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          padding: EdgeInsets.all(10),
                          child: Row(children: [
                            Image.network("https://openweathermap.org/img/wn/$icon@2x.png"),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                Text("$dis",style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold

                                ), ),
                                Text("In $getcity",style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                                ), )
                              ],
                            )

                          ],


                          )
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(     // bada wala container
                          height: 200,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black12.withOpacity(0.5)),
                          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                          padding: EdgeInsets.all(26),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height : 30,
                                child: Image.asset('images/thermometer.png'),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("$temp",style: TextStyle(fontSize: 70), ),
                                  Text(" C",style: TextStyle(fontSize: 20),)
                                ],
                              )
                            ],
                          ),

                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black12.withOpacity(0.5)),
                          margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                          padding: EdgeInsets.all(26),
                          child: Column(
                            children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 25,
                                      child: Image.asset('images/windmill.png'),
                                    ),
                                  ],

                                ),
                                SizedBox(height: 30,),
                              Text("$air_speed",style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                              ),),
                              Text("km/hr")
                            ],
                          ),
                          height: 200,


                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black12.withOpacity(0.5)),
                          margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                          padding: EdgeInsets.all(26),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 25,
                                      child: Image.asset('images/humidity.png'),
                                    ),
                                  ],
                              ),
                              SizedBox(height: 30,),
                              Text("$hum",style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                              ),),
                              Text("percent")
                            ],
                          ),
                          height: 200,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 50,),
                  Container(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Made by hardik"),
                        Text("data provided "
                            "by Openweather.org")
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ); 
  }
}
