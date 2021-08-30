import 'package:flutter/material.dart';

class RowForExponentialAndOscillators extends StatelessWidget {
  String period;
  String value;
  String type;
  Color typeColor;
  Color periodColor;
  RowForExponentialAndOscillators({
    required this.periodColor,
    required this.period,
    required this.value,
    required this.type,
    required this.typeColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(children: [
          TableRow(children: [
            Text(
              period,
              style: TextStyle(fontSize: 10, color: periodColor),
            ),
            Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  value,
                  style: TextStyle(fontSize: 10),
                )),
            Padding(
                padding: EdgeInsets.only(left: 65),
                child: Text(
                  type,
                  style: TextStyle(fontSize: 10, color: typeColor),
                )),
          ]),
        ]));
  }
}
