import 'dart:core';

import 'package:disease_detector/dashboard/model/db1/Db1Model.dart';
import 'package:disease_detector/dashboard/utils/DbImages.dart';

import 'DbColors.dart';

List<Db1CategoryModel> getFilterFavourites() {
  List<Db1CategoryModel> categoryModelArrayList = List<Db1CategoryModel>();

  Db1CategoryModel item1 = Db1CategoryModel();
  item1.img = db1_ic_burger;
  item1.name = "Burger";
  item1.color = db1_dark_blue;

  Db1CategoryModel item2 = Db1CategoryModel();
  item2.img = db1_ic_pizza;
  item2.name = "Pizza";
  item2.color = db1_purple;

  Db1CategoryModel item3 = Db1CategoryModel();
  item3.img = db1_ic_coffee;
  item3.name = "Coffee";
  item3.color = db1_green;

  Db1CategoryModel item4 = Db1CategoryModel();
  item4.img = db1_ic_chicken;
  item4.name = "Chicken";
  item4.color = db1_orange;

  Db1CategoryModel item5 = Db1CategoryModel();
  item5.img = db1_ic_cake;
  item5.name = "Cake";
  item5.color = db1_dark_blue;

  Db1CategoryModel item6 = Db1CategoryModel();
  item6.img = db1_ic_cake;
  item6.name = "Cake";
  item6.color = db1_purple;

  categoryModelArrayList.add(item1);
  categoryModelArrayList.add(item2);
  categoryModelArrayList.add(item3);
  categoryModelArrayList.add(item4);
  categoryModelArrayList.add(item5);
  categoryModelArrayList.add(item6);
  return categoryModelArrayList;
}

List<Db1CategoryModel> getCategories() {
  List<Db1CategoryModel> categoryModelArrayList = List<Db1CategoryModel>();
  Db1CategoryModel item1 = Db1CategoryModel();
  item1.img = db_restau_1;
  item1.name = "Morimoto";

  Db1CategoryModel item2 = Db1CategoryModel();
  item2.img = db_restau_2;
  item2.name = "Tashan";

  Db1CategoryModel item4 = Db1CategoryModel();
  item4.img = db_restau_3;
  item4.name = "Beetroot";

  Db1CategoryModel item5 = Db1CategoryModel();
  item5.img = db_restau_4;
  item5.name = "Tomato’s";

  Db1CategoryModel item6 = Db1CategoryModel();
  item6.img = db1_ic_paneer;
  item6.name = "Fast food";

  Db1CategoryModel item3 = Db1CategoryModel();
  item3.img = db1_ic_paneer;
  item3.name = "Nutmeg";
  categoryModelArrayList.add(item1);
  categoryModelArrayList.add(item2);
  categoryModelArrayList.add(item4);
  categoryModelArrayList.add(item5);
  categoryModelArrayList.add(item6);
  categoryModelArrayList.add(item3);
  return categoryModelArrayList;
}

List<DB1FoodModel> getFoodItems() {
  List<DB1FoodModel> foodModelArrayList = List<DB1FoodModel>();
  DB1FoodModel item1 = DB1FoodModel();
  item1.img = db1_ic_waffles;
  item1.name = "Paneer Tikka Dry";
  item1.info = "Indian Food";
  item1.duration = "20 min";

  DB1FoodModel item2 = DB1FoodModel();
  item2.img = db1_ic_biryani;
  item2.name = "Biryani";
  item2.info = "Indian, Fast food";
  item2.duration = "10 min";

  DB1FoodModel item3 = DB1FoodModel();
  item3.img = db1_ic_waffles;
  item3.name = "Burger";
  item3.info = "Indian, Fast food";
  item3.duration = "20 min";

  DB1FoodModel item4 = DB1FoodModel();
  item4.img = db1_ic_biryani;
  item4.name = "Waffles";
  item4.info = "Indian, Fast food";
  item4.duration = "20 min";

  foodModelArrayList.add(item1);
  foodModelArrayList.add(item2);
  foodModelArrayList.add(item3);
  foodModelArrayList.add(item4);
  return foodModelArrayList;
}

List<DB1FoodModel> getPopular() {
  List<DB1FoodModel> foodModelArrayList = List<DB1FoodModel>();
  DB1FoodModel item1 = DB1FoodModel();
  item1.img = db1_ic_waffles;
  item1.name = "Hungry Birds";
  item1.info = "North Indian, Chinese, Birayani";
  item1.duration = "20 min";

  DB1FoodModel item2 = DB1FoodModel();
  item2.img = db1_ic_paneer;
  item2.name = "US Pizza";
  item2.info = "Pizza, Garlic Bread";
  item2.duration = "10 min";

  DB1FoodModel item3 = DB1FoodModel();
  item3.img = db1_ic_biryani;
  item3.name = "Bhuvneshwari Khichadi Center";
  item3.info = "Gujarati, North Indian";
  item3.duration = "20 min";

  DB1FoodModel item4 = DB1FoodModel();
  item4.img = db1_ic_waffles;
  item4.name = "Waffles";
  item4.info = "Indian, Fast food";
  item4.duration = "20 min";

  foodModelArrayList.add(item1);
  foodModelArrayList.add(item2);
  foodModelArrayList.add(item3);
  foodModelArrayList.add(item4);
  return foodModelArrayList;
}


