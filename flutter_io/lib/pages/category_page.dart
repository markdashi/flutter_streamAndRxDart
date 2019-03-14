import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CategoryPage'),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.green,
              height: 40,
              margin: EdgeInsets.only(top: 20,left: 20,right: 20),
              width: 375,
              child: FlatButton(
              color: Colors.orange,
              onPressed: (){},
              child: Text('登录'),
              shape: BeveledRectangleBorder(),  
            ),
            ),
            FlatButton(
              color: Colors.orange,
              onPressed: (){},
              child: Text('登录'),
              shape: StadiumBorder(),
            )

          ],
        )
      ),
    );
  }
}