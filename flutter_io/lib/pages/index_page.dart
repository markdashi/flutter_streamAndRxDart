import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/category_page.dart';
import '../pages/member_page.dart';

class IndexPage extends StatefulWidget {
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

 int _currentIndex = 0;
 
 List<Widget> _pages = [
   HomePage(),
   CategoryPage(),
   MemberPage()
 ];
 List<BottomNavigationBarItem> _items = [
   BottomNavigationBarItem(
     title: Text('主页'),
     icon: Icon(Icons.home)
   ),
   BottomNavigationBarItem(
     title: Text('类别'),
     icon: Icon(Icons.category)
   ),
   BottomNavigationBarItem(
     title: Text('我的'),
     icon: Icon(Icons.card_membership)
   ),
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}