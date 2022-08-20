import 'package:flutter/material.dart';
import 'database.dart';
import 'dish.dart';


class NewDishScreen extends StatefulWidget {
  final database db;
  NewDishScreen({required this.db});
  @override
  _NewDishScreenState createState() => _NewDishScreenState(db: this.db);
}

class _NewDishScreenState extends State<NewDishScreen> {

  String NewDishName = '';
  int NewDishType = -1;
  var items = <String>['Meat', 'Vegetable', 'Soup', 'Dessert', 'Main', 'Breakfast'];
  String inputValue = 'Meat';

  database db;
  _NewDishScreenState({required this.db});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 235, 231), //light pink
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: kToolbarHeight * 1.8,
        backgroundColor: Color.fromARGB(255, 253, 166, 131), //dark orange
        title: new Center(
          child: Text(
            'Add a new dish?',
            style: TextStyle(
                fontFamily: 'Gloria',
                color: Color.fromARGB(255, 230, 104, 102),
                fontWeight: FontWeight.bold,
                fontSize: 35),
          ),
        ),
        automaticallyImplyLeading: false, //设置没有返回按钮
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, this.db); // data back to the first screen},
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Dish Name',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 230, 104, 102),
                      width: 2,
                    ),
                  ),
                ),
                onChanged: (val) {
                  NewDishName = val;
                },
              ),
            ),
            Container(
              child: new DropdownButton(
                value: inputValue,
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(), 
                onChanged: (String? newValue) { 
                  setState(() {
                    inputValue= newValue!;
                  });
                }
              ),
            ),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          db.addDish(NewDishName, IType2(inputValue));
          Navigator.pop(context, this.db); // data back to the first screen},
        },
        label: const Text('save'),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
