import 'package:crafty_bay/utils/widgets/widgets.dart';
import 'package:crafty_bay/view/web/webview_screen.dart';

class MobileBankingPayment extends StatelessWidget {
  const MobileBankingPayment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvoiceCreationController>(
        builder: (invoiceCreationController) {
      // Handle error message display
      if (invoiceCreationController.errorMessage != null &&
          invoiceCreationController.errorMessage!.isNotEmpty) {
        return Center(
          child: Text(
            invoiceCreationController.errorMessage!,
            style: TextStyle(color: Colors.red),
          ),
        );
      }

      return Visibility(
        visible: !invoiceCreationController.inProgress,
        replacement: CenteredCircularProgressIndicator(),
        child: Card(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Adjust columns based on design
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 1.0,
            ),
            itemCount: invoiceCreationController.mobilePaymentMethod.length,
            itemBuilder: (context, index) {
              // Show actual content from the PaymentMethod
              final paymentMethod =
                  invoiceCreationController.mobilePaymentMethod[index];
              return InkWell(
                onTap: () {
                  Get.to(() => WebViewScreen(
                      link: paymentMethod.redirectGatewayURL.toString()));
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.scale(
                        scale: 1,
                        child: Image.network(paymentMethod.logo ?? ""),
                      ) // Show payment method name
                      // You can display other details or icons here if needed
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
