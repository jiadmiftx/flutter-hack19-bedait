import 'package:cloud_firestore/cloud_firestore.dart';

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