

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class WebViewScreen extends StatefulWidget {
  final String url;

  WebViewScreen({required this.url});
  @override
  WebViewState createState() => WebViewState();

}

class WebViewState extends State<WebViewScreen> {
 // late final WebViewController controller;
 // final  url = Uri.parse(widget.url);

/*  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('${widget.url}') ,
      );
  }*/

 /* @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
*/
  bool isloading=true;
  double _progress=0;
  late InAppWebViewController inAppWebViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News'),),
      body:Stack(
        children: [
         /* WebView(
            javascriptMode: JavascriptMode.unrestricted,
            onProgress:(value){
              if(value==100){
                setState(() {
                  isloading=false;
                });
              }
            },
            initialUrl: widget.url,flut
          ),
         isloading?Center(child: CircularProgressIndicator(),):Stack(),*/

          InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse(widget.url),
            ),
            onWebViewCreated: (InAppWebViewController controller){
              inAppWebViewController=controller;
            },
            onProgressChanged: (InAppWebViewController controller, int progress){

                setState(() {
                  _progress = progress / 100;
                });

            },
          ),
          _progress <1 ?
    SizedBox(
            child: LinearProgressIndicator(value: _progress,),)
        :SizedBox(),





        ],
      ),
      /*WebViewWidget(
        controller: controller,

      ),*/ /*WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
     onWebViewCreated: (WebViewController webViewController) {
       setState(() {
         controller.complete(webViewController);
      ),*/
    );
  }
}
