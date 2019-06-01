import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackthon2019/models/CommunitiesModel.dart';

final List rooms = [
  {
    "image": "assets/hotel/room1.jpg",
    "title": "Lombok Dev",
    "location": "Mataram",
    "member": "342"
  },
  {
    "image": "assets/hotel/room2.jpg",
    "title": "LombokMachi",
    "location": "Mataram",
    "member": "231"
  },
  {
    "image": "assets/hotel/room3.jpg",
    "title": "Beautiful Room",
    "location": "Mataram",
    "member": "213"
  },
  {
    "image": "assets/hotel/room4.jpg",
    "title": "Vintage room near Pashupatinath",
    "location": "Mataram",
    "member": "223"
  },
];

class HotelHomePage extends StatelessWidget {
  // var listCommunities = List<Communities>();
  
  // void getCommunities() {
  //   Firestore.instance.collection('communities').snapshots().listen((value) {
  //     listCommunities =
  //         value.documents.map((doc) => Communities.fromDocument(doc)).toList();
  //   });
  //   print("DATAAAAA"+listCommunities.toString());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe9ecef),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 180.0,

            // backgroundColor: Colors.cyan,

            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                //  @TODO
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
            floating: true,
            flexibleSpace: ListView(
              children: <Widget>[
                SizedBox(
                  height: 70.0,
                ),
                Text("Bedait Berbagi Berkarya",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0)),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.0)),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Find Community",
                      border: InputBorder.none,
                      icon: IconButton(
                          onPressed: () {}, icon: Icon(Icons.search)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10.0,
            ),
          ),
          SliverToBoxAdapter(
            child: _buildCategories(),
          ),
          // SliverList(
          //   delegate:
          //       SliverChildBuilderDelegate((BuildContext context, int index) {
          //     return _buildRooms(context, index);
          //   }, childCount: rooms.length),
          // )
        ],
      ),
    );
  }

  // Widget _buildListView(BuildContext context){
  //   return Scaffold(
  //       body: ListView.builder(
  //       itemCount: listCommunities.length,
  //       itemBuilder: (context, index) {
  //         if (listCommunities == null) {
  //           return Text("Loading");
  //         } else {
  //           return InkWell(
  //             onTap: () => {},
  //             child: Padding(
  //               padding: const EdgeInsets.all(4.0),
  //               child: Card(
  //                 margin: EdgeInsets.all(2.0),
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: <Widget>[
  //                     ListTile(
  //                       leading: Icon(Icons.person),
  //                       title:  Text(
  //                       listCommunities[index].name,
  //                       style: TextStyle(fontSize: 24),
                        
  //                     ),
  //                     subtitle: Text(listCommunities[index].location),
  //                     ),
                     
                      
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }

  Widget _buildRooms(BuildContext context, int index) {
    var room = rooms[index % rooms.length];

    return Container(
      margin: EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image.asset(room['image']),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.grey.shade800,
                        size: 28.0,
                      ),
                    ),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 32.0,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        room['title'],
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            room['location'],
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.group,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            room['member'] + " People",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(
            width: 15.0,
          ),
          Category(
            backgroundColor: Colors.lightBlueAccent,
            icon: Icons.code,
            title: "Programer",
          ),
          SizedBox(
            width: 15.0,
          ),
          Category(
            backgroundColor: Colors.blue,
            title: "Game",
            icon: Icons.games,
          ),
          SizedBox(
            width: 15.0,
          ),
          Category(
            icon: Icons.art_track,
            backgroundColor: Colors.orange,
            title: "Design",
          ),
          SizedBox(
            width: 15.0,
          ),
          Category(
            icon: Icons.camera,
            backgroundColor: Colors.pinkAccent,
            title: "Photography",
          ),
          SizedBox(
            width: 15.0,
          ),
          Category(
            icon: Icons.business,
            backgroundColor: Colors.red,
            title: "Business",
          ),
          SizedBox(
            width: 15.0,
          ),
          Category(
            icon: Icons.healing,
            backgroundColor: Colors.green,
            title: "Sport",
          )
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color backgroundColor;

  const Category(
      {Key key,
      @required this.icon,
      @required this.title,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.all(10.0),
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(title, style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }
}
