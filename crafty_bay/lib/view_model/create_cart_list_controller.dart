import 'package:crafty_bay/utils/widgets/widgets.dart';

class CreateCartListController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage = '';
  String? get errorMessage => _errorMessage;

  Future<bool> createCartList(
      String productId, String color, String size, String qty) async {
    bool isSuccess = false;

    if (AuthController.accessToken == null) {
      _errorMessage = "Access token is missing.";
      return false;
    }
    _inProgress = true;
    update();
    Map<String, dynamic> createCartBody = {
      "product_id": productId,
      "color": color,
      "size": size,
      "qty": qty
    };

    NetworkResponse response = await Get.find<NetworkCaller>().postRequest(
      url: Urls.createCartList,
      token: AuthController.accessToken,
      body: createCartBody,
    );

    if (response.isSuccess && response.responseData["msg"] == "success") {
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
