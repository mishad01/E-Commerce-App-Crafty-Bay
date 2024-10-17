import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: buildProductCard());
  }

  Widget buildProductCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppColors.themeColor.withOpacity(0.2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7),
                      topRight: Radius.circular(7),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.all(10.0), // Padding for the image
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AssetsPath.shoeImage),
                          fit: BoxFit
                              .contain, // Adjusts the image size within the padding
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 120,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product Name',
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('\$120',
                                style: TextStyle(
                                    color: AppColors.themeColor,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(width: 5),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(Icons.star, color: Colors.amber),
                                Text(
                                  '4.8',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              color: AppColors.themeColor,
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Icon(
                                  Icons.favorite_outline_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
