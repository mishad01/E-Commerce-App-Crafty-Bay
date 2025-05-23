import 'package:crafty_bay/utils/widgets/widgets.dart';

import 'widgets/category_card.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        backToHome();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('Categories'),
            leading: IconButton(
                onPressed: backToHome, icon: Icon(Icons.arrow_back_ios)),
          ),
          body: RefreshIndicator(
            onRefresh: () {
              return Get.find<CategoryListController>().getCategoryList();
            },
            child: GetBuilder<CategoryListController>(
                builder: (categoryListController) {
              if (categoryListController.inProgress) {
                return const CenteredCircularProgressIndicator();
              } else if (categoryListController.errorMessage != null) {
                return Center(
                  child: Text(categoryListController.errorMessage!),
                );
              }
              return Visibility(
                visible: !categoryListController.inProgress,
                replacement: CenteredCircularProgressIndicator(),
                child: GridView.builder(
                  itemCount: categoryListController.categoryList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    return CategoryCard(
                        categoryModel:
                            categoryListController.categoryList[index]);
                  },
                ),
              );
            }),
          )),
    );
  }

  void backToHome() {
    return Get.find<BottomNavBarController>().backToHome();
  }
}
