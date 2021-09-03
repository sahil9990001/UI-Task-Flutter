import 'package:flutter/material.dart';
import 'package:ui_task/Api_Services/api.dart';

import 'Modal/technical_modal.dart';

class PivotPoints1 extends StatefulWidget {
  String year;
  PivotPoints1({
    required this.year,
    Key? key,
  }) : super(key: key);

  @override
  _PivotPoints1State createState() => _PivotPoints1State();
}

class _PivotPoints1State extends State<PivotPoints1> {
  late Future<Welcome> json;
  String selectedText = 'Classic';
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
          child: Text('Pivot Points'),
        ),
        SizedBox(height: 30),
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
                            title: Center(child: new Text('Classic')),
                            onTap: () {
                              setState(() {
                                selectedText = 'Classic';
                              });
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Center(child: new Text('Fabonacci')),
                            onTap: () {
                              setState(() {
                                selectedText = 'Fabonacci';
                              });
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Center(child: new Text('Camarilla')),
                            onTap: () {
                              setState(() {
                                selectedText = 'Camarilla';
                              });
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Center(child: new Text("Woodie's")),
                            onTap: () {
                              setState(() {
                                selectedText = "Woodie's";
                              });
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Center(child: new Text("DeMark's")),
                            onTap: () {
                              setState(() {
                                selectedText = "DeMark's";
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
        FutureBuilder<Welcome>(
          future: json,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'S3',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        selectedText == 'Classic'
                            ? Text(
                                (widget.year == '15 MIN')
                                    ? snapshot
                                        .data!.the15Min.pivotPoints.classic.s3
                                    : (widget.year == '1 HR')
                                        ? snapshot.data!.the5Min.pivotPoints
                                            .classic.s3
                                        : (widget.year == '1 MIN')
                                            ? snapshot.data!.the1Min.pivotPoints
                                                .classic.s3
                                            : (widget.year == '30 MIN')
                                                ? snapshot.data!.the30Min
                                                    .pivotPoints.classic.s3
                                                : (widget.year == '5 HR')
                                                    ? snapshot.data!.the5Hour
                                                        .pivotPoints.classic.s3
                                                    : (widget.year == '5 MIN')
                                                        ? snapshot
                                                            .data!
                                                            .the5Min
                                                            .pivotPoints
                                                            .classic
                                                            .s3
                                                        : (widget.year ==
                                                                'daily')
                                                            ? snapshot
                                                                .data!
                                                                .daily
                                                                .pivotPoints
                                                                .classic
                                                                .s3
                                                            : (widget.year ==
                                                                    '1 MON')
                                                                ? snapshot
                                                                    .data!
                                                                    .monthly
                                                                    .pivotPoints
                                                                    .classic
                                                                    .s3
                                                                : snapshot
                                                                    .data!
                                                                    .weekly
                                                                    .pivotPoints
                                                                    .classic
                                                                    .s3,
                                style: TextStyle(fontSize: 12),
                              )
                            : (selectedText == "DeMark's")
                                ? Text(
                                    (widget.year == '15 MIN')
                                        ? snapshot.data!.the15Min.pivotPoints
                                            .demark.s3
                                        : (widget.year == '1 HR')
                                            ? snapshot.data!.the5Min.pivotPoints
                                                .demark.s3
                                            : (widget.year == '1 MIN')
                                                ? snapshot.data!.the1Min
                                                    .pivotPoints.demark.s3
                                                : (widget.year == '30 MIN')
                                                    ? snapshot.data!.the30Min
                                                        .pivotPoints.demark.s3
                                                    : (widget.year == '5 HR')
                                                        ? snapshot
                                                            .data!
                                                            .the5Hour
                                                            .pivotPoints
                                                            .demark
                                                            .s3
                                                        : (widget.year ==
                                                                '5 MIN')
                                                            ? snapshot
                                                                .data!
                                                                .the5Min
                                                                .pivotPoints
                                                                .demark
                                                                .s3
                                                            : (widget.year ==
                                                                    'daily')
                                                                ? snapshot
                                                                    .data!
                                                                    .daily
                                                                    .pivotPoints
                                                                    .demark
                                                                    .s3
                                                                : (widget.year ==
                                                                        '1 MON')
                                                                    ? snapshot
                                                                        .data!
                                                                        .monthly
                                                                        .pivotPoints
                                                                        .demark
                                                                        .s3
                                                                    : snapshot
                                                                        .data!
                                                                        .weekly
                                                                        .pivotPoints
                                                                        .demark
                                                                        .s3,
                                    style: TextStyle(fontSize: 12),
                                  )
                                : (selectedText == 'Fabonacci')
                                    ? Text(
                                        (widget.year == '15 MIN')
                                            ? snapshot.data!.the15Min
                                                .pivotPoints.fibonacci.s3
                                            : (widget.year == '1 HR')
                                                ? snapshot.data!.the5Min
                                                    .pivotPoints.fibonacci.s3
                                                : (widget.year == '1 MIN')
                                                    ? snapshot
                                                        .data!
                                                        .the1Min
                                                        .pivotPoints
                                                        .fibonacci
                                                        .s3
                                                    : (widget.year == '30 MIN')
                                                        ? snapshot
                                                            .data!
                                                            .the30Min
                                                            .pivotPoints
                                                            .fibonacci
                                                            .s3
                                                        : (widget.year ==
                                                                '5 HR')
                                                            ? snapshot
                                                                .data!
                                                                .the5Hour
                                                                .pivotPoints
                                                                .fibonacci
                                                                .s3
                                                            : (widget.year ==
                                                                    '5 MIN')
                                                                ? snapshot
                                                                    .data!
                                                                    .the5Min
                                                                    .pivotPoints
                                                                    .fibonacci
                                                                    .s3
                                                                : (widget.year ==
                                                                        'daily')
                                                                    ? snapshot
                                                                        .data!
                                                                        .daily
                                                                        .pivotPoints
                                                                        .fibonacci
                                                                        .s3
                                                                    : (widget.year ==
                                                                            '1 MON')
                                                                        ? snapshot
                                                                            .data!
                                                                            .monthly
                                                                            .pivotPoints
                                                                            .fibonacci
                                                                            .s3
                                                                        : snapshot
                                                                            .data!
                                                                            .weekly
                                                                            .pivotPoints
                                                                            .fibonacci
                                                                            .s3,
                                        style: TextStyle(fontSize: 12),
                                      )
                                    : Text(
                                        (widget.year == '15 MIN')
                                            ? snapshot.data!.the15Min
                                                .pivotPoints.camarilla.s3
                                            : (widget.year == '1 HR')
                                                ? snapshot.data!.the5Min
                                                    .pivotPoints.camarilla.s3
                                                : (widget.year == '1 MIN')
                                                    ? snapshot
                                                        .data!
                                                        .the1Min
                                                        .pivotPoints
                                                        .camarilla
                                                        .s3
                                                    : (widget.year == '30 MIN')
                                                        ? snapshot
                                                            .data!
                                                            .the30Min
                                                            .pivotPoints
                                                            .camarilla
                                                            .s3
                                                        : (widget.year ==
                                                                '5 HR')
                                                            ? snapshot
                                                                .data!
                                                                .the5Hour
                                                                .pivotPoints
                                                                .camarilla
                                                                .s3
                                                            : (widget.year ==
                                                                    '5 MIN')
                                                                ? snapshot
                                                                    .data!
                                                                    .the5Min
                                                                    .pivotPoints
                                                                    .camarilla
                                                                    .s3
                                                                : (widget.year ==
                                                                        'daily')
                                                                    ? snapshot
                                                                        .data!
                                                                        .daily
                                                                        .pivotPoints
                                                                        .camarilla
                                                                        .s3
                                                                    : (widget.year ==
                                                                            '1 MON')
                                                                        ? snapshot
                                                                            .data!
                                                                            .monthly
                                                                            .pivotPoints
                                                                            .camarilla
                                                                            .s3
                                                                        : snapshot
                                                                            .data!
                                                                            .weekly
                                                                            .pivotPoints
                                                                            .camarilla
                                                                            .s3,
                                        style: TextStyle(fontSize: 12),
                                      )
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'S2',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Text(
                          (widget.year == '15 MIN')
                              ? snapshot.data!.the15Min.pivotPoints.classic.s2
                              : (widget.year == '1 HR')
                                  ? snapshot
                                      .data!.the5Min.pivotPoints.classic.s2
                                  : (widget.year == '1 MIN')
                                      ? snapshot
                                          .data!.the1Min.pivotPoints.classic.s2
                                      : (widget.year == '30 MIN')
                                          ? snapshot.data!.the30Min.pivotPoints
                                              .classic.s2
                                          : (widget.year == '5 HR')
                                              ? snapshot.data!.the5Hour
                                                  .pivotPoints.classic.s2
                                              : (widget.year == '5 MIN')
                                                  ? snapshot.data!.the5Min
                                                      .pivotPoints.classic.s2
                                                  : (widget.year == 'daily')
                                                      ? snapshot
                                                          .data!
                                                          .daily
                                                          .pivotPoints
                                                          .classic
                                                          .s2
                                                      : (widget.year == '1 MON')
                                                          ? snapshot
                                                              .data!
                                                              .monthly
                                                              .pivotPoints
                                                              .classic
                                                              .s2
                                                          : snapshot
                                                              .data!
                                                              .weekly
                                                              .pivotPoints
                                                              .classic
                                                              .s2,
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'S1',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Text(
                          (widget.year == '15 MIN')
                              ? snapshot.data!.the15Min.pivotPoints.classic.s1
                              : (widget.year == '1 HR')
                                  ? snapshot
                                      .data!.the5Min.pivotPoints.classic.s1
                                  : (widget.year == '1 MIN')
                                      ? snapshot
                                          .data!.the1Min.pivotPoints.classic.s1
                                      : (widget.year == '30 MIN')
                                          ? snapshot.data!.the30Min.pivotPoints
                                              .classic.s1
                                          : (widget.year == '5 HR')
                                              ? snapshot.data!.the5Hour
                                                  .pivotPoints.classic.s1
                                              : (widget.year == '5 MIN')
                                                  ? snapshot.data!.the5Min
                                                      .pivotPoints.classic.s1
                                                  : (widget.year == 'daily')
                                                      ? snapshot
                                                          .data!
                                                          .daily
                                                          .pivotPoints
                                                          .classic
                                                          .s1
                                                      : (widget.year == '1 MON')
                                                          ? snapshot
                                                              .data!
                                                              .monthly
                                                              .pivotPoints
                                                              .classic
                                                              .s1
                                                          : snapshot
                                                              .data!
                                                              .weekly
                                                              .pivotPoints
                                                              .classic
                                                              .s1,
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pivot Points',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Text(
                          (widget.year == '15 MIN')
                              ? snapshot.data!.the15Min.pivotPoints.classic
                                  .pivotPoints
                              : (widget.year == '1 HR')
                                  ? snapshot.data!.the5Min.pivotPoints.classic
                                      .pivotPoints
                                  : (widget.year == '1 MIN')
                                      ? snapshot.data!.the1Min.pivotPoints
                                          .classic.pivotPoints
                                      : (widget.year == '30 MIN')
                                          ? snapshot.data!.the30Min.pivotPoints
                                              .classic.s3
                                          : (widget.year == '5 HR')
                                              ? snapshot.data!.the5Hour
                                                  .pivotPoints.classic.s3
                                              : (widget.year == '5 MIN')
                                                  ? snapshot.data!.the5Min
                                                      .pivotPoints.classic.s3
                                                  : (widget.year == 'daily')
                                                      ? snapshot
                                                          .data!
                                                          .daily
                                                          .pivotPoints
                                                          .classic
                                                          .pivotPoints
                                                      : (widget.year == '1 MON')
                                                          ? snapshot
                                                              .data!
                                                              .monthly
                                                              .pivotPoints
                                                              .classic
                                                              .pivotPoints
                                                          : snapshot
                                                              .data!
                                                              .weekly
                                                              .pivotPoints
                                                              .classic
                                                              .pivotPoints,
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'R1',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Text(
                          (widget.year == '15 MIN')
                              ? snapshot.data!.the15Min.pivotPoints.classic.r1
                              : (widget.year == '1 HR')
                                  ? snapshot
                                      .data!.the5Min.pivotPoints.classic.r1
                                  : (widget.year == '1 MIN')
                                      ? snapshot
                                          .data!.the1Min.pivotPoints.classic.r1
                                      : (widget.year == '30 MIN')
                                          ? snapshot.data!.the30Min.pivotPoints
                                              .classic.r1
                                          : (widget.year == '5 HR')
                                              ? snapshot.data!.the5Hour
                                                  .pivotPoints.classic.r1
                                              : (widget.year == '5 MIN')
                                                  ? snapshot.data!.the5Min
                                                      .pivotPoints.classic.r1
                                                  : (widget.year == 'daily')
                                                      ? snapshot
                                                          .data!
                                                          .daily
                                                          .pivotPoints
                                                          .classic
                                                          .r1
                                                      : (widget.year == '1 MON')
                                                          ? snapshot
                                                              .data!
                                                              .monthly
                                                              .pivotPoints
                                                              .classic
                                                              .r1
                                                          : snapshot
                                                              .data!
                                                              .weekly
                                                              .pivotPoints
                                                              .classic
                                                              .r1,
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'R2',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Text(
                          (widget.year == '15 MIN')
                              ? snapshot.data!.the15Min.pivotPoints.classic.r2
                              : (widget.year == '1 HR')
                                  ? snapshot
                                      .data!.the5Min.pivotPoints.classic.r2
                                  : (widget.year == '1 MIN')
                                      ? snapshot
                                          .data!.the1Min.pivotPoints.classic.r2
                                      : (widget.year == '30 MIN')
                                          ? snapshot.data!.the30Min.pivotPoints
                                              .classic.r2
                                          : (widget.year == '5 HR')
                                              ? snapshot.data!.the5Hour
                                                  .pivotPoints.classic.r2
                                              : (widget.year == '5 MIN')
                                                  ? snapshot.data!.the5Min
                                                      .pivotPoints.classic.r2
                                                  : (widget.year == 'daily')
                                                      ? snapshot
                                                          .data!
                                                          .daily
                                                          .pivotPoints
                                                          .classic
                                                          .r2
                                                      : (widget.year == '1 MON')
                                                          ? snapshot
                                                              .data!
                                                              .monthly
                                                              .pivotPoints
                                                              .classic
                                                              .r2
                                                          : snapshot
                                                              .data!
                                                              .weekly
                                                              .pivotPoints
                                                              .classic
                                                              .r2,
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'R3',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Text(
                          (widget.year == '15 MIN')
                              ? snapshot.data!.the15Min.pivotPoints.classic.r3
                              : (widget.year == '1 HR')
                                  ? snapshot
                                      .data!.the5Min.pivotPoints.classic.r3
                                  : (widget.year == '1 MIN')
                                      ? snapshot
                                          .data!.the1Min.pivotPoints.classic.r3
                                      : (widget.year == '30 MIN')
                                          ? snapshot.data!.the30Min.pivotPoints
                                              .classic.r3
                                          : (widget.year == '5 HR')
                                              ? snapshot.data!.the5Hour
                                                  .pivotPoints.classic.r3
                                              : (widget.year == '5 MIN')
                                                  ? snapshot.data!.the5Min
                                                      .pivotPoints.classic.r3
                                                  : (widget.year == 'daily')
                                                      ? snapshot
                                                          .data!
                                                          .daily
                                                          .pivotPoints
                                                          .classic
                                                          .r3
                                                      : (widget.year == '1 MON')
                                                          ? snapshot
                                                              .data!
                                                              .monthly
                                                              .pivotPoints
                                                              .classic
                                                              .r3
                                                          : snapshot
                                                              .data!
                                                              .weekly
                                                              .pivotPoints
                                                              .classic
                                                              .r3,
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ]));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return Text('Loading.....');
          },
        ),
      ],
    );
  }
}
