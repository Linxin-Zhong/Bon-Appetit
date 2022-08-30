import 'package:first_app/randomMenuPage.dart';
import 'package:flutter/material.dart';
import 'database.dart';
import 'newDishPage.dart';
import 'randomMenuPage.dart';
import 'settingsPage.dart';
import 'dish.dart';
import 'dishDetail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
// import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  final DataBase db;
  HomePage({required this.db});
  _HomePageState createState() => _HomePageState(db: this.db);
}

class _HomePageState extends State<HomePage> {
  static const int meat = 0;
  static const int vege = 1;
  static const int soup = 2;
  static const int dessert = 3;
  static const int main = 4;
  
  DataBase db;
  _HomePageState({required this.db});

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
          child: AutoSizeText(
            'Dish List',
            style: GoogleFonts.righteous(
              textStyle: TextStyle(
                  // fontFamily: 'Gloria',
                  color: Color.fromARGB(255, 230, 104, 102),
                  // fontWeight: FontWeight.bold,
                  fontSize: 50
              ))
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
                ) as DataBase;
                db.number = dataFromNewDishScreen.number;
                setState(() {
                  //refresh
                });
              },
              
            ),
          ),
        
        ],
        leading: IconButton(
              icon: Icon(
                Icons.settings,
                size: 70,
              ),
              tooltip: 'Settings',
              onPressed: () async {
                final dataFromSettingsScreen = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => settingsPage(db: this.db)),
                ) as DataBase;
                //***db.number = dataFromNewDishScreen.number;
                setState(() {
                  //refresh
                });
              },
            ),
      ),

      // body: FirstPageBodyLayout(db, context, widthOfPage, heightOfPage),
      body: (db.number == 0) ?
        Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
            child: Text(
              'Use the + button to add some cool new dishes :)',
              style: GoogleFonts.exo(
                textStyle: TextStyle(
                  // fontFamily: 'Gloria',
                  color: Color.fromARGB(255, 170, 170, 170),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              )
            ),
          ),
        ):
        ListView.builder(
          itemCount: db.number,
          itemBuilder: (context, index) {
            final Dish dish = db.dishes[index];
            return Dismissible(
              key: Key(dish.name),
              onDismissed: (direction) {
                setState(() {
                  db.removeDish(dish.name, index, dish.type);
                });
                ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('item removed.')));
              },
              child: Card(
                child: ListTile(
                  title: Text(dish.name),
                  subtitle: Text(dish.SType()),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:(context) {
                          return DishDetailPage(dish);
                        },
                    ));
                  },
                )
            ));
          }
        ),
      floatingActionButton: FloatingActionButton.extended(
        
        onPressed: () {
           Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => randomMenuPage(db: this.db)),
          );
        }, 
        label: Text('Generate Random Menu'),
      ),
    );
  }
}

