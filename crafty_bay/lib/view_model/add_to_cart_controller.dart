import 'package:crafty_bay/utils/widgets/widgets.dart';

class AddToCartController extends GetxController {
  bool _inProgress = false;

  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  Future<bool> addToCart(
    int productId,
    String color,
    String size,
    int quantity,
  ) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
        await Get.find<NetworkCaller>().postRequest(
            url: Urls.addToCart,
            body: {
              "product_id": productId,
              "color": color,
              "size": size,
              "qty": quantity,
            },
            token: AuthController.accessToken);
    if (response.isSuccess && response.responseData['msg'] == 'success') {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
