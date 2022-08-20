import 'dish.dart';

class database {
  late int number;
  late List<Dish> dishes;
  database() {
    this.number = 0;
    this.dishes = [];
  }
  addDish(String name, int type){
    this.dishes.add(Dish(n:name, t:type));
    this.number++;
  }

}
