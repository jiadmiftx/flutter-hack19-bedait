
import 'package:flutter/material.dart';
import 'clipper.dart';
import 'package:hackthon2019/screens/home.dart';
import 'package:hackthon2019/main.dart';

class LoginPage extends StatelessWidget {

  Widget _buildPageContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xff3c8af7), Color(0xff27cafc)])),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          CircleAvatar(
            child: Text(
              "BEDA{IT}",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 34),
            ),
            maxRadius: 50,
            backgroundColor: Colors.transparent,
          ),
          SizedBox(
            height: 20.0,
          ),
          _buildLoginForm(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // SizedBox(
              //   height: 48,
              //   width: 180,
              //   // child: RaisedButton(
              //   //   textColor: Colors.white,
              //   //   onPressed: () {},
              //   //   shape: RoundedRectangleBorder(
              //   //       borderRadius: BorderRadius.circular(40.0)),
              //   //   child: Text("Login with Google",
              //   //       style: TextStyle(color: Colors.white70)),
              //   //   color: Colors.red[400],
              //   // ),
              // ),
              // FlatButton(
              //   onPressed: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (BuildContext context) => SignupPage()));
              //   },
              //   child: Text("Login with Google",
              //       style: TextStyle(color: Colors.white, fontSize: 18.0)),
              // )
            ],
          )
        ],
      ),
    );
  }
Container _buildLoginForm(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      style: TextStyle(color: Colors.blue),
                      decoration: InputDecoration(
                          hintText: "Email address",
                          hintStyle: TextStyle(color: Colors.blue.shade200),
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.email,
                            color: Colors.blue,
                          )),
                    )),
                Container(
                  child: Divider(
                    color: Colors.blue.shade400,
                  ),
                  padding:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      style: TextStyle(color: Colors.blue),
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.blue.shade200),
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.lock,
                            color: Colors.blue,
                          )),
                    )),
                Container(
                  child: Divider(
                    color: Colors.blue.shade400,
                  ),
                  padding:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(color: Colors.black45),
                        ))
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 40,
                  width: 260,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) => BottomNavBar()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    child:
                        Text("Login", style: TextStyle(color: Colors.white70)),
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 40,
                  width: 260,
                  child: RaisedButton(
                    textColor: Colors.white,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    child: Text("Login with Google",
                        style: TextStyle(color: Colors.white70)),
                    color: Colors.red[400],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),

],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageContent(context),
    );
  }
}