import 'package:flutter/material.dart';
import 'package:ui_task/rows.dart';

import 'Api_Services/api.dart';
import 'Modal/technical_modal.dart';

class Exponential1 extends StatefulWidget {
  // final Future<List<dynamic>> items;
  Exponential1({
    // required this.items,
    Key? key,
  }) : super(key: key);

  @override
  _Exponential1State createState() => _Exponential1State();
}

class _Exponential1State extends State<Exponential1> {
  late Future<Welcome> json;

  @override
  void initState() {
    super.initState();
    json = ApiServices.fetchInfo();
    // welcome = Welcome.fromJson(json);
  }

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
        // SizedBox(height: 10),
        Container(
          height: 140,
          child: FutureBuilder<Welcome>(
            future: json,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.the15Min.movingAverages.tableData
                        .exponential.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RowForExponentialAndOscillators(
                        periodColor: Colors.white,
                        period: snapshot.data!.the15Min.movingAverages.tableData
                            .exponential[index].title,
                        value: snapshot.data!.the15Min.movingAverages.tableData
                            .exponential[index].value,
                        type: snapshot.data!.the15Min.movingAverages.tableData
                            .exponential[index].type
                            .substring(6),
                        typeColor: Colors.red,
                      );
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return Text('Loading.....');
            },
          ),
        ),
      ],
    );
  }
}
