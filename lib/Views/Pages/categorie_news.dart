import 'package:flutter/material.dart';
import 'package:mvoula/Models/show_categorie_models.dart';
import 'package:mvoula/Widgets/Caterogie_widget.dart';
import 'package:mvoula/services/show_categorie_data.dart';
import '../../Components/color.dart';

class CategorieNews extends StatefulWidget {
  String nameCategprie;
  CategorieNews({required this.nameCategprie});

  @override
  State<CategorieNews> createState() => _CategorieNewsState();
}

class _CategorieNewsState extends State<CategorieNews> {

  bool _loodingNewsCategorie = true;
  List<ShowCategorieModels> categories = [];


  getShowCategory()async{
    ShowCategorieDataNews showCategorieModels = ShowCategorieDataNews();
    await showCategorieModels.getNewsCategorieData(widget.nameCategprie.toLowerCase());
    categories = showCategorieModels.categoryShowModelList;

    setState(() {
      _loodingNewsCategorie = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getShowCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
          color: AppColors.secondaryColor,

        ),
        backgroundColor: AppColors.primaryColor,
        title:  Text(
            widget.nameCategprie,
            style: const TextStyle(color: AppColors.secondaryColor)),
        centerTitle: true ,
      ),
      body:  Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: (context, index){
              return ShowCategory(
                  image: categories[index].urlToImage!,
                  titte:  categories[index].title!,
                  description:  categories[index].descriptions!
              );
            },),
      ),
    );
  }
}
