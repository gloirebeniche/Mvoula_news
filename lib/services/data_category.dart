
import '../Models/category_models.dart';

List<CategoryModels> getCategoryModel(){
  List<CategoryModels> category = [];
  CategoryModels categoryModels =  CategoryModels();

  categoryModels.categoryName = "Business";
  categoryModels.image = "assets/category/business.jpg";
  category.add(categoryModels);
  categoryModels = CategoryModels();

  categoryModels.categoryName = "Divertissements";
  categoryModels.image = "assets/category/divertissement.jpg";
  category.add(categoryModels);
  categoryModels =  CategoryModels();

  categoryModels.categoryName = "Général";
  categoryModels.image = "assets/category/general.jpg";
  category.add(categoryModels);
  categoryModels =  CategoryModels();

  categoryModels.categoryName = "Santé";
  categoryModels.image = "assets/category/sante.jpg";
  category.add(categoryModels);
  categoryModels =  CategoryModels();

  categoryModels.categoryName = "Science";
  categoryModels.image = "assets/category/science.jpg";
  category.add(categoryModels);
  categoryModels =  CategoryModels();

  categoryModels.categoryName = "Sport";
  categoryModels.image = "assets/category/business.jpg";
  category.add(categoryModels);
  categoryModels =  CategoryModels();


  return category;
}