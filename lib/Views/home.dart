import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvoula/Components/color.dart';
import 'package:mvoula/Models/article_models.dart';
import 'package:mvoula/Widgets/Caterogie_widget.dart';
import 'package:mvoula/Widgets/blog_news.dart';
import 'package:mvoula/services/data_category.dart';
import 'package:mvoula/services/articles_data.dart';
import 'package:mvoula/services/slider_data.dart';

import '../Models/category_models.dart';
import '../Models/slider_models.dart';
import '../Widgets/Widgets.dart';
import '../generated/assets.dart';
import 'Pages/all_news.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   List<CategoryModels> categories = [];
   List<SliderModels> slider = [];
   List<ArticleModels> articleModel = [];

   int activeIndexSlider = 0;
   bool _loodingNews = true;

   @override
  void initState() {
    // TODO: implement initState
     categories = getCategoryModel();
      getNewsApiSlider();
     getNewsApi();
    super.initState();
  }


  getNewsApi()async{
     NewsAPI newsAPI = NewsAPI();
     await newsAPI.getNews();
     articleModel = newsAPI.news;

     setState(() {
       _loodingNews = false;
     });
  }

  getNewsApiSlider()async{
     NewsAPISlider newsAPISlider = NewsAPISlider();
     await newsAPISlider.getNewsSliders();
     slider = newsAPISlider.newsSlider;


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    backgroundColor: AppColors.primaryColor,
        title: const Text('MTN-NEWS', style: TextStyle(color: AppColors.secondaryColor)),
        centerTitle: true,
      ),
      body:_loodingNews? const Center(child: CircularProgressIndicator()) :  SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                height: 70,
                child: ListView.builder(
                  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context,index){
                      return CategorieTitre(
                        image: categories[index].image,
                        categorieName: categories[index].categoryName,
                      );
                    }),
              ),
              const SizedBox(height: 30.0,),
               Padding(
                padding:  EdgeInsets.only(left: 10.0, right: 10.0),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   const  Text('Dernières nouvelles', style: TextStyle(color: AppColors.primaryColor, fontWeight:   FontWeight.bold, fontSize: 16),),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) =>  AllNews(allnews: "Dernière tendances"))),
                        child: const Text('Voir tout', style: TextStyle(color: AppColors.accentColorBlue, fontWeight:   FontWeight.bold, fontSize: 16),)),
                  ],
                ),
              ),
              const SizedBox(height: 15.0,),
                CarouselSlider.builder(
                    itemCount: slider.length-1,
                    // itemCount: 5,
                    itemBuilder: (context, index,reaIndex){
                      String? resSlideImage = slider[index].urlToImage;
                      String? resSlideName = slider[index].title;
        
                      return buildImage(context,resSlideImage, index, resSlideName);
                    },
                    options: CarouselOptions(
                        height: 250,
                        viewportFraction: 1,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason){
                          setState(() {
                            activeIndexSlider = index;
        
                          });
                        },
                        enlargeStrategy: CenterPageEnlargeStrategy.height)
                ),
              const SizedBox(height: 30.0,),
              Center(
                  // child: buildIndicatorSlider(context,activeIndexSlider,5)),
                   child: buildIndicatorSlider(context,activeIndexSlider,slider.length)),
              const SizedBox(height: 30.0,),
               Padding(
                padding: const  EdgeInsets.only(left: 10.0, right: 10.0),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('nouvelles tendances', style: TextStyle(color: AppColors.primaryColor, fontWeight:   FontWeight.bold, fontSize: 16),),
                    GestureDetector(
                        onTap: () => Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) =>  AllNews(allnews: "Nouvelle tendance"))),
                        child: const Text('Voir tout', style: TextStyle(color: AppColors.accentColorBlue, fontWeight:   FontWeight.bold, fontSize: 16),)),
                  ],
                ),
              ),
              const SizedBox(height: 10.0,),
              Container(
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: articleModel.length,
                  itemBuilder: (context, index){
                    return BlogNewsTle(
                      imageUrl: articleModel[index].urlToImage ?? Assets.assetsNews,
                      title:  articleModel[index].title ?? "titre",
                      description:  articleModel[index].descriptions ?? "description",
                      url: articleModel[index].url ?? "url",
                    );
                  },),
              ),
              const SizedBox(height: 10.0,),
            ],
          ),
        ),
      ),
    );
  }



}
