import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvoula/Components/color.dart';
import 'package:mvoula/Components/style.dart';

import '../Views/Pages/categorie_news.dart';
import '../generated/assets.dart';

class CategorieTitre extends StatelessWidget {

  final categorieName, image;

  const CategorieTitre({super.key, this.categorieName, this.image});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> CategorieNews(nameCategprie: categorieName))),
      child: Container(
        margin: const EdgeInsets.only(right: 16,top: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                image,
                width: 120,
                height: 70,
                fit: BoxFit.cover,),
            ),
            Container(
              width: 120,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Center(
                child: Text(
                  categorieName,
                  style: const TextStyle(color: AppColors.secondaryColor, fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class  ShowCategory extends StatelessWidget {
  String titte , description, image;

  ShowCategory({required this.titte, required this.description, required this.image});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              image,
              height: 250,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return Image.asset(
                  Assets.assetsNews, // Chemin de votre image de substitution ou image par défaut
                  height: 200,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                );
              },
            ),
          ),
          const SizedBox(height: 10.0,),
          Text(titte, style: AppStyles.titleTextStyle, maxLines: 2,),
          const SizedBox(height: 10.0,),
          Text(description),
          const SizedBox(height: 20.0,),
        ],
      ),
    );
  }
}


