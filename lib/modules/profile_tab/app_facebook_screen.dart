import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppFacebookScreen extends StatefulWidget {
  const AppFacebookScreen({Key? key}) : super(key: key);

  @override
  State<AppFacebookScreen> createState() => _AppFacebookScreenState();
}

class _AppFacebookScreenState extends State<AppFacebookScreen> {
  int progress = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook Page'),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://www.facebook.com/santosh.lamichhane.188478',
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
