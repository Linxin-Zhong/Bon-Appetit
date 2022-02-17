import 'package:flutter/material.dart';
import 'database.dart';
import 'newDishPage.dart';

class bonAppetit extends StatefulWidget {
  @override
  database db;
  bonAppetit({required this.db});
  _bonAppetitState createState() => _bonAppetitState(db: this.db);
}

class _bonAppetitState extends State<bonAppetit> {
  static const int meat = 0;
  static const int vege = 1;
  static const int soup = 2;
  static const int dessert = 3;
  static const int main = 4;
  static const int breakfast = 5;
  
  database db;
  _bonAppetitState({required this.db});

  @override
  Widget build(BuildContext context) {
    double widthOfPage = MediaQuery.of(context).size.width;
    double heightOfPage = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 235, 231), //light pink
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: kToolbarHeight * 1.8,
        backgroundColor: Color.fromARGB(255, 253, 166, 131), //dark orange
        title: new Center(
          child: Text(
            'Dishes',
            style: TextStyle(
                fontFamily: 'Gloria',
                color: Color.fromARGB(255, 230, 104, 102),
                fontWeight: FontWeight.bold,
                fontSize: 50),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 50),
            child: IconButton(
              icon: Icon(
                Icons.add_circle,
                size: 70,
              ),
              tooltip: 'Add a new dish',
              onPressed: () async {
                final dataFromNewDishScreen = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewDishScreen(db: this.db)),
                ) as database;
                db.number = dataFromNewDishScreen.number;
                setState(() {
                  //refresh
                });
              },
            ),
          ),
        ],
      ),

      body: FirstPageBodyLayout(db, widthOfPage, heightOfPage),
    );
  }
}

Widget FirstPageBodyLayout(database db, double widthOfPage, double heightOfPage) {
  if (db.number == 0) {
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
        child: Text(
          'Use the + button to add some new dish',
          style: TextStyle(
              fontFamily: 'Gloria',
              color: Color.fromARGB(255, 199, 77, 75),
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
      ),
    );
  } else {
    return Center(
      child: Column(
        children: [
          for (var i = 0; i < db.number; i++) EachDish(db, i, widthOfPage, heightOfPage),
        ],
      )
    );
  }
}

Widget EachDish (database db, int i, double widthOfPage, double heightOfPage){
  return Padding(
    padding: EdgeInsets.all(30),
    child: Container(
    width: 0.9 * widthOfPage,
    height: 0.15 * heightOfPage,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color:Colors.white,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    child: Column(
      children: [
        Container(
          child: Text(
            db.dishes[i].name,
            textAlign: TextAlign.center,
            style: TextStyle (
              fontFamily: 'Gloria', 
              color: Color.fromARGB(255, 199, 77, 75),
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
        ),
        Container(
           child: Text(
            db.dishes[i].SType(),
            textAlign: TextAlign.center,
            style: TextStyle (
              fontFamily: 'Gloria', 
              color: Color.fromARGB(255, 199, 77, 75),
              fontSize: 15
            ),
          ),
        ),
      ]
    )
  ),
  );
}