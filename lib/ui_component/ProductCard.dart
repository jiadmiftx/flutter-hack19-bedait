import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[700],
            offset: Offset(2, 2),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                image: DecorationImage(
                    image: NetworkImage("https://warungdulukala.com/wp-content/uploads/2018/09/es-teh-manis-1.jpg",),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  color: Colors.blue
                ),
              child: Column(
                children: <Widget>[
                  Text("Teh manis"),
                  Text("Rp. 5000"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
