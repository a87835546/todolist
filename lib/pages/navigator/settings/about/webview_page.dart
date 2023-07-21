import 'package:flutter/material.dart';
import 'package:todo_list/widgets/loading_widget.dart';
import 'dart:io';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;

  WebViewPage(this.url, {required this.title});

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Flutter WebView example'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        actions: <Widget>[
          // NavigationControls(webViewController: _controller),
          // SampleMenu(webViewController: _controller),
        ],
      ),
      // body: WebViewWidget(controller: _controller),
      // floatingActionButton: favoriteButton(),
    );
  }

}
