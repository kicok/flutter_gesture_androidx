import 'package:flutter/material.dart';

class InkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ink'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              highlightColor: Colors.red.withOpacity(0.5),
              splashColor: Colors.blue,
              onTap: () {},
              child: Icon(
                Icons.add_circle_outline,
                size: 120.0,
              ),
            ),
            SizedBox(height: 20.0),
            Material(
              color: Colors.teal,
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 120.0,
                  height: 120.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Ink(
              color: Colors.teal,
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 120.0,
                  height: 120.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            InkResponse(
              highlightShape: BoxShape.rectangle,
              highlightColor: Colors.red.withOpacity(0.5),
              splashColor: Colors.blue,
              onTap: () {},
              child: Icon(
                Icons.add_circle_outline,
                size: 120.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
