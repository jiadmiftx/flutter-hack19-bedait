import 'package:flutter/material.dart';
import 'package:hackthon2019/screens/ui_components/typografi.dart';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.blue,
          leading: Icon(Icons.contacts),
          title: Text('You'),
        ),
        body: Container(
          color: Color(0xffe9ecef),
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: <Widget>[
              ListTile(
                onTap: () {},
                leading: Icon(Icons.edit),
                title: myTitle(text: "My Event"),
              ),
              ListTile(
                onTap: (
                  
                ) {},
                leading: Icon(Icons.group),
                title: myTitle(text: "My Community"),
              ),
        
              ListTile(
                onTap: () {},
                leading: Icon(Icons.settings),
                title: myTitle(text: "My Account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}