import 'package:flutter/material.dart';

class AveragesAndOsillators extends StatelessWidget {
  String buy;
  String neutral;
  String sell;
  String heading;
  Color boxColor;
  String boxText;
  double boxWidth;
  AveragesAndOsillators({
    required this.heading,
    required this.buy,
    required this.neutral,
    required this.sell,
    required this.boxColor,
    required this.boxText,
    required this.boxWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text(heading)),
        SizedBox(height: 20),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Text(
                    boxText,
                    style: TextStyle(fontSize: 9, color: Colors.white),
                  ),
                )),
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 30,
                width: boxWidth),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(buy),
                  Text(
                    'Buy',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  )
                ],
              ),
              Column(
                children: [
                  Text(neutral),
                  Text(
                    'Neutral',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  )
                ],
              ),
              Column(
                children: [
                  Text(sell),
                  Text(
                    'Sell',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
