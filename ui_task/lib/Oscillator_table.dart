import 'package:flutter/material.dart';
import 'package:ui_task/Api_Services/api.dart';
import 'package:ui_task/rows.dart';

import 'Modal/technical_modal.dart';

class TableForOscillators extends StatefulWidget {
  String year;
  TableForOscillators({
    required this.year,
    Key? key,
  }) : super(key: key);

  @override
  _TableForOscillatorsState createState() => _TableForOscillatorsState();
}

class _TableForOscillatorsState extends State<TableForOscillators> {
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
        Container(
          height: 140,
          child: FutureBuilder<Welcome>(
            future: json,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot
                        .data!.the15Min.technicalIndicator.tableData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RowForExponentialAndOscillators(
                          periodColor: Colors.grey,
                          period: snapshot.data!.the15Min.technicalIndicator
                              .tableData[index].name,
                          value: (widget.year == '15 MIN')
                              ? snapshot.data!.the15Min.technicalIndicator
                                  .tableData[index].value
                              : (widget.year == '1 HR')
                                  ? snapshot.data!.the5Min.technicalIndicator
                                      .tableData[index].value
                                  : (widget.year == '1 MIN')
                                      ? snapshot
                                          .data!
                                          .the1Min
                                          .technicalIndicator
                                          .tableData[index]
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
                                                  .technicalIndicator
                                                  .tableData[index]
                                                  .value
                                              : (widget.year == '5 MIN')
                                                  ? snapshot
                                                      .data!
                                                      .the5Min
                                                      .technicalIndicator
                                                      .tableData[index]
                                                      .value
                                                  : (widget.year == 'daily')
                                                      ? snapshot
                                                          .data!
                                                          .daily
                                                          .technicalIndicator
                                                          .tableData[index]
                                                          .value
                                                      : (widget.year == '1 MON')
                                                          ? snapshot
                                                              .data!
                                                              .monthly
                                                              .technicalIndicator
                                                              .tableData[index]
                                                              .value
                                                          : snapshot
                                                              .data!
                                                              .weekly
                                                              .technicalIndicator
                                                              .tableData[index]
                                                              .value,
                          type: (widget.year == '15 MIN')
                              ? snapshot.data!.the15Min.technicalIndicator
                                  .tableData[index].action
                                  .substring(6)
                              : (widget.year == '1 HR')
                                  ? snapshot.data!.the5Min.technicalIndicator
                                      .tableData[index].action
                                      .substring(6)
                                  : (widget.year == '1 MIN')
                                      ? snapshot
                                          .data!
                                          .the1Min
                                          .technicalIndicator
                                          .tableData[index]
                                          .action
                                          .substring(6)
                                      : (widget.year == '30 MIN')
                                          ? snapshot
                                              .data!
                                              .the30Min
                                              .technicalIndicator
                                              .tableData[index]
                                              .action
                                              .substring(6)
                                          : (widget.year == '5 HR')
                                              ? snapshot.data!.the5Hour.technicalIndicator.tableData[index].action.substring(6)
                                              : (widget.year == '5 MIN')
                                                  ? snapshot.data!.the5Min.technicalIndicator.tableData[index].action.substring(6)
                                                  : (widget.year == 'daily')
                                                      ? snapshot.data!.daily.technicalIndicator.tableData[index].action.substring(6)
                                                      : (widget.year == '1 MON')
                                                          ? snapshot.data!.monthly.technicalIndicator.tableData[index].action.substring(6)
                                                          : snapshot.data!.weekly.technicalIndicator.tableData[index].action.substring(6),
                          typeColor: Colors.orangeAccent);
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
