import 'dish.dart';

class database {
  late int number;
  late List<dish> dishes;
  database(){
    this.number = 0;
    this.dishes = List<dish>.filled(0,dish('',0), growable: true);
  }
  addDish(String name, int type){
    this.dishes.add(dish(name, type));
    number++;
  }

}
