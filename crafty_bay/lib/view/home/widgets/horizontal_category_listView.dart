import 'package:flutter/material.dart';

import '../../../model/category_model.dart';
import '../../categories/widgets/category_card.dart';

class HorizontalCategoryListView extends StatelessWidget {
  const HorizontalCategoryListView({
    super.key,
    required this.categoryList,
  });
  final List<CategoryModel> categoryList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(width: 8),
      scrollDirection: Axis.horizontal,
      itemCount: categoryList.length,
      itemBuilder: (context, index) {
        return CategoryCard(
          categoryModel: categoryList[index],
        );
      },
    );
  }
}
