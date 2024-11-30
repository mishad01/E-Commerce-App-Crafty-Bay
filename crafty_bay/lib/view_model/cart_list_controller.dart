import 'package:crafty_bay/utils/widgets/widgets.dart';

class CartListController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  int _totalPrice = 0;
  int get totalPrice => _totalPrice;

  List<CartModel> _cartList = [];
  List<CartModel> get cartList => _cartList;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> getNewProducts() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: Urls.cartList, token: AuthController.accessToken);

    if (response.isSuccess) {
      _cartList =
          CartListModel.fromJson(response.responseData).cartListdata ?? [];
      _totalPrice = 0;
      for (CartModel cart in _cartList) {
        _totalPrice += int.parse(cart.price ?? "0");
      }
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}
