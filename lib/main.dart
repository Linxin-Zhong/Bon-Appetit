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
      backgroundColor: Color.fromARGB(255, 253, 218, 211),//light pink
      appBar: AppBar(
           centerTitle: true,
           toolbarHeight: kToolbarHeight*1.8,
           backgroundColor: Color.fromARGB(255, 253, 166, 131),//dark orange
           title: new Center(
           child: Text('Dishes', 
           style: TextStyle(fontFamily: 'Gloria', 
           color: Color.fromARGB(255, 230, 104, 102),
           fontWeight: FontWeight.bold,
           fontSize: 50),),
        ),
        actions: <Widget>[
                 Padding(
                 padding: EdgeInsets.only(right: 50),
                 child: IconButton(
                   icon: Icon(Icons.add_circle, size: 70,),
                   tooltip: 'Add a new dish',
                   onPressed: () {
          setState(() {
            Number_of_dishes ++;
          });
        },
                 ),
      ),
              ],
          ),
    
      body: new Center(
         child: getWidget(Number_of_dishes)
      ),
      
    );
  }
}

Widget getWidget(int Number_of_dishes) {
  if (Number_of_dishes == 0){
    return Padding(
      padding:EdgeInsets.fromLTRB(35, 0, 35, 0),
      child:Text('Use the + button to add some new dish',
    style: TextStyle(fontFamily: 'Gloria', 
           color: Color.fromARGB(255, 199, 77, 75),
           fontWeight: FontWeight.bold,
           fontSize: 30),),
    );
  } else {
    return Text('$Number_of_dishes');
  }
}

    