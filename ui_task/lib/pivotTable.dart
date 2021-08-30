import 'package:flutter/material.dart';

class PivotPoints extends StatelessWidget {
  const PivotPoints({
    Key? key,
  }) : super(key: key);

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
        Padding(
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
                    '456.87',
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
                    '456.87',
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
                    '456.87',
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
                    '456.87',
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
                    '456.87',
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
                    '456.87',
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
                    '456.87',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ]))
      ],
    );
  }
}
