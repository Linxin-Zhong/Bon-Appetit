import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  home: bonAppetit(),
));

//color values:
//dark pink: Color.fromARGB(255,231,151,150)
//light pink: Color.fromARGB(255,245,206,199)
//dark orange: Color.fromARGB(255,255,178,132)
//light orange: Color.fromARGB(255,255,201,136)


class bonAppetit extends StatefulWidget {
  @override
  _bonAppetitState createState() => _bonAppetitState();
}

class _bonAppetitState extends State<bonAppetit>{

  int Number_of_dishes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255,245,206,199),//light pink
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255,255,178,132),//dark orange
        title: new Center(
          child: Text('Dishes', 
              style: TextStyle(fontFamily: 'Gloria'),),
        )
      ),
      body: new Center(
         child: getWidget(Number_of_dishes)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Number_of_dishes ++;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red[100],
      ),
    );
  }
}

Widget getWidget(int Number_of_dishes) {
  if (Number_of_dishes == 0){
    return Text('Use the '+' button to add some new dish');
  } else {
    return Text('$Number_of_dishes');
  }
}
