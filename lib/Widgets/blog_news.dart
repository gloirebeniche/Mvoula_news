import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvoula/Views/Pages/article_views.dart';

import '../Components/color.dart';
import '../generated/assets.dart';

class BlogNewsTle extends StatelessWidget {
  String imageUrl, title, description, url;

  BlogNewsTle( {required this.imageUrl, required this.title,required this.description, required this.url});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> ArticleView(blogUrl: url))),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      // child:Image.network(imageUrl,
                      //   // CachedNetworkImage(imageUrl: imageUrl
                      // // Image.asset("assets/category/science.jpg",
                      //   height: 150,
                      //   width: 150,
                      //   fit: BoxFit.cover,
                      // ),
                      child: Image.network(
                        imageUrl,
                        height: 150,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return Image.asset(
                            Assets.assetsNews, // Chemin de votre image de substitution ou image par défaut
                            height: 150,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ) ,
                  ),
                  const SizedBox(width: 10.0,),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width /1.8,
                          child:  Text(title,
                            style: const TextStyle(color: AppColors.primaryColor, fontWeight:   FontWeight.bold, fontSize: 17),),
                        ),
                        const SizedBox(height: 7.0,),
                        Container(
                          width: MediaQuery.of(context).size.width /2,
                          child:  Text(description,
                            style: const TextStyle(color: AppColors.textColor, fontWeight:   FontWeight.w500, fontSize: 12),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
