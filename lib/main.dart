import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hackthon2019/screens/had.dart';
import 'package:hackthon2019/screens/headset.dart';
import 'package:hackthon2019/screens/home.dart';
import 'package:hackthon2019/screens/hubs.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;

  //Membuat Pages
  final HomeScreen _home = HomeScreen();
  final Headset _headset = Headset();
  final Hubs  _hubs = Hubs();
  final Had _had = Had();

  Widget _showPage = new HomeScreen();

  Widget _pageChooser(int page){
    switch (page) {
      case 0:
      return _home;
      break;
      case 1:
      return _headset;
      break;
      case 2:
      return _hubs;
      break;
      case 3:
      return _had;
      break;
      default:
      return new Container(
        child: new Center(
          child: Text('No Page Found'),
        ),
      );
      
      
        
  
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          initialIndex: pageIndex,
     
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.call_split, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Color(0xffe9ecef),
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            // child: Text(_page.toString(), textScaleFactor: 10.0),
            child: _showPage,
          ),
        ));
  }
}
