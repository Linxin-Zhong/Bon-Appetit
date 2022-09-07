import 'dish.dart';
import 'dart:math';

const int MEAT = 0;
const int VEGE = 1;
const int SOUP = 2;
const int DESSERT = 3;
const int MAIN = 4;
const int BREAKFAST = 0;
const int LUNCH = 1;
const int DINNER = 2;
const double l = 30.0;

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
  late List<Dish> randomBreakfast;
  late List<Dish> randomLunch;
  late List<Dish> randomDinner;

  DataBase() {
    this.number = 0;
    this.dishes = [];
    this.names = [];
    this.typeLimit = [0, 0, 0, 0, 0];
    this.meatComb = [0, 0, 0];
    this.vegeComb = [0, 0, 0];
    this.soupComb = [0, 0, 0];
    this.dessertComb = [0, 0, 0];
    this.mainComb = [0, 0, 0];
    this.randomBreakfast = [];
    this.randomLunch = [];
    this.randomDinner = [];
  }
  addDish(String name, int type) {
    this.number++;
    this.dishes.add(Dish(n: name, t: type));
    this.names.add(name);
    this.typeLimit[type]++;
  }

  generatRandomMenu() {
    this.randomBreakfast = [];
    this.randomLunch = [];
    this.randomDinner = [];

    if (meatComb[0] + meatComb[1] + meatComb[2] != 0) {
      generateRandomMealComb(MEAT, (meatComb[0] + meatComb[1] + meatComb[2]));
    }
    if (vegeComb[0] + vegeComb[1] + vegeComb[2] != 0) {
      generateRandomMealComb(VEGE, (vegeComb[0] + vegeComb[1] + vegeComb[2]));
    }
    if (soupComb[0] + soupComb[1] + soupComb[2] != 0) {
      generateRandomMealComb(SOUP, (soupComb[0] + soupComb[1] + soupComb[2]));
    }
    if (dessertComb[0] + dessertComb[1] + dessertComb[2] != 0) {
      generateRandomMealComb(
          DESSERT, (dessertComb[0] + dessertComb[1] + dessertComb[2]));
    }
    if (mainComb[0] + mainComb[1] + mainComb[2] != 0) {
      generateRandomMealComb(MAIN, (mainComb[0] + mainComb[1] + mainComb[2]));
    }
  }

  generateRandomMealComb(int type, int num) {
    switch (type) {
      case MEAT:
        List<Dish> Meats = dishes.where((d) => (d.type == MEAT)).toList();
        List<Dish> nonRepMeats = [];
        nonRepMeats = copyList(Meats);
        for (int i = 0; i < num; i++) {
          if (nonRepMeats.length == 0) {
            nonRepMeats = copyList(Meats);
          }
          int len = nonRepMeats.length;//1
          Random r = Random();
          int index = r.nextInt(len);
          if (i < meatComb[0]) {
            randomBreakfast.add(nonRepMeats[index]);
          } else if (i < (meatComb[0] + meatComb[1])) {
            randomLunch.add(nonRepMeats[index]);
          } else {
            randomDinner.add(nonRepMeats[index]);
          }
          nonRepMeats.removeAt(index);
        }
        break;
      case VEGE:
        List<Dish> Veges = dishes.where((d) => (d.type == VEGE)).toList();
        List<Dish> nonRepVeges = [];
        nonRepVeges = copyList(Veges);
        for (int i = 0; i < num; i++) {
          if (nonRepVeges.length == 0) {
            nonRepVeges = copyList(Veges);
          }
          int len = nonRepVeges.length;//1
          Random r = Random();
          int index = r.nextInt(len);
          if (i < vegeComb[0]) {
            randomBreakfast.add(nonRepVeges[index]);
          } else if (i < (vegeComb[0] + vegeComb[1])) {
            randomLunch.add(nonRepVeges[index]);
          } else {
            randomDinner.add(nonRepVeges[index]);
          }
          nonRepVeges.removeAt(index);
        }
        break;
      case SOUP:
        List<Dish> Soups = dishes.where((d) => (d.type == SOUP)).toList();
        List<Dish> nonRepSoups = [];
        nonRepSoups = copyList(Soups);
        for (int i = 0; i < num; i++) {
          if (nonRepSoups.length == 0) {
            nonRepSoups = copyList(Soups);
          }
          int len = nonRepSoups.length;//1
          Random r = Random();
          int index = r.nextInt(len);
          if (i < soupComb[0]) {
            randomBreakfast.add(nonRepSoups[index]);
          } else if (i < (soupComb[0] + soupComb[1])) {
            randomLunch.add(nonRepSoups[index]);
          } else {
            randomDinner.add(nonRepSoups[index]);
          }
          nonRepSoups.removeAt(index);
        }
        break;
      case DESSERT:
        List<Dish> Desserts = dishes.where((d) => (d.type == DESSERT)).toList();
        List<Dish> nonRepDesserts = [];
        nonRepDesserts = copyList(Desserts);
        for (int i = 0; i < num; i++) {
          if (nonRepDesserts.length == 0) {
            nonRepDesserts = copyList(Desserts);
          }
          int len = nonRepDesserts.length;//1
          Random r = Random();
          int index = r.nextInt(len);
          if (i < dessertComb[0]) {
            randomBreakfast.add(nonRepDesserts[index]);
          } else if (i < (dessertComb[0] + dessertComb[1])) {
            randomLunch.add(nonRepDesserts[index]);
          } else {
            randomDinner.add(nonRepDesserts[index]);
          }
          nonRepDesserts.removeAt(index);
        }
        break;
      case MAIN:
        List<Dish> Mains = dishes.where((d) => (d.type == MAIN)).toList();
        List<Dish> nonRepMains = [];
        nonRepMains = copyList(Mains);
        for (int i = 0; i < num; i++) {
          if (nonRepMains.length == 0) {
            nonRepMains = copyList(Mains);
          }
          int len = nonRepMains.length;//1
          Random r = Random();
          int index = r.nextInt(len);
          if (i < mainComb[0]) {
            randomBreakfast.add(nonRepMains[index]);
          } else if (i < (mainComb[0] + mainComb[1])) {
            randomLunch.add(nonRepMains[index]);
          } else {
            randomDinner.add(nonRepMains[index]);
          }
          nonRepMains.removeAt(index);
        }
        break;
    }
  }

  removeDish(String name, int index, int type) {
    this.number--;
    this.dishes.removeAt(index);
    this.names.remove(name);
    this.typeLimit[type]--;
    if (this.typeLimit[type] == 0) {
      switch (type) {
        case MEAT:
          meatComb = [0, 0, 0];
          break;
        case VEGE:
          vegeComb = [0, 0, 0];
          break;
        case SOUP:
          soupComb = [0, 0, 0];
          break;
        case DESSERT:
          dessertComb = [0, 0, 0];
          break;
        case MAIN:
          mainComb = [0, 0, 0];
          break;
      }
    }
  }

  bool ableToChange(int meal, int type, String sign) {
    if (sign == '+' && typeLimit[type] == 0) {
      return false;
    } else if (sign == '-') {
      switch (type) {
        case MEAT:
          if (meatComb[meal] <= 0) {
            return false;
          }
          break;
        case VEGE:
          if (vegeComb[meal] <= 0) {
            return false;
          }
          break;
        case SOUP:
          if (soupComb[meal] <= 0) {
            return false;
          }
          break;
        case DESSERT:
          if (dessertComb[meal] <= 0) {
            return false;
          }
          break;
        case MAIN:
          if (mainComb[meal] <= 0) {
            return false;
          }
          break;
      }
    }
    return true;
  }

  editCombinations(int meal, int type, String sign) {
    switch (type) {
      case MEAT:
        if (sign == '+') {
          meatComb[meal]++;
        } else {
          meatComb[meal]--;
        }
        break;
      case VEGE:
        if (sign == '+') {
          vegeComb[meal]++;
        } else {
          vegeComb[meal]--;
        }
        break;
      case SOUP:
        if (sign == '+') {
          soupComb[meal]++;
        } else {
          soupComb[meal]--;
        }
        break;
      case DESSERT:
        if (sign == '+') {
          dessertComb[meal]++;
        } else {
          dessertComb[meal]--;
        }
        break;
      case MAIN:
        if (sign == '+') {
          mainComb[meal]++;
        } else {
          mainComb[meal]--;
        }
        break;
    }
  }

  List<Dish> copyList(List<Dish> from){
    List<Dish>to = [];
    for (int i = 0; i < from.length; i++){
      int type = from[i].IType();
      String name = from[i].getName(); 
      to.add(Dish(n:name, t:type));
    }
    return to;
  }
}
