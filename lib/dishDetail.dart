import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dish.dart';

class DishDetailPage extends StatelessWidget {
  // const DishDetailPage({Key? key}) : super(key: key);

  final Dish dish;

  DishDetailPage(this.dish);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dish.name),
      ),
    );
  }
}