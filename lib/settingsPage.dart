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
      body: Column(
        children:[
          Flexible(child: Container(
            child: Align(
              alignment: Alignment.topCenter,
              child:(
                Text('Breakfast')
              ),
            ),
          )),
          Flexible(child: Container(
            child: Align(
              alignment: Alignment.topCenter,
              child:(
                Text('Lunch')
              ),
            ),
          )),
          Flexible(child: Container(
            child: Align(
              alignment: Alignment.topCenter,
              child:(
                Text('Dinner')
              ),
            ),
          )),
        ],
      ),
    );
  }
}
