import 'package:flutter/material.dart';
import 'database.dart';

void main() => runApp(MaterialApp(
      home: bonAppetit(
        db: database(),
      ),
    ));

//color values:
//dark pink: Color.fromARGB(255,231,151,150)
//light pink: Color.fromARGB(255,245,206,199)
//dark orange: Color.fromARGB(255,255,178,132)
//light orange: Color.fromARGB(255,255,201,136)

class bonAppetit extends StatefulWidget {
  @override
  database db;
  bonAppetit({required this.db});
  _bonAppetitState createState() => _bonAppetitState(db: this.db);
}

class _bonAppetitState extends State<bonAppetit> {
  database db;
  _bonAppetitState({required this.db});

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

      body: FirstPageBodyLayout(db),
    );
  }
}

Widget FirstPageBodyLayout(database db) {
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
          for (var i = 0; i < db.number; i++) EachDish(db, i),
        ],
      )
    );
  }
}

Widget EachDish (database db, int i){
  return Padding(
    padding: EdgeInsets.all(30),
    child: Container(
    width: 550,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color:Colors.white,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
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
  );
}

class NewDishScreen extends StatefulWidget {
  database db;
  NewDishScreen({required this.db});
  @override
  _NewDishScreenState createState() => _NewDishScreenState(db: this.db);
}

class _NewDishScreenState extends State<NewDishScreen> {
  String NewDishName = '';
  int NewDishType = 0;

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
      )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          db.addDish(NewDishName, 0);
          Navigator.pop(context, this.db); // data back to the first screen},
        },
        label: const Text('save'),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
