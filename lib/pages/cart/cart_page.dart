import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../components/app_dialog.dart';
import 'widget/delivery_time.dart';
import 'widget/food_item.dart';
import '../../components/app_bar/foodie_app_bar.dart';
import '../../models/food_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double get totalPrice {
    double total = 0.0;
    for (FoodModel food in foods) {
      total = total + food.total;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return Scaffold(
      appBar: FoodieAppBar(
        iconPressed: () => AppDialog.dialog(
          context,
          title: const Text('😍'),
          content: 'Do you want to exit app?',
          action: () =>
              SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
        ),
        title: 'Foodies',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0)
              .copyWith(top: 12.0, bottom: 30.0),
          child: Column(
            children: [
              // ListView.builder(
              //   physics: const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   padding: EdgeInsets.zero,
              //   itemCount: foods.length,
              //   itemBuilder: (context, index) {
              //     FoodModel food = foods[index];
              //     return Padding(
              //       padding: EdgeInsets.only(
              //           bottom: index == foods.length - 1 ? 0.0 : 20.0),
              //       child: FoodItem(food),
              //     );
              //   },
              // ),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: foods.map((food) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: FoodItem(food),
                  );
                }).toList(),
              ),
              const SizedBox(height: 36.0),
              DeliveryTime(minute: 25, totalPrice: totalPrice),
            ],
          ),
        ),
      ),
    );
  }
}
