import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/page/index.dart';
import 'package:flutter_app/page/list.dart';

void main() {
  runApp(MyApp());
  // SystemChrome.setPreferredOrientations(
  //         [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
  //     .then((_) {
  //   runApp(MyApp());
  // });
  
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '窗口取证',
      home: new Home(),
    );
  }
}
