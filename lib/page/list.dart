import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
     return new WebView(
        initialUrl: 'http://10.184.20.9/daping/index.html',
        javascriptMode: JavascriptMode.unrestricted,
    );
  }
}