import 'package:crafty_bay/utils/widgets/widgets.dart';

import '../../home/product_list_screen.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductListScreen(category: categoryModel));
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(categoryModel.categoryImg ?? ""),
              ),
              color: AppColors.themeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            /*child: const Icon(Icons.computer,
                size: 48, color: AppColors.themeColor),*/
          ),
          const SizedBox(height: 4),
          Text(categoryModel.categoryName ?? ' ',
              style: TextStyle(color: AppColors.themeColor)),
        ],
      ),
    );
  }
}
