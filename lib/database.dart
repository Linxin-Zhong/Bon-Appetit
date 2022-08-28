import 'dish.dart';

class DataBase {
  static const int meat = 0;
  static const int vege = 1;
  static const int soup = 2;
  static const int dessert = 3;
  static const int main = 4;

  late int number;
  late List<Dish> dishes;
  late List<String> names;
  late List<int> meatComb;
  late List<int> vegeComb;
  late List<int> soupComb;
  late List<int> dessertComb;
  late List<int> mainComb;
  late List<int> typeLimit;

DataBase() {
    this.number = 0;
    this.dishes = [];
    this.names = [];
    this.typeLimit = [0,0,0,0,0];
    this.meatComb = [0,0,0];
    this.vegeComb = [0,0,0];
    this.soupComb = [0,0,0];
    this.dessertComb = [0,0,0];
    this.mainComb = [0,0,0];
  }
  addDish(String name, int type){
    this.number++;
    this.dishes.add(Dish(n:name, t:type));
    this.names.add(name);
    this.typeLimit[type]++;
  }

   editCombinations(int meal, int type, String sign){
     switch (type) {
       case meat:
         if (sign == '+'){
          meatComb[meal]++;
         } else {
          meatComb[meal]--;
         }
         break;
       case vege:
         if (sign == '+'){
          vegeComb[meal]++;
         } else {
          vegeComb[meal]--;
         }
         break;
       case soup:
         if (sign == '+'){
          soupComb[meal]++;
         } else {
          soupComb[meal]--;
         }
         break;
       case dessert:
         if (sign == '+'){
          dessertComb[meal]++;
         } else {
          dessertComb[meal]--;
         }
         break;
       case main:
         if (sign == '+'){
          mainComb[meal]++;
         } else {
          mainComb[meal]--;
         }
         break;
   }

}
}