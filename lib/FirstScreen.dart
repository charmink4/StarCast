import 'dart:async';
//import 'dart:html';

import 'package:StarCast/GradientText.dart';
import 'package:StarCast/SecondScreen.dart';
import 'package:StarCast/WeatherResponseModel.dart';
import 'package:StarCast/appColors.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:location/location.dart' as loc;
import 'package:lottie/lottie.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  SnackBar snackBar = SnackBar(content: Text('Oops, Something went wrong!'));

  Position currentPosition;
  String currentAddress = 'LOL dint work';
  bool screen;
  bool dateHi;
  DateTime selecDate;
  Placemark currPLace;
  loc.Location location = loc.Location();
  loc.PermissionStatus _permissionGranted;
  bool showLoader;

  @override
  void initState() {
    this.showLoader = false;

    super.initState();
  }

  void showSnackBar(String message) {
    snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  Future<void> _checkPermissions() async {
    //showSnackBar('Working');
    final loc.PermissionStatus permissionGrantedResult =
        await location.hasPermission();
    if (permissionGrantedResult == loc.PermissionStatus.granted) {
      //this.checkBluetoothStatus();
      getCurrentLocation();
    } else {
      this._requestPermission();
    }
  }

  Future<void> _requestPermission() async {
    if (_permissionGranted != loc.PermissionStatus.granted) {
      final loc.PermissionStatus permissionRequestedResult =
          await location.requestPermission();
      if (permissionRequestedResult == loc.PermissionStatus.granted) {
        _checkPermissions();
      } else {
        showSnackBar('We need location permission, please allow and try again');
        // setState(() {
        //   this.isLocationDenied = true;
        // });
      }
    }
  }

  Widget locateMe() {
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [blue2, blue1],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.location_pin,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Locate Me',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  getCurrentLocation() {
    setState(() {
      showLoader = true;
    });

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      currentPosition = position;

      // navigateToLoading(currentPosition, currentAddress);

      //loading screen

      getData(currentPosition.latitude.toString(),
          currentPosition.longitude.toString());

      //put this in second screen
    }).catchError((e) {
      showSnackBar('Not able to find location, Try again!');
      setState(() {
        showLoader = false;
      });
      print(e);
    });
  }

  getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          currentPosition.latitude, currentPosition.longitude);

      Placemark place = p[0];
      setState(() {
        currentAddress = "${place.locality}, ${place.country}";
      });
    } catch (e) {
      setState(() {
        showLoader = false;
      });
      print(e);
    }
  }

  getData(
    String lat,
    String long,
  ) async {
    getAddressFromLatLng();
    var url =
        "https://dfo66vzjqa.execute-api.us-east-1.amazonaws.com/prod?lat=$lat&lon=$long";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      //hide load
      var jsonResponse = convert.jsonDecode(response.body);
      var responseModel = WeatherResponseModel.fromMap(jsonResponse);
      navigateToScreen2(responseModel, currentAddress);
      // this.showLoader = false;
      setState(() {
        this.showLoader = false;
      });

      print(jsonResponse);
    } else {
      setState(() {
        this.showLoader = false;
      });
      showSnackBar('Request failed with status: ${response.statusCode}');
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void navigateToScreen2(WeatherResponseModel resp, String address) {
    Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) =>
              new SecondScreen(respData: resp, location: address)),
    );
  }

  // void navigateToLoading(Position currPosition, String address) {
  //   Navigator.push(
  //     context,
  //     new MaterialPageRoute(
  //         builder: (context) => new LoadingScreen(
  //               currentPosition: currPosition,
  //               currentAddress: address,
  //             )),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return showLoader
        ? Container(
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assets/imgs/BG.png"), fit: BoxFit.fill),
            ),
            //color: Colors.white,
            child: Center(
              child: Lottie.asset(
                // width
                'assets/animations/starLoader.json',
                fit: BoxFit.fill,
              ),
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.all(15),
                alignment: Alignment.center,
                child: GradientText(
                  'StarCast',
                  size: 36,
                  fontFamily: 'EmySlab',
                  gradient: LinearGradient(
                    colors: [
                      blue1,
                      blue2,
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5.0,
                      blurRadius: 15,
                      offset: Offset(0, 6)),
                ]),
                child: Image.asset(
                  "assets/imgs/Badge.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                width: width - 20,
                child: Text(
                  'Figure out the perfect time to binge out the stars and relax under the beautiful sky',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: primaryIndigo,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(22),
                child: InkWell(
                  onTap: () async {
                    _checkPermissions();
                    //getCurrentLocation();
                  },
                  child: locateMe(),
                ),
              ),
            ],
          );
  }
}
