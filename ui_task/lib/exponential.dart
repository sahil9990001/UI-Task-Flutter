import 'package:flutter/material.dart';
import 'package:ui_task/rows.dart';

import 'Api_Services/api.dart';
import 'Modal/technical_modal.dart';

class Exponential1 extends StatefulWidget {
  // final Future<List<dynamic>> items;
  String year;
  Exponential1({
    // required this.items,
    required this.year,
    Key? key,
  }) : super(key: key);

  @override
  _Exponential1State createState() => _Exponential1State();
}

class _Exponential1State extends State<Exponential1> {
  late Future<Welcome> json;
  String selectedText = 'Exponential';

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
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: Colors.black,
                  context: context,
                  builder: (context) {
                    return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: Center(child: new Text('Exponential')),
                            onTap: () {
                              setState(() {
                                selectedText = 'Exponential';
                              });
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Center(child: new Text('Simple')),
                            onTap: () {
                              setState(() {
                                selectedText = 'Simple';
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ]);
                  });
            },
            child: Container(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        selectedText,
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
        selectedText == 'Exponential'
            ? Container(
                height: 140,
                child: FutureBuilder<Welcome>(
                  future: json,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.the15Min.movingAverages
                              .tableData.exponential.length,
                          itemBuilder: (BuildContext context, int index) {
                            return RowForExponentialAndOscillators(
                              periodColor: Colors.white,
                              period: snapshot.data!.the15Min.movingAverages
                                  .tableData.exponential[index].title
                                  .substring(6),
                              value: (widget.year == '15 MIN')
                                  ? snapshot.data!.the15Min.movingAverages
                                      .tableData.exponential[index].value
                                  : (widget.year == '1 HR')
                                      ? snapshot.data!.the5Min.movingAverages
                                          .tableData.exponential[index].value
                                      : (widget.year == '1 MIN')
                                          ? snapshot
                                              .data!
                                              .the1Min
                                              .movingAverages
                                              .tableData
                                              .exponential[index]
                                              .value
                                          : (widget.year == '30 MIN')
                                              ? snapshot
                                                  .data!
                                                  .the30Min
                                                  .movingAverages
                                                  .tableData
                                                  .exponential[index]
                                                  .value
                                              : (widget.year == '5 HR')
                                                  ? snapshot
                                                      .data!
                                                      .the5Hour
                                                      .movingAverages
                                                      .tableData
                                                      .exponential[index]
                                                      .value
                                                  : (widget.year == '5 MIN')
                                                      ? snapshot
                                                          .data!
                                                          .the5Min
                                                          .movingAverages
                                                          .tableData
                                                          .exponential[index]
                                                          .value
                                                      : (widget.year == 'daily')
                                                          ? snapshot
                                                              .data!
                                                              .daily
                                                              .movingAverages
                                                              .tableData
                                                              .exponential[
                                                                  index]
                                                              .value
                                                          : (widget.year ==
                                                                  '1 MON')
                                                              ? snapshot
                                                                  .data!
                                                                  .monthly
                                                                  .movingAverages
                                                                  .tableData
                                                                  .exponential[
                                                                      index]
                                                                  .value
                                                              : snapshot
                                                                  .data!
                                                                  .weekly
                                                                  .movingAverages
                                                                  .tableData
                                                                  .exponential[
                                                                      index]
                                                                  .value,
                              type: (widget.year == '15 MIN')
                                  ? snapshot.data!.the15Min.movingAverages.tableData.exponential[index].type
                                      .substring(6)
                                  : (widget.year == '1 HR')
                                      ? snapshot.data!.the5Min.movingAverages.tableData.exponential[index].type
                                          .substring(6)
                                      : (widget.year == '1 MIN')
                                          ? snapshot
                                              .data!
                                              .the1Min
                                              .movingAverages
                                              .tableData
                                              .exponential[index]
                                              .type
                                              .substring(6)
                                          : (widget.year == '30 MIN')
                                              ? snapshot
                                                  .data!
                                                  .the30Min
                                                  .movingAverages
                                                  .tableData
                                                  .exponential[index]
                                                  .type
                                                  .substring(6)
                                              : (widget.year == '5 HR')
                                                  ? snapshot
                                                      .data!
                                                      .the5Hour
                                                      .movingAverages
                                                      .tableData
                                                      .exponential[index]
                                                      .type
                                                      .substring(6)
                                                  : (widget.year == '5 MIN')
                                                      ? snapshot
                                                          .data!
                                                          .the5Min
                                                          .movingAverages
                                                          .tableData
                                                          .exponential[index]
                                                          .type
                                                          .substring(6)
                                                      : (widget.year == 'daily')
                                                          ? snapshot
                                                              .data!
                                                              .daily
                                                              .movingAverages
                                                              .tableData
                                                              .exponential[index]
                                                              .type
                                                              .substring(6)
                                                          : (widget.year == '1 MON')
                                                              ? snapshot.data!.monthly.movingAverages.tableData.exponential[index].type.substring(6)
                                                              : snapshot.data!.weekly.movingAverages.tableData.exponential[index].type.substring(6),
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
              )
            : Container(
                height: 140,
                child: FutureBuilder<Welcome>(
                  future: json,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.the15Min.movingAverages
                              .tableData.simple.length,
                          itemBuilder: (BuildContext context, int index) {
                            return RowForExponentialAndOscillators(
                              periodColor: Colors.white,
                              period: snapshot.data!.the15Min.movingAverages
                                  .tableData.simple[index].title
                                  .substring(6),
                              value: (widget.year == '15 MIN')
                                  ? snapshot.data!.the15Min.movingAverages
                                      .tableData.simple[index].value
                                  : (widget.year == '1 HR')
                                      ? snapshot.data!.the5Min.movingAverages
                                          .tableData.simple[index].value
                                      : (widget.year == '1 MIN')
                                          ? snapshot
                                              .data!
                                              .the1Min
                                              .movingAverages
                                              .tableData
                                              .simple[index]
                                              .value
                                          : (widget.year == '30 MIN')
                                              ? snapshot
                                                  .data!
                                                  .the30Min
                                                  .movingAverages
                                                  .tableData
                                                  .simple[index]
                                                  .value
                                              : (widget.year == '5 HR')
                                                  ? snapshot
                                                      .data!
                                                      .the5Hour
                                                      .movingAverages
                                                      .tableData
                                                      .simple[index]
                                                      .value
                                                  : (widget.year == '5 MIN')
                                                      ? snapshot
                                                          .data!
                                                          .the5Min
                                                          .movingAverages
                                                          .tableData
                                                          .simple[index]
                                                          .value
                                                      : (widget.year == 'daily')
                                                          ? snapshot
                                                              .data!
                                                              .daily
                                                              .movingAverages
                                                              .tableData
                                                              .simple[index]
                                                              .value
                                                          : (widget.year ==
                                                                  '1 MON')
                                                              ? snapshot
                                                                  .data!
                                                                  .monthly
                                                                  .movingAverages
                                                                  .tableData
                                                                  .simple[index]
                                                                  .value
                                                              : snapshot
                                                                  .data!
                                                                  .weekly
                                                                  .movingAverages
                                                                  .tableData
                                                                  .simple[index]
                                                                  .value,
                              type: (widget.year == '15 MIN')
                                  ? snapshot.data!.the15Min.movingAverages
                                      .tableData.simple[index].type
                                      .substring(6)
                                  : (widget.year == '1 HR')
                                      ? snapshot.data!.the5Min.movingAverages
                                          .tableData.simple[index].type
                                          .substring(6)
                                      : (widget.year == '1 MIN')
                                          ? snapshot
                                              .data!
                                              .the1Min
                                              .movingAverages
                                              .tableData
                                              .simple[index]
                                              .type
                                              .substring(6)
                                          : (widget.year == '30 MIN')
                                              ? snapshot
                                                  .data!
                                                  .the30Min
                                                  .movingAverages
                                                  .tableData
                                                  .simple[index]
                                                  .type
                                                  .substring(6)
                                              : (widget.year == '5 HR')
                                                  ? snapshot
                                                      .data!
                                                      .the5Hour
                                                      .movingAverages
                                                      .tableData
                                                      .simple[index]
                                                      .type
                                                      .substring(6)
                                                  : (widget.year == '5 MIN')
                                                      ? snapshot
                                                          .data!
                                                          .the5Min
                                                          .movingAverages
                                                          .tableData
                                                          .simple[index]
                                                          .type
                                                          .substring(6)
                                                      : (widget.year == 'daily')
                                                          ? snapshot.data!.daily.movingAverages.tableData.simple[index].type.substring(6)
                                                          : (widget.year == '1 MON')
                                                              ? snapshot.data!.monthly.movingAverages.tableData.simple[index].type.substring(6)
                                                              : snapshot.data!.weekly.movingAverages.tableData.simple[index].type.substring(6),
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
