import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../components/app_dialog.dart';
import 'widget/delivery_time.dart';
import 'widget/food_item_2.dart';
import '../../components/app_bar/foodie_app_bar.dart';
import '../../models/food_model.dart';

class CartPage2 extends StatefulWidget {
  const CartPage2({super.key});

  @override
  State<CartPage2> createState() => _CartPage2State();
}

class _CartPage2State extends State<CartPage2> {
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
    return WillPopScope(
      onWillPop: () async {
        AppDialog.confirmExitApp(context);
        return false;
      },
      child: Scaffold(
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
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    FoodModel food = foods[index];
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: index == foods.length - 1 ? 0.0 : 20.0),
                      child: FoodItem2(
                        food,
                        // onAdd: () => setState(
                        //     () => food.quantity = (food.quantity ?? 0) + 1),
                        onAdd: () {
                          food.quantity = (food.quantity ?? 0) + 1;
                          setState(() {});
                        },
                        onRemove: food.quantity == 1
                            ? null
                            : () => setState(
                                () => food.quantity = (food.quantity ?? 0) - 1),
                        onDelete: () => AppDialog.dialog(
                          context,
                          title: const Text('😐'),
                          content: 'Delete this food?',
                          // action: () => setState(
                          //     () => foods.removeWhere((e) => e.id == food.id)),
                          action: () {
                            foods.removeWhere((e) => e.id == food.id);
                            setState(() {});
                          },
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 56.0),
                DeliveryTime(minute: 25, totalPrice: totalPrice),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
