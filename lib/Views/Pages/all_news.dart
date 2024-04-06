import 'package:flutter/material.dart';
import 'package:mvoula/Views/home.dart';
import 'package:mvoula/Widgets/all_news_widget.dart';

import '../../Components/color.dart';
import '../../Models/article_models.dart';
import '../../Models/slider_models.dart';
import '../../services/articles_data.dart';
import '../../services/slider_data.dart';
class AllNews extends StatefulWidget {
  String allnews;
   AllNews({required this.allnews});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {

  List<SliderModels> slider = [];
  List<ArticleModels> articleModel = [];




  @override
  void initState() {
    // TODO: implement initState
    getNewsApiSlider();
    getNewsApi();
    super.initState();
  }


  getNewsApi()async{
    NewsAPI newsAPI = NewsAPI();
    await newsAPI.getNews();
    articleModel = newsAPI.news;
    setState(() {

    });
  }

  getNewsApiSlider()async{
    NewsAPISlider newsAPISlider = NewsAPISlider();
    await newsAPISlider.getNewsSliders();
    slider = newsAPISlider.newsSlider;
    setState(() {

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage())),
          icon: const Icon(Icons.arrow_back),
          color: AppColors.secondaryColor,

        ),
        backgroundColor: AppColors.primaryColor,
        title:  Text(widget.allnews, style: const TextStyle(color: AppColors.secondaryColor)),
        centerTitle: true,
      ),
      body:  Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount:widget.allnews == "Dernière nouvelles" ? slider.length : articleModel.length,
          itemBuilder: (context, index){
            return ShowAllNews(
                title: widget.allnews == "Dernière nouvelles" ? slider[index].title : articleModel[index].title!,
                description:  widget.allnews == "Dernière nouvelles" ? slider[index].descriptions : articleModel[index].descriptions!,
                imageUrl: widget.allnews == "Dernière nouvelles" ? slider[index].urlToImage : articleModel[index].urlToImage!,
                url: widget.allnews == "Dernière nouvelles" ? slider[index].url : articleModel[index].url!,
            );
          },),
      ),
    );
  }
}
