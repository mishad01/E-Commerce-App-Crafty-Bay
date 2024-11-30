import 'package:crafty_bay/utils/widgets/widgets.dart';

class NewProductListController extends GetxController {
  bool _newProductInProgress = false;
  bool get newProductInProgress => _newProductInProgress;

  List<ProductModel> _newProductList = [];
  List<ProductModel> get newProductList => _newProductList;

  String? _newErrorMessage;
  String? get newErrorMessage => _newErrorMessage;

  Future<bool> getNewProducts() async {
    _newProductInProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: Urls.productListByRemark('new'));

    bool isSuccess = false;

    if (response.isSuccess) {
      _newProductList =
          ProductListModel.fromJson(response.responseData).productData ?? [];
      isSuccess = true;
    } else {
      _newErrorMessage = response.errorMessage;
    }

    _newProductInProgress = false;
    update();

    return isSuccess;
  }
}
