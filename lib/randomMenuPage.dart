import 'package:flutter/material.dart';
import 'database.dart';
import 'dish.dart';


class randomMenuPage extends StatefulWidget {
  final DataBase db;
  randomMenuPage({required this.db});
  @override
  _randomMenuState createState() => _randomMenuState(db: this.db);
}

class _randomMenuState extends State<randomMenuPage> {

  DataBase db;
  _randomMenuState({required this.db});
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
