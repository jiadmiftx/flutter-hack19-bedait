import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackthon2019/models/CommunitiesModel.dart';
import 'detail.dart';
import 'clipper.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  var listCom = List<Communities>();

  @override
  void initState() {
    super.initState();
    getCommunities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffe9ecef),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 180.0,

              backgroundColor: Color(0xffe9ecef),

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
              flexibleSpace: ClipPath(
                clipper: Clipper(),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff3c8af7), Color(0xff27cafc)])),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 40.0,
                      ),
                      Text("Beda{IT} Berbagi Berkarya",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0)),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return _buildRooms(context, index);
              }, childCount: listCom.length),
            )
          ],
        ));
  }

  void viewDetail(BuildContext context, Communities community) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Detail(community)));
  }

  void getCommunities() {
    Firestore.instance.collection('communities').snapshots().listen((value) {
      List<Communities> listCommunities =
          value.documents.map((doc) => Communities.fromDocument(doc)).toList();
      setState(() {
        listCom = listCommunities;
        print("Banyak task : ${listCom.length}");
        listCom.forEach((communitiy) => print("${communitiy.name}"));
      });
    });
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

  Widget _buildRooms(BuildContext context, int index) {
    return InkWell(
      onTap: () => viewDetail(context, listCom[index]),
      child: Container(
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
                      Image.network(listCom[index].image),
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
                          listCom[index].name,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: <Widget>[
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
                                  listCom[index].location,
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
                                  "${listCom[index].member} People",
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Communities {
  var id;
  var name;
  var member;
  var location;
  var image;
  var categories;

  static Communities fromDocument(DocumentSnapshot doc) {
    Communities communitiy = Communities();
    communitiy.id = doc.documentID;
    communitiy.name = doc.data["name"];
    communitiy.member = doc.data["member"];
    communitiy.location = doc.data["location"];
    communitiy.image = doc.data["image"];
    communitiy.categories = doc.data["categories"];

    return communitiy;
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
