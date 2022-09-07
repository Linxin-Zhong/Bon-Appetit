import 'package:flutter/material.dart';
import 'database.dart';
import 'dish.dart';
import 'dishDetail.dart';

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Random One-Day Menu'),
        ),
        body: Center(child: RandomPageBody()));
  }

  Widget RandomPageBody() {
    if (this.db.number == 0) {
      return Column(children: [
        Text('You have no dishes to generate the random menu yet'),
        Text('Please add some dish from the home page')
      ]);
    } else {
      return Container(
        child: Column(children: [
        Column(children: [
          Text('Breakfast'),
          SizedBox(
      height: 120,
      child: ListView.builder(
        itemCount: db.randomBreakfast.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int i) => _buildBox(color: Colors.orange,  t: db.randomBreakfast[i].getName()),
      ),
    )
        ]),
        Column(children: [
          Text('Lunch'),
          SingleChildScrollView(),
        ]),
        Column(children: [
          Text('Lunch'),
          SingleChildScrollView(),
        ])
    ]));


    }
  }

  Widget _buildBox({required Color color, required String t}) => 
  Container(
    margin: EdgeInsets.all(12), height: 100, width: 200, color: color,
    child: Text(t));

}
