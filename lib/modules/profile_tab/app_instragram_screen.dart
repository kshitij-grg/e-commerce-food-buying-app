import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppInstagramScreen extends StatefulWidget {
  const AppInstagramScreen({Key? key}) : super(key: key);

  @override
  State<AppInstagramScreen> createState() => _AppInstagramScreenState();
}

class _AppInstagramScreenState extends State<AppInstagramScreen> {
  int progress = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram Page'),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://www.instagram.com/__ssantoshh__/',
            javascriptMode: JavascriptMode.unrestricted,
            onProgress: (loadProgress) {
              setState(() {
                progress = loadProgress;
              });
              print(progress);
            },
          ),
          progress < 100
              ? Center(
                  child: CircularProgressIndicator(
                    value: progress / 100,
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
