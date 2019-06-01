import 'package:flutter/material.dart';

final List mycomunity = [
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

class MyCommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe9ecef),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 180.0,
            pinned: true,
            bottom: new PreferredSize(preferredSize: Size.fromHeight(120.0),
            child: Text(''),  ),
            backgroundColor: Color(0xffe9ecef),
            floating: true,
            flexibleSpace: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Hello Sai Ageh,",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                          Text(
                            "Bedait Berbagi Berkarya",
                            style: TextStyle(color: Colors.grey.shade700),
                          )
                        ],
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/img/7.jpg'),
                        radius: 40,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.0)),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Find Youre Community",
                      border: InputBorder.none,
                      icon: IconButton(
                          onPressed: () {}, icon: Icon(Icons.search)),
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10.0,
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return _buildCommunity(context, index);
            }, childCount: 100),
          )
        ],
      ),
    );
  }

  Widget _buildCommunity(BuildContext context, int index) {
    var mycomunitys = mycomunity[index % mycomunity.length];
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
                    Image.asset(mycomunitys['image']),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Icon(
                        Icons.edit,
                        color: Colors.blueAccent,
                        size: 34.0,
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
                        mycomunitys['title'],
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          Text(
                            mycomunitys['location'],
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.group,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          Text(
                            mycomunitys['member'] + " People",
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
}
