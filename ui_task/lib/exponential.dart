import 'package:flutter/material.dart';
import 'package:ui_task/rows.dart';

class Exponential extends StatelessWidget {
  const Exponential({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Exponential',
                      style: TextStyle(fontSize: 13),
                    ),
                    Icon(
                      Icons.arrow_drop_down_outlined,
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[900]),
              height: 35,
              width: 125),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Period',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  Text(
                    'Value',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      'Type',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[900]),
            height: 30,
            width: MediaQuery.of(context).size.width * 0.9),
        SizedBox(height: 10),
        RowForExponentialAndOscillators(
          periodColor: Colors.white,
          period: 'MA10',
          value: '465.28',
          type: 'SELL',
          typeColor: Colors.red,
        ),
        SizedBox(height: 10),
        RowForExponentialAndOscillators(
          periodColor: Colors.white,
          period: 'MA20',
          value: '465.28',
          type: 'SELL',
          typeColor: Colors.red,
        ),
        SizedBox(height: 10),
        RowForExponentialAndOscillators(
          periodColor: Colors.white,
          period: 'MA30',
          value: '465.28',
          type: 'BUY',
          typeColor: Colors.blue,
        ),
        SizedBox(height: 10),
        RowForExponentialAndOscillators(
          periodColor: Colors.white,
          period: 'MA50',
          value: '465.28',
          type: 'BUY',
          typeColor: Colors.blue,
        ),
        SizedBox(height: 10),
        RowForExponentialAndOscillators(
          periodColor: Colors.white,
          period: 'MA100',
          value: '465.28',
          type: 'SELL',
          typeColor: Colors.red,
        ),
        SizedBox(height: 10),
        RowForExponentialAndOscillators(
          periodColor: Colors.white,
          period: 'MA200',
          value: '465.28',
          type: 'BUY',
          typeColor: Colors.blue,
        ),
      ],
    );
  }
}
