import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/widgets/centered_circular_progress_indicator.dart';
import '../../view_model/auth_controller.dart';
import '../../view_model/bottom_nav_bar_controller.dart';
import '../../view_model/category_list_controller.dart';
import '../../view_model/new_product_list_controller.dart';
import '../../view_model/popular_product_list_controller.dart';
import '../../view_model/special_product_list_controller.dart';
import '../auth/email_verification/email_verification_screen.dart';
import 'widgets/app_bar_icon.dart';
import 'widgets/build_product_cart.dart';
import 'widgets/home_banner_slider.dart';
import 'widgets/horizontal_category_listView.dart';
import 'widgets/search_text_field.dart';
import 'widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AuthController authController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController = AuthController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*Container(
                        // margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: SearchTextField(
                            textEditingController: TextEditingController()),
                      ),*/
                /*TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          border: InputBorder.none,
                          enabledBorder:
                              InputBorder.none, // Ensures no border when enabled
                          focusedBorder:
                              InputBorder.none, // Ensures no border when focused
                          errorBorder: InputBorder
                              .none, // Ensures no border when there's an error
                          disabledBorder: InputBorder.none, // Ensu
                        ),
                      ),*/
                const SizedBox(height: 10),
                SearchTextField(textEditingController: TextEditingController()),
                const SizedBox(height: 10),
                const HomeBannerSlider(),
                _buildAllCategoriesScreen(),
                _buildPopularProductSection(),
                _buildNewProductSection(),
                _buildSpecialProductSection(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopularProductSection() {
    return Column(
      children: [
        SectionHeader(title: 'Popular', onTap: () {}),
        GetBuilder<PopularProductListController>(
            builder: (popularProductListController) {
          return Visibility(
            visible: !popularProductListController.inProgress,
            replacement: CenteredCircularProgressIndicator(),
            child: BuildProductCart(
              productList: popularProductListController.productList,
            ),
          );
        }),
      ],
    );
  }

  Widget _buildNewProductSection() {
    return Column(
      children: [
        SectionHeader(title: 'Special', onTap: () {}),
        GetBuilder<NewProductListController>(
            builder: (newProductListController) {
          return Visibility(
            visible: !newProductListController.newProductInProgress,
            replacement: CircularProgressIndicator(),
            child: BuildProductCart(
              productList: newProductListController.newProductList,
            ),
          );
        }),
      ],
    );
  }

  Widget _buildSpecialProductSection() {
    return Column(
      children: [
        SectionHeader(title: 'New', onTap: () {}),
        GetBuilder<SpecialProductListController>(
            builder: (specialProductListController) {
          return Visibility(
            visible: !specialProductListController.specialProductInProgress,
            replacement: CircularProgressIndicator(),
            child: BuildProductCart(
              productList: specialProductListController.specialProductList,
            ),
          );
        }),
      ],
    );
  }

  Widget _buildAllCategoriesScreen() {
    return Column(
      children: [
        SectionHeader(
            title: 'All Categories',
            onTap: () {
              Get.find<BottomNavBarController>().selectCategoryTab();
            }),
        const SizedBox(height: 10),
        SizedBox(
          height: 120,
          child: GetBuilder<CategoryListController>(
            builder: (categoryListController) {
              return Visibility(
                visible: !categoryListController.inProgress,
                replacement: CenteredCircularProgressIndicator(),
                child: HorizontalCategoryListView(
                  categoryList: categoryListController.categoryList,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: SvgPicture.asset('assets/images/logo_nav.svg'),
      actions: [
        AppBarIcon(
          iconData: Icons.person_outline,
          onTap: () {},
        ),
        const SizedBox(width: 10),
        AppBarIcon(
          iconData: Icons.phone_outlined,
          onTap: () {},
        ),
        const SizedBox(width: 10),
        if (AuthController.accessToken != null)
          AppBarIcon(
            iconData: Icons.logout,
            onTap: () async {
              print('Logout button pressed');

              await authController.clearUserData();
              Get.offAll(() => EmailVerificationScreen());
            },
          ),
      ],
    );
  }
}
