import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../Components/color.dart';

class ArticleView extends StatefulWidget {
  String blogUrl;
  ArticleView({required this.blogUrl});


  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

   final controller = WebViewController();
     bool _loodingNewsArticle = true;

   @override
   void initState() {
     super.initState();
     controller.setJavaScriptMode(JavaScriptMode.unrestricted);
     // controller.loadUrl(widget.blogUrl);
     controller.loadRequest(Uri.parse(widget.blogUrl));
     _loodingNewsArticle = false;
   }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
          color: AppColors.secondaryColor,

        ),
        backgroundColor: AppColors.primaryColor,
        title: const Text('MTN-NEWS', style: TextStyle(color: AppColors.secondaryColor)),
        centerTitle: true,
      ),
      body: _loodingNewsArticle? const Center(child: CircularProgressIndicator()) : WebViewWidget(
          controller: controller,

      ),
    );
  }
}
