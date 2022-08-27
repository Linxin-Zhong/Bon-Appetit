import 'package:flutter/material.dart';
import 'database.dart';
import 'dish.dart';


class randomMenuPage extends StatefulWidget {
  final DataBase db;
  randomMenuPage({required this.db});
  @override
  _NewDishScreenState createState() => _NewDishScreenState(db: this.db);
}

class _NewDishScreenState extends State<randomMenuPage> {

  DataBase db;
  _NewDishScreenState({required this.db});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Random Menu'),
      ),
    );
  }
}
