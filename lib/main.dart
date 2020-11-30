import 'package:flutter/material.dart';
import './gesture_crash_screen.dart';
import './ink_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestures',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Getsures'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              minWidth: 250,
              height: 45,
              color: Colors.indigo,
              textColor: Colors.white,
              child: Text('InkWEll, InkResponse'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return InkScreen();
                  }),
                );
              },
            ),
            SizedBox(height: 40.0),
            MaterialButton(
              minWidth: 250,
              height: 45,
              color: Colors.indigo,
              textColor: Colors.white,
              child: Text('Gesture Crash'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return GestureCrashScreen();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
