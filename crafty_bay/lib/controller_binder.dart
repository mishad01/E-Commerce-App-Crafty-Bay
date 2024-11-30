import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'data/services/network_caller.dart';
import 'view_model/add_to_cart_controller.dart';
import 'view_model/auth_controller.dart';
import 'view_model/bottom_nav_bar_controller.dart';
import 'view_model/cart_list_controller.dart';
import 'view_model/category_list_controller.dart';
import 'view_model/create_cart_list_controller.dart';
import 'view_model/create_product_review_controller.dart';
import 'view_model/create_profile_controller.dart';
import 'view_model/create_wish_list_controller.dart';
import 'view_model/delete_cart_controller.dart';
import 'view_model/email_verification_controller.dart';
import 'view_model/invoice_creation_controller.dart';
import 'view_model/new_product_list_controller.dart';
import 'view_model/otp_verification_controller.dart';
import 'view_model/popular_product_list_controller.dart';
import 'view_model/product_details_controller.dart';
import 'view_model/product_list_by_category_controller.dart';
import 'view_model/read_profile_controller.dart';
import 'view_model/review_profile_controller.dart';
import 'view_model/slider_list_controller.dart';
import 'view_model/special_product_list_controller.dart';
import 'view_model/time_count_controller.dart';
import 'view_model/wish_list_controller.dart';

class ControllerBinder extends Bindings {
  void dependencies() {
    Get.put(TimeCountController());
    Get.put(BottomNavBarController());
    Get.put(Logger());
    Get.put(AuthController());
    Get.put(
      NetworkCaller(
        logger: Get.find<Logger>(),
        authController: Get.find<AuthController>(),
      ),
    );
    Get.put(SliderListController());
    Get.put(CategoryListController());
    Get.put(NewProductListController());
    Get.put(SpecialProductListController());
    Get.put(PopularProductListController());
    Get.put(ProductListByCategoryController());
    Get.put(ProductDetailsController());
    Get.put(AuthController());
    Get.put(EmailVerificationController());
    Get.put(OtpVerificationController());
    Get.put(ReadProfileController());
    Get.put(AddToCartController());
    Get.put(CreateProfileController());
    Get.put(ReviewProfileController());
    Get.put(WishListController());
    Get.put(CreateWishListController());
    Get.put(CreateCartListController());
    Get.put(CartListController());
    Get.put(DeleteCartController());
    Get.put(InvoiceCreationController());
    Get.put(CreateProductReviewController());
    Get.put(TimeCountController());
  }
}
