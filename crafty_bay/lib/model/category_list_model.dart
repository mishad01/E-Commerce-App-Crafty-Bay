import 'package:crafty_bay/utils/widgets/widgets.dart';

class CategoryListModel {
  String? msg;
  List<CategoryModel>? categoryList;

  CategoryListModel({this.msg, this.categoryList});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      categoryList = <CategoryModel>[];
      json['data'].forEach((v) {
        categoryList!.add(new CategoryModel.fromJson(v));
      });
    }
  }
}
