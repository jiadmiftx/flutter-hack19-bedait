import 'package:flutter/material.dart';
import 'package:hackthon2019/models/CommunitiesModel.dart';
class Detail extends StatefulWidget {
  final Communities community;

  Detail(this.community);
  @override
  _DetailState createState() => _DetailState(this.community);
}

class _DetailState extends State<Detail> {
  Communities community;
  

  _DetailState(this.community);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(community.name),),
    );
  }
}