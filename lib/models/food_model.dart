import '../gen/assets.gen.dart';
import '../utils/util.dart';

class FoodModel {
  String? id;
  String? imageStr;
  String? name;
  double? price;
  int? quantity;
  String? description;
  double? rating;

  double get total => (price ?? 0.0) * (quantity ?? 0);

  FoodModel() {
    id = Util.getID();
  }
}

List<FoodModel> foods = [
  FoodModel()
    ..imageStr = Assets.images.food1.path
    ..name = 'Fried Chicken'
    ..price = 20.0
    ..quantity = 2
    ..description = 'Golden browse fried chicken'
    ..rating = 4.5,
  FoodModel()
    ..imageStr = Assets.images.food2.path
    ..name = 'Cheese Sandwich'
    ..price = 18.0
    ..quantity = 3
    ..description = 'Grilled Cheese Sandwich'
    ..rating = 4.0,
  FoodModel()
    ..imageStr = Assets.images.food3.path
    ..name = 'Egg Pasta'
    ..price = 15.0
    ..quantity = 1
    ..description = 'Spicy Chicken Pasta'
    ..rating = 5.0,
  FoodModel()
    ..imageStr = Assets.images.food1.path
    ..name = 'Fried Chicken'
    ..price = 20.0
    ..quantity = 2
    ..description = 'Golden browse fried chicken'
    ..rating = 4.5,
  FoodModel()
    ..imageStr = Assets.images.food2.path
    ..name = 'Cheese Sandwich'
    ..price = 18.0
    ..quantity = 3
    ..description = 'Grilled Cheese Sandwich'
    ..rating = 4.0,
  FoodModel()
    ..imageStr = Assets.images.food3.path
    ..name = 'Egg Pasta'
    ..price = 15.0
    ..quantity = 1
    ..description = 'Spicy Chicken Pasta'
    ..rating = 5.0,
];
