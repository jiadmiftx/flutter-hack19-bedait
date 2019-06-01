import 'package:flutter/material.dart';

class mySubtitle extends StatelessWidget {
  const mySubtitle({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      color: Colors.grey
    ));
  }
}

class myTitle extends StatelessWidget {
  const myTitle({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 18.0
    ),);
  }
}