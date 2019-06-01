import 'package:flutter/material.dart';

class Had extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
      
          leading: Icon(Icons.home),
        ),
        body: Container(
          color: Color(0xffe9ecef),
          child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('Row'),
                    Text('Row2'),
                    Text('Row3'),
                    Text('Row4'),
                  ],
                ),
              Card(child: Column
                (children: <Widget>[
                    Text('Column'),
                    Text('column'),
                    Image.network('https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=2ahUKEwjK3dn-p8HiAhVu7XMBHaGpCMsQjRx6BAgBEAU&url=http%3A%2F%2Fpngimg.com%2Fimgs%2Fgames%2Fassassins_creed%2F&psig=AOvVaw04UJq_UUR-g6nirb9iPDjd&ust=1559238968809576')
                 ],
                ),
              )

              ],
            ),    
          ),
        ),
      );
  }
}