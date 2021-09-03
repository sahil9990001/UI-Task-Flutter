import 'package:flutter/material.dart';
import 'package:ui_task/pivotTable.dart';
import 'Api_Services/api.dart';
import 'Modal/technical_modal.dart';
import 'Oscillator_table.dart';
import 'averages&oscillators.dart';
import 'exponential.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Task',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // MyHomePage(this.json);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Welcome> json;
  // late Welcome welcome;

  @override
  void initState() {
    super.initState();
    json = ApiServices.fetchInfo();
    print(json);
    // welcome = Welcome.fromJson(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 35),
              Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 16,
                  ),
                  SizedBox(width: 25),
                  Text(
                    'USD / INR',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 35),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Technical Indicators',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[900]),
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.9),
              SizedBox(height: 35),
              Center(child: Text('Summary')),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container1(color: Colors.lightBlueAccent, width: 7),
                      Container1(color: Colors.blueAccent, width: 7),
                      Padding(
                        padding: EdgeInsets.only(left: 84.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container1(color: Colors.orangeAccent, width: 10),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                    height: 7,
                                    width: 4,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)),
                                        color: Colors.amber)),
                                Container(
                                  height: 35,
                                  width: 70,
                                  child: Center(
                                      child: Text(
                                    'NEUTRAL',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.amber),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container1(color: Colors.red.shade900, width: 7),
                      Container1(color: Colors.red, width: 7),
                    ],
                  ),
                  Column(
                    children: [
                      Container2(text: '15 Min', color: Colors.white),
                      Container2(text: '5 MIN', color: Colors.grey),
                      Container2(text: '15 MIN', color: Colors.grey),
                      Container2(text: '30 MIN', color: Colors.grey),
                      Container2(text: '1 HR', color: Colors.grey),
                      Container2(text: '5 HR', color: Colors.grey),
                      Container2(text: '1 DAY', color: Colors.grey),
                      Container2(text: '1 WK', color: Colors.grey),
                      Container2(text: '1 MON', color: Colors.grey),
                    ],
                  )
                ],
              ),
              SizedBox(height: 35),
              FutureBuilder<Welcome>(
                future: json,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return AveragesAndOsillators(
                      heading: 'Moving Averages',
                      boxText: 'BUY',
                      buy: snapshot.data!.the15Min.movingAverages.buy,
                      neutral:
                          snapshot.data!.the15Min.movingAverages.Text1 == 'null'
                              ? '-'
                              : snapshot.data!.the15Min.movingAverages.Text1,
                      sell: snapshot.data!.the15Min.movingAverages.sell,
                      boxColor: Colors.blue,
                      boxWidth: 40,
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return Text('Loading.....');
                },
              ),
              SizedBox(height: 10),
              Exponential1(),
              SizedBox(height: 30),
              FutureBuilder<Welcome>(
                future: json,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return AveragesAndOsillators(
                      heading: 'Oscillators',
                      boxText: 'STRONG SELL',
                      buy: snapshot.data!.the15Min.technicalIndicator.buy,
                      neutral:
                          snapshot.data!.the15Min.technicalIndicator.neutral,
                      sell: snapshot.data!.the15Min.technicalIndicator.sell,
                      boxColor: Colors.red,
                      boxWidth: 75,
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return Text('Loading.....');
                },
              ),
              SizedBox(height: 10),
              TableForOscillators(),
              SizedBox(height: 20),
              PivotPoints1(),
              SizedBox(height: 30),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Container1 extends StatelessWidget {
  Color color;
  double width;
  Container1({required this.color, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: color), height: 60, width: width);
  }
}

class Container2 extends StatelessWidget {
  String text;
  Color color;
  Container2({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
          child: Center(
              child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 9, color: color),
            ),
          )),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: color)),
          height: 30,
          width: 50),
    );
  }
}
