import 'package:flutter/material.dart';
import 'package:foodie_flutter/resources/app_color.dart';
import '../../components/app_bar/foodie_app_bar.dart';
import '../../components/button/app_elevated_button.dart';
import '../../components/text_field/app_text_field.dart';
import '../../models/address_model.dart';
import '../../resources/app_style.dart';
import '../cart/cart_page.dart';
import 'widget/address_item.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController textFirstController = TextEditingController();
  TextEditingController textSecondController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FoodieAppBar(
        iconPressed: () => Navigator.of(context).pop(),
        title: 'Choose Address',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0)
              .copyWith(top: 26.0, bottom: 60.0),
          child: Column(
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final address = addresses[index];
                  return AddressItem(
                    address,
                    onTap: () {
                      for (var element in addresses) {
                        element.isSelected = false;
                      }
                      address.isSelected = true;
                      setState(() {});
                    },
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20.0),
                itemCount: addresses.length,
              ),
              const SizedBox(height: 46.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppElevatedButton.outline(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            'Add address',
                            style: TextStyle(color: AppColor.red),
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Title First',
                                    style: AppStyle.h12Normal
                                        .copyWith(color: Colors.red),
                                    textAlign: TextAlign.start),
                                AppTextField(
                                  controller: textFirstController,
                                  hintText: 'Title first',
                                ),
                                Text('Title Second',
                                    style: AppStyle.h12Normal
                                        .copyWith(color: Colors.red),
                                    textAlign: TextAlign.start),
                                AppTextField(
                                  controller: textSecondController,
                                  hintText: 'Title second',
                                ),
                                Text('Decrisption',
                                    style: AppStyle.h12Normal
                                        .copyWith(color: Colors.red),
                                    textAlign: TextAlign.start),
                                AppTextField(
                                  controller: descriptionController,
                                  hintText: 'Decrisption',
                                ),
                                const SizedBox(height: 20.0),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: AppElevatedButton(
                                        text: 'Cancel',
                                        onPressed: () =>
                                            Navigator.of(context).pop(context),
                                      ),
                                    ),
                                    const SizedBox(width: 10.0),
                                    Expanded(
                                      flex: 1,
                                      child: AppElevatedButton(
                                        text: 'Add',
                                        onPressed: () {
                                          final newAddress = AddressModel()
                                            ..titleFirst =
                                                textFirstController.text
                                            ..titleSecond =
                                                textSecondController.text
                                            ..description =
                                                descriptionController.text;
                                          Navigator.of(context).pop(context);
                                          setState(() {
                                            addresses.add(newAddress);
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    icon: const Icon(Icons.add, size: 20.0, color: Colors.red),
                    text: 'Add New Address',
                    height: 42.0,
                    padding: const EdgeInsets.only(left: 16.0, right: 20.0),
                  ),
                ],
              ),
              const SizedBox(height: 72.0),
              AppElevatedButton(
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const CartPage()),
                  (Route<dynamic> route) => false,
                ),
                text: 'Next',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
