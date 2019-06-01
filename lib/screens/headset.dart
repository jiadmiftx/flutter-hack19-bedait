import 'package:flutter/material.dart';

class Headset extends StatelessWidget {
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
              
                    Image.network('http://www.stickpng.com/assets/images/580b57fcd9996e24bc43c295.png')
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