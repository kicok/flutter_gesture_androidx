import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GestureCrashScreen extends StatefulWidget {
  @override
  _GestureCrashScreenState createState() => _GestureCrashScreenState();
}

class _GestureCrashScreenState extends State<GestureCrashScreen> {
  final listItems = List<String>.generate(20, (int i) => 'Item ${i + 1}');

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gesture'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.teal,
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 15.0,
                ),
                width: double.infinity,
                child: Text(
                  '수확현황 요약',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,

                  //gestureRecognizers 를 선언함으로써 어떤 체스처가 구글맵에 forward 될 것인지를 결정
                  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                    Factory<OneSequenceGestureRecognizer>(
                      () => EagerGestureRecognizer(),
                    ),
                  ].toSet(),
                  //EagerGestureRecognizer 를 선언함으로써 구글맵 내의 모든 pointer down 이벤트를 처리하겠다고 표명함
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: listItems.length,
                itemBuilder: (BuildContext context, int i) {
                  final item = listItems[i];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${i + 1}'),
                      ),
                      title: Text(item),
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}
