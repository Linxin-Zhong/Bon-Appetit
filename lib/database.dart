
import 'dish.dart';

 const int MEAT = 0;
   const int VEGE = 1;
   const int SOUP = 2;
   const int DESSERT = 3;
   const int MAIN = 4;
   const int BREAKFAST = 0;
   const int LUNCH = 1;
   const int DINNER = 2;
  
class DataBase {
  

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

  removeDish(String name, int index, int type){
    this.number--;
    this.dishes.removeAt(index);
    this.names.remove(name);
    this.typeLimit[type]--;
  }

  bool ableToChange(int meal, int type, String sign){
    if (sign == '+' && typeLimit[type] == 0){
      return false;
    } else if (sign == '-'){
      switch (type) {
       case MEAT:
         if (meatComb[meal] <= 0){
          return false;
         } 
         break;
       case VEGE:
       if (vegeComb[meal] <= 0){
          return false;
         } 
         break;
       case SOUP:
       if (soupComb[meal] <= 0){
          return false;
         } 
         break;
       case DESSERT:
       if (dessertComb[meal] <= 0){
          return false;
         } 
         break;
       case MAIN:
       if (mainComb[meal] <= 0){
          return false;
         } 
         break;
      }
    } 
    return true;
  }

   editCombinations(int meal, int type, String sign){
     switch (type) {
       case MEAT:
         if (sign == '+'){
          meatComb[meal]++;
         } else {
          meatComb[meal]--;
         }
         break;
       case VEGE:
         if (sign == '+'){
          vegeComb[meal]++;
         } else {
          vegeComb[meal]--;
         }
         break;
       case SOUP:
         if (sign == '+'){
          soupComb[meal]++;
         } else {
          soupComb[meal]--;
         }
         break;
       case DESSERT:
         if (sign == '+'){
          dessertComb[meal]++;
         } else {
          dessertComb[meal]--;
         }
         break;
       case MAIN:
         if (sign == '+'){
          mainComb[meal]++;
         } else {
          mainComb[meal]--;
         }
         break;
   }

}
}