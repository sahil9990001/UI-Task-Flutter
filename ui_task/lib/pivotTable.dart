import 'package:flutter/material.dart';
import 'package:ui_task/Api_Services/api.dart';

import 'Modal/technical_modal.dart';

class PivotPoints1 extends StatefulWidget {
  const PivotPoints1({
    Key? key,
  }) : super(key: key);

  @override
  _PivotPoints1State createState() => _PivotPoints1State();
}

class _PivotPoints1State extends State<PivotPoints1> {
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
          child: Text('Pivot Points'),
        ),
        SizedBox(height: 30),
        Center(
          child: Container(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Classic',
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
                        Text(
                          snapshot.data!.the15Min.pivotPoints.classic.s3,
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
                          snapshot.data!.the15Min.pivotPoints.classic.s2,
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
                          snapshot.data!.the15Min.pivotPoints.classic.s1,
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
                          snapshot.data!.the15Min.pivotPoints.classic.s1,
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
                          snapshot.data!.the15Min.pivotPoints.classic.r1,
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
                          snapshot.data!.the15Min.pivotPoints.classic.r2,
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
                          snapshot.data!.the15Min.pivotPoints.classic.r3,
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
