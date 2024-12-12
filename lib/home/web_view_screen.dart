import 'package:flutter/material.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key, required this.url});
  final String url;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  var controller = WebViewController();
  @override
  void initState() {
    super.initState();
    controller.loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.pDcolor,
        body: WebViewWidget(controller: controller),
      ),
    );
  }
}
