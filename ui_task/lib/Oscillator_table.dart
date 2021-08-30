import 'package:flutter/material.dart';
import 'package:ui_task/rows.dart';

class TableForOscillators extends StatelessWidget {
  const TableForOscillators({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    Text(
                      'Value',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    Text(
                      'Action',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[900]),
              height: 30,
              width: MediaQuery.of(context).size.width * 0.9),
        ),
        SizedBox(height: 10),
        RowForExponentialAndOscillators(
            periodColor: Colors.grey,
            period: 'RSI(14)',
            value: '-53.6549',
            type: 'NEUTRAL',
            typeColor: Colors.orangeAccent),
        SizedBox(height: 10),
        RowForExponentialAndOscillators(
            periodColor: Colors.grey,
            period: 'CCI(20)',
            value: '-53.6549',
            type: 'SELL',
            typeColor: Colors.red),
        SizedBox(height: 10),
        RowForExponentialAndOscillators(
            periodColor: Colors.grey,
            period: 'ADI(14)',
            value: '-53.6549',
            type: 'BUY',
            typeColor: Colors.blue),
        SizedBox(height: 10),
        RowForExponentialAndOscillators(
            periodColor: Colors.grey,
            period: 'Awesome \n Oscillator',
            value: '-53.6549',
            type: 'SELL',
            typeColor: Colors.red),
        SizedBox(height: 10),
        RowForExponentialAndOscillators(
            periodColor: Colors.grey,
            period: 'Momentum (10)',
            value: '-53.6549',
            type: 'SELL',
            typeColor: Colors.red),
        SizedBox(height: 10),
        RowForExponentialAndOscillators(
            periodColor: Colors.grey,
            period: 'Stochastic RSI \n Fast (3,3,14,14)',
            value: '-53.6549',
            type: 'SELL',
            typeColor: Colors.red),
        SizedBox(height: 10),
        RowForExponentialAndOscillators(
            periodColor: Colors.grey,
            period: 'Williams %R \n (14)',
            value: '-53.6549',
            type: 'SELL',
            typeColor: Colors.red),
        SizedBox(height: 10),
        RowForExponentialAndOscillators(
            periodColor: Colors.grey,
            period: 'Bull Bear \n Power',
            value: '-53.6549',
            type: 'SELL',
            typeColor: Colors.red),
        SizedBox(height: 10),
        RowForExponentialAndOscillators(
            periodColor: Colors.grey,
            period: 'Ultimate Oscillators \n (7,14,28)',
            value: '-53.6549',
            type: 'LESS VOLATAILE',
            typeColor: Colors.grey),
      ],
    );
  }
}
