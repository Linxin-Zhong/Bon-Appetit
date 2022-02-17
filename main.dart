import 'package:flutter/material.dart';
import 'homePage.dart';
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

