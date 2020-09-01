import 'dart:async';

import 'package:StarCast/FirstScreen.dart';
import 'package:StarCast/GradientText.dart';
import 'package:StarCast/appColors.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'DateSlideCard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Averta',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/imgs/BG.png"), fit: BoxFit.fill),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: FirstScreen(),
        ),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

//   Position currentPosition;
//   String currentAddress = 'LOL dint work';
//   bool screen;
//   bool dateHi;
//   DateTime selecDate;

//   @override
//   void initState() {
//     this.screen = true;
//     this.dateHi = false;
//     this.selecDate = DateTime.now();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;

//     return screen ? screen1(width) : screen2(width);
//   }

//   getCurrentLocation() {
//     geolocator
//         .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
//         .then((Position position) {
//       setState(() {
//         currentPosition = position;
//       });

//       getAddressFromLatLng();
//     }).catchError((e) {
//       print(e);
//     });
//   }

//   getAddressFromLatLng() async {
//     try {
//       List<Placemark> p = await geolocator.placemarkFromCoordinates(
//           currentPosition.latitude, currentPosition.longitude);

//       Placemark place = p[0];

//       setState(() {
//         currentAddress = "${place.locality}, ${place.country}";
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   void screenSwitch() {
//     setState(() {
//       this.screen = !this.screen;
//     });
//   }

//   Widget cloudCover(double width) {
//     return Container(
//       padding: EdgeInsets.only(left: 18, right: 70),
//       width: width - 16,
//       height: 80,
//       margin: EdgeInsets.symmetric(vertical: 12),
//       decoration: BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage("assets/imgs/Cloud Card.png"),
//               fit: BoxFit.fill),
//           borderRadius: BorderRadius.circular(12)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             'Cloud Cover',
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 22,
//             ),
//           ),
//           Container(
//               child: Row(
//             crossAxisAlignment: CrossAxisAlignment.baseline,
//             children: [
//               Text(
//                 '22',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 30),
//               ),
//               Text(
//                 '%',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18),
//               ),
//             ],
//           )),
//         ],
//       ),
//     );
//   }

//   Widget starLumo(double width) {
//     return Container(
//       padding: EdgeInsets.only(left: 18, right: 70),
//       width: width - 16,
//       height: 80,
//       margin: EdgeInsets.symmetric(vertical: 12),
//       decoration: BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage("assets/imgs/Star Caard.png"), fit: BoxFit.fill),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             'Star Lumosity',
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 22,
//             ),
//           ),
//           Container(
//               child: Row(
//             crossAxisAlignment: CrossAxisAlignment.baseline,
//             children: [
//               Text(
//                 '22',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 30),
//               ),
//               Text(
//                 '%',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18),
//               ),
//             ],
//           )),
//         ],
//       ),
//     );
//   }

//   Widget moonInfo(double width) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 12),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             padding: EdgeInsets.only(right: 12),
//             alignment: Alignment.centerRight,
//             width: (width / 2) - 16,
//             height: 80,
//             margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage("assets/imgs/moon rise.png"),
//                   fit: BoxFit.fill),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Container(
//               alignment: Alignment.bottomRight,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Moon Rise',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22,
//                     ),
//                   ),
//                   Text(
//                     '8: 30 PM',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.only(left: 13),
//             alignment: Alignment.centerLeft,
//             width: (width / 2) - 16,
//             height: 80,
//             margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage("assets/imgs/moon set.png"),
//                   fit: BoxFit.fill),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Container(
//               alignment: Alignment.bottomLeft,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Moon Set',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22,
//                     ),
//                   ),
//                   Text(
//                     '8: 30 PM',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget locateMe() {
//     return Container(
//       alignment: Alignment.center,
//       height: 40,
//       width: 150,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         gradient: LinearGradient(
//           begin: Alignment.centerRight,
//           end: Alignment.centerLeft,
//           colors: [blue2, blue1],
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.location_pin,
//             color: Colors.white,
//             size: 20,
//           ),
//           SizedBox(
//             width: 5,
//           ),
//           Text(
//             'Locate Me',
//             style: TextStyle(
//                 color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget dateItem() {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.white.withOpacity(0.8),
//             offset: Offset(-6.0, -6.0),
//             blurRadius: 16.0,
//           ),
//           BoxShadow(
//             color: Colors.blue.withOpacity(0.5),
//             offset: Offset(6.0, 6.0),
//             blurRadius: 16.0,
//           ),
//         ],
//       ),
//       height: 80,
//       width: 70,
//     );
//   }

//   Widget dateItem1() {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           this.dateHi = !this.dateHi;
//         });
//       },
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
//         decoration: BoxDecoration(
//           color: dateHi ? Colors.white : Colors.transparent,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             if (dateHi)
//               BoxShadow(
//                 color: Colors.white.withOpacity(0.8),
//                 offset: Offset(-6.0, -6.0),
//                 blurRadius: 16.0,
//               ),
//             if (dateHi)
//               BoxShadow(
//                 color: Colors.blue.withOpacity(0.5),
//                 offset: Offset(6.0, 6.0),
//                 blurRadius: 16.0,
//               ),
//           ],
//         ),
//         height: 80,
//         width: 70,
//       ),
//     );
//   }

//   Widget dateSlide() {
//     return Container(
//       padding: EdgeInsets.only(left: 10),
//       margin: EdgeInsets.only(top: 5, bottom: 2),
//       height: 110,
//       child: Container(
//         child: ListView.builder(
//           itemCount: 6,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (BuildContext context, int index) {
//             DateTime dte = DateTime.now();
//             dte = dte.add(new Duration(days: index));

//             return GestureDetector(
//               child: DateSlideCard(
//                 date: dte,
//                 selecDate: selecDate,
//               ),
//               onTap: () {
//                 setState(() {
//                   this.selecDate = dte;
//                 });
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget screen2(double width) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 25,
//         ),
//         GestureDetector(
//           onTap: () {
//             screenSwitch();
//           },
//           child: Container(
//             margin: EdgeInsets.all(15),
//             alignment: Alignment.centerLeft,
//             child: GradientText(
//               'StarCast',
//               size: 36,
//               fontFamily: 'EmySlab',
//               gradient: LinearGradient(
//                 colors: [
//                   blue1,
//                   blue2,
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Icon(
//                 Icons.location_pin,
//                 size: 15,
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 currentAddress,
//                 style: TextStyle(color: primaryIndigo),
//               ),
//             ],
//           ),
//         ),
//         dateSlide(),
//         cloudCover(width - 20),
//         starLumo(width - 20),
//         moonInfo(width - 20),
//         Container(
//           margin: EdgeInsets.only(top: 20, left: 15, right: 15),
//           width: width - 20,
//           child: Text(
//             'Looks like today is a very good day to stargaze and hunt the  constellations',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: primaryIndigo,
//               fontSize: 18,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget screen1(double width) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 75,
//         ),
//         Container(
//           margin: EdgeInsets.all(15),
//           alignment: Alignment.center,
//           child: GradientText(
//             'StarCast',
//             size: 36,
//             fontFamily: 'EmySlab',
//             gradient: LinearGradient(
//               colors: [
//                 blue1,
//                 blue2,
//               ],
//             ),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.all(15),
//           decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
//             BoxShadow(
//                 color: Colors.black.withOpacity(0.2),
//                 spreadRadius: 5.0,
//                 blurRadius: 15,
//                 offset: Offset(0, 6)),
//           ]),
//           child: Image.asset(
//             "assets/imgs/Badge.png",
//             fit: BoxFit.fitHeight,
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.all(15),
//           width: width - 20,
//           child: Text(
//             'Figure out the perfect time to binge out the stars and relax under the beautiful sky',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: primaryIndigo,
//               fontSize: 18,
//             ),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.all(22),
//           child: InkWell(
//             onTap: () {
//               getCurrentLocation();
//               Timer(Duration(seconds: 1), () {
//                 screenSwitch();
//               });
//             },
//             child: locateMe(),
//           ),
//         ),
//       ],
//     );
//   }
// }
