import 'package:flutter/material.dart';
import 'package:predoo/utils/color.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({Key? key}) : super(key: key);

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  WebViewController? _controller;
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy',),
      ),
      body: Stack(
        children: [
          WebView(
            backgroundColor: MyColor.secondaryColor,
            initialUrl: 'https://policies.google.com/privacy?hl=en-US',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
            },
            onPageFinished: (String url) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(
                color: MyColor.primaryColor,
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
   // _controller?.dispose();
  }
}
