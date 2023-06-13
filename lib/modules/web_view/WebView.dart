import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/layout/_cubit/Cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String url;

  const WebViewScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(AppCubit.get(context).isDark ? HexColor('141414') : Colors.white,)
          ..setNavigationDelegate(
            NavigationDelegate(),
          )
          ..loadRequest(Uri.parse(url)),
      ),
    );
  }
}
