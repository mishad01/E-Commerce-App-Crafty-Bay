import 'package:crafty_bay/utils/widgets/widgets.dart';

class WishListController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<WishListModel> _productWishList = [];
  List<WishListModel> get productWishList => _productWishList;

  Future<bool> getProductWishList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
        url: Urls.productWishList, token: AuthController.accessToken);

    if (response.isSuccess) {
      _productWishList =
          WishListProduct.fromJson(response.responseData).wishListData ?? [];
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
