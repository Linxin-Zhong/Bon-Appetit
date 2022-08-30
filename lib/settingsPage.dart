import 'package:flutter/material.dart';
import 'database.dart';
import 'dish.dart';

class settingsPage extends StatefulWidget {
  final DataBase db;
  settingsPage({required this.db});
  @override
  _settingsState createState() => _settingsState(db: this.db);
}

class _settingsState extends State<settingsPage> {
  double l = 30.0;
  DataBase db;
  _settingsState({required this.db});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, this.db); // data back to the first screen},
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Text('Breakfast'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              numEditor(BREAKFAST,MEAT,0),
                              numEditor(BREAKFAST,VEGE,2),
                              numEditor(BREAKFAST,SOUP,4),
                              numEditor(BREAKFAST,DESSERT,6),
                              numEditor(BREAKFAST,MAIN,8),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Text('Lunch'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              numEditor(LUNCH,MEAT,0),
                              numEditor(LUNCH,VEGE,2),
                              numEditor(LUNCH,SOUP,4),
                              numEditor(LUNCH,DESSERT,6),
                              numEditor(LUNCH,MAIN,8),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Text('Dinner'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              numEditor(DINNER,MEAT,0),
                              numEditor(DINNER,VEGE,2),
                              numEditor(DINNER,SOUP,4),
                              numEditor(DINNER,DESSERT,6),
                              numEditor(DINNER,MAIN,8),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget numEditor(int meal, int type, int buttonIndex) {
    int buttonIndex2 = buttonIndex+1;
    return Padding(
      padding: EdgeInsets.all(l / 2),
      child: Column(children: [
        Text(typeName(type)),
        Row(children: [
          Container(
              height: l,
              width: l,
              child: (FittedBox(
                child: FloatingActionButton(
                    heroTag: buttonIndex.toString(),
                    child: const Icon(Icons.minimize),
                    onPressed: () {
                      if (!db.ableToChange(meal, type, '-')) {
                        cantDecrease();
                      } else {
                        db.editCombinations(meal, type, '-');
                      }
                      setState(() {
                        //refresh
                      });
                    }),
              ))),
          Container(
              height: l,
              width: l,
              child: Align(
                  alignment: Alignment.center,
                  child: Text(typeNum(meal, type)))),
          Container(
              height: l,
              width: l,
              child: (FittedBox(
                child: FloatingActionButton(
                    heroTag: buttonIndex2.toString(),
                    child: const Icon(Icons.add),
                    onPressed: () {
                      if (!db.ableToChange(meal, type, '+')) {
                        cantAdd();
                      } else {
                        db.editCombinations(meal, type, '+');
                      }
                      setState(() {
                        //refresh
                      });
                    }),
              ))),
        ])
      ]),
    );
  }

  String typeNum(int meal, int type) {
    switch(type){
      case MEAT: return db.meatComb[meal].toString();
      case VEGE: return db.vegeComb[meal].toString();
      case SOUP: return db.soupComb[meal].toString();
      case DESSERT: return db.dessertComb[meal].toString();
      case MAIN: return db.mainComb[meal].toString();
    }
    return 'Error';
  }
  String typeName(int type) {
    switch(type){
      case MEAT: return 'Meat';
      case VEGE: return 'Vege';
      case SOUP: return 'Soup';
      case DESSERT: return 'Dessert';
      case MAIN: return 'Main';
    }
    return 'Error';
  }


  Future<String?> cantDecrease() {
    return showDialog<String>(
        context: context,
        builder: ((context) => AlertDialog(
              title: const Text('Already zero, cannot decrease more'),
              actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'))
              ],
            )));
  }

  Future<String?> cantAdd() {
    return showDialog<String>(
        context: context,
        builder: ((context) => AlertDialog(
              title:
                  const Text('You have not define any dish with this type yet'),
              content: const Text('Please add a dish of this type first'),
              actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'))
              ],
            )));
  }
}
