import 'dish.dart';

class DataBase {
  late int number;
  late List<Dish> dishes;
  late List<String> names;
DataBase() {
    this.number = 0;
    this.dishes = [];
    this.names = [];
  }
  addDish(String name, int type){
    this.number++;
    this.dishes.add(Dish(n:name, t:type));
    this.names.add(name);
  }

}
