import 'package:flutter/material.dart';

class Hubs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
      
          leading: Icon(Icons.home),
        ),
        body: Container(
          color: Color(0xffe9ecef),
          child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
            
                  ],
                ),
              Card(child: Column
                (children: <Widget>[
               
                    Image.network('http://pngimg.com/uploads/assassins_creed/assassins_creed_PNG76.png')
                 ],
                ),
              )

              ],
            ),    
          ),
        ),
      );
  }
}