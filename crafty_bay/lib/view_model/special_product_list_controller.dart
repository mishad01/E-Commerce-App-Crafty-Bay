import 'package:crafty_bay/utils/widgets/widgets.dart';

class SpecialProductListController extends GetxController {
  bool _specialProductInProgress = false;
  bool get specialProductInProgress => _specialProductInProgress;

  List<ProductModel> _specialProductList = [];
  List<ProductModel> get specialProductList => _specialProductList;

  String? _specialErrorMessage;
  String? get specialErrorMessage => _specialErrorMessage;

  Future<bool> getSpecialProducts() async {
    _specialProductInProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: Urls.productListByRemark('special'));

    bool isSuccess = false;

    if (response.isSuccess) {
      _specialProductList =
          ProductListModel.fromJson(response.responseData).productData ?? [];
      isSuccess = true;
    } else {
      _specialErrorMessage = response.errorMessage;
    }

    _specialProductInProgress = false;
    update();

    return isSuccess;
  }
}
