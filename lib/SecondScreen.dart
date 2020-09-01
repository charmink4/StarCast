import 'package:StarCast/GradientText.dart';
import 'package:StarCast/WeatherResponseModel.dart';
import 'package:StarCast/appColors.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'DateSlideCard.dart';

class SecondScreen extends StatefulWidget {
  WeatherResponseModel respData;
  String location;

  SecondScreen({@required this.respData, this.location});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position currentPosition;
  String currentAddress = "";
  bool screen;
  bool dateHi;
  DateTime selecDate;
  String starLumos = '22';
  DateFormat dteFormatter = DateFormat('EEEE, MMMM d');
  DateFormat timeFormatter = DateFormat('hh:mm a');
  String moonRiseTime;
  String moonSetTime;
  String cloudCoverVal;
  String comment;

  @override
  void initState() {
    this.screen = true;
    this.dateHi = false;
    this.selecDate = DateTime.now();
    this.currentAddress = widget.location;
    this.currentAddress = '';
    getValues(this.selecDate);
    super.initState();
  }

  void getValues(DateTime date) {
    setState(() {
      widget.respData.forecast.forEach((element) {
        if (element.date
                .toString()
                .substring(0, element.date.toString().length - 2) ==
            dteFormatter.format(date)) {
          starLumos = (100 - int.parse(element.moonillumination)).toString();
          DateTime val1 = DateTime.parse(
              "2012-02-27 " + element.moonrise.toString() + ":00");
          DateTime val2 = DateTime.parse(
              "2012-02-27 " + element.moonset.toString() + ":00");
          moonRiseTime = timeFormatter.format(val1).toString();
          moonSetTime = timeFormatter.format(val2).toString();
          int totalCloudCover = 0;
          int length = element.cloudcover.length;
          element.cloudcover.forEach((element) {
            totalCloudCover = totalCloudCover + element.cover;
            // if (element.time == '20:30') {
            //   cloudCoverVal = element.cover.toString();
            // }
          });
          //cloudCoverVal = element.cloudcover.elementAt(1).cover.toString();
          double avgCloudCover = totalCloudCover / length;
          cloudCoverVal = avgCloudCover.toInt().toString();
          if (int.parse(cloudCoverVal) < 25 && int.parse(starLumos) > 40) {
            comment =
                "Looks like today is a very good day to stargaze and hunt the constellations";
          } else if (int.parse(cloudCoverVal) > 40) {
            comment =
                "Seems as though a thick blanket of cloud's underway and it's going to hide all the stars!";
          } else {
            comment =
                "It's not ideal, but you might still spot a few stars amidst the scarcely scattered clouds today!";
          }
        }
      });
    });
  }

  Widget cloudCover(double width) {
    return Container(
      padding: EdgeInsets.only(left: 18, right: 70),
      width: width - 16,
      height: 80,
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/imgs/Cloud Card.png"),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Cloud Cover',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          Container(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(
                cloudCoverVal,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Text(
                '%',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ],
          )),
        ],
      ),
    );
  }

  Widget starLumo(double width) {
    return Container(
      padding: EdgeInsets.only(left: 18, right: 70),
      width: width - 16,
      height: 80,
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/imgs/Star Caard.png"), fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Star Lumosity',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          Container(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(
                starLumos,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Text(
                '%',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ],
          )),
        ],
      ),
    );
  }

  Widget moonInfo(double width) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(right: 12),
            alignment: Alignment.centerRight,
            width: (width / 2) - 16,
            height: 80,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/imgs/moon rise.png"),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              alignment: Alignment.bottomRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Moon Rise',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    moonRiseTime,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 13),
            alignment: Alignment.centerLeft,
            width: (width / 2) - 16,
            height: 80,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/imgs/moon set.png"),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Moon Set',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    moonSetTime,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dateSlide() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.only(top: 5, bottom: 2),
      height: 110,
      child: Container(
        child: ListView.builder(
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            DateTime dte = DateTime.now();
            dte = dte.add(new Duration(days: index));

            return GestureDetector(
              child: DateSlideCard(
                date: dte,
                selecDate: selecDate,
              ),
              onTap: () {
                setState(() {
                  this.selecDate = dte;
                });
                getValues(this.selecDate);
              },
            );
          },
        ),
      ),
    );
  }

  Widget getBody(double width) {
    return Column(
      children: [
        SizedBox(
          height: 25,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(15),
            alignment: Alignment.centerLeft,
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
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.location_pin,
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                widget.location,
                style: TextStyle(color: primaryIndigo),
              ),
            ],
          ),
        ),
        dateSlide(),
        cloudCover(width - 20),
        starLumo(width - 20),
        moonInfo(width - 20),
        Container(
          margin: EdgeInsets.only(top: 20, left: 15, right: 15),
          width: width - 20,
          child: Text(
            comment,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: primaryIndigo,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
          body: getBody(width),
        ),
      ),
    );
  }
}
