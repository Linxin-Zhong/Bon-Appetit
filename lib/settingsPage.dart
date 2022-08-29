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
                            children: [
                              Column(children: [
                                Text('Meat'),
                                Row(children: [
                                  Container(
                                      height: 30,
                                      width: 30,
                                      child: (FittedBox(
                                        child: FloatingActionButton(
                                            child: const Icon(Icons.minimize),
                                            onPressed: () {
                                              if (!db.ableToChange(
                                                  BREAKFAST, MEAT, '-')) {
                                                cantDecrease();
                                              } else {
                                                db.editCombinations(
                                                    BREAKFAST, MEAT, '-');
                                              }
                                              setState(() {
                                                //refresh
                                              });
                                            }),
                                      ))),
                                  Text(db.meatComb[0].toString()),
                                  Container(
                                      height: 30,
                                      width: 30,
                                      child: (FittedBox(
                                        child: FloatingActionButton(
                                            child: const Icon(Icons.add),
                                            onPressed: () {
                                              if (!db.ableToChange(
                                                  BREAKFAST, MEAT, '+')) {
                                                cantAdd();
                                              } else {
                                                db.editCombinations(
                                                    BREAKFAST, MEAT, '+');
                                              }
                                              setState(() {
                                                //refresh
                                              });
                                            }),
                                      ))),
                                ])
                              ])
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
                    child: (Text('Lunch')),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: (Text('Dinner')),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
