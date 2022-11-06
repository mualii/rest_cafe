

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rest_cafe/shared/components/components.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CheckOutWebView extends StatefulWidget{
  String url;
  CheckOutWebView(this.url);
  @override
  State<StatefulWidget> createState() {
return CheckOutWebViewState();
  }
}
class CheckOutWebViewState extends State<CheckOutWebView>{
  WebViewController? _controller;
  String? urlSuccess;

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body:  SafeArea(
      child: WebView(
                gestureNavigationEnabled: true,
                // gestureRecognizers: Set()
                //   ..add(Factory<VerticalDragGestureRecognizer>(
                //           () => VerticalDragGestureRecognizer())),
                javascriptMode: JavascriptMode.unrestricted,

                debuggingEnabled: true,
                allowsInlineMediaPlayback: true,
                initialUrl: widget.url,
                navigationDelegate: (NavigationRequest request) {
                  urlSuccess = request.url;
                 // check url success
                  if (urlSuccess!.contains('success')) {
                    Timer(Duration(seconds: 2), () {
                      Navigator.pop(context);
                    });
                  }


                  return NavigationDecision.navigate;
                },
                onWebViewCreated:
                    (WebViewController webViewController) async {
                  _controller = webViewController;
                  urlSuccess = await _controller!.currentUrl();
                  //  print(urlSuccess);
                },


      ),
    ),
  );
  }
}