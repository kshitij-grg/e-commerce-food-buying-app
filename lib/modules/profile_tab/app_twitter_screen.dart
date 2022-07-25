import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppTwitterScreen extends StatefulWidget {
  const AppTwitterScreen({Key? key}) : super(key: key);

  @override
  State<AppTwitterScreen> createState() => _AppTwitterScreenState();
}

class _AppTwitterScreenState extends State<AppTwitterScreen> {
  int progress = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter Page'),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://twitter.com',
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
