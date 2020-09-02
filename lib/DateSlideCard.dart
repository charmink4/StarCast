import 'package:StarCast/appColors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSlideCard extends StatefulWidget {
  final DateTime date;
  final DateTime selecDate;

  DateSlideCard({this.date, this.selecDate});
  @override
  _DateSlideCardState createState() => _DateSlideCardState();
}

class _DateSlideCardState extends State<DateSlideCard> {
  //DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      decoration: BoxDecoration(
        color: widget.selecDate.day == widget.date.day
            ? Colors.white
            : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          if (widget.selecDate.day == widget.date.day)
            BoxShadow(
              color: Colors.white.withOpacity(0.8),
              offset: Offset(-6.0, -6.0),
              blurRadius: 16.0,
            ),
          if (widget.selecDate.day == widget.date.day)
            BoxShadow(
              color: Colors.blue.withOpacity(0.5),
              offset: Offset(6.0, 6.0),
              blurRadius: 16.0,
            ),
        ],
      ),
      height: 80,
      width: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Text(
              DateFormat('EEEE')
                  .format(widget.date)
                  .toString()
                  .toUpperCase()
                  .substring(0, 3),
              style: TextStyle(
                letterSpacing: 1.0,
                color: primaryIndigo,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            height: 30,
          ),
          Container(
            alignment: Alignment.topCenter,
            height: 50,
            child: Text(
              widget.date.day.toString(),
              style: TextStyle(
                letterSpacing: -1.0,
                color: primaryIndigo,
                fontWeight: FontWeight.w100,
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
