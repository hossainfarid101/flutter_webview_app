import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body:  WillPopScope(
       onWillPop: () async {
         if (await _controller.canGoBack()) {
           _controller.goBack();
           return false;
         } else {
           return true;
         }
       },
       child: SafeArea(
         child: WebView(
              initialUrl: "https://aeo.biowinerp.com/",
              javascriptMode: JavascriptMode.unrestricted,
           onWebViewCreated:
               (WebViewController webViewController) {
             _controller = webViewController;
           },

            ),
       ),
     ),
     );
  }
}
