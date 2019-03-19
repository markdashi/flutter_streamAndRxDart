import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './pages/index_page.dart';
import './pages/login_page.dart';
import './pages/bloc.dart';

void main(){
runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      home: IndexPage(),
      initialRoute: '/bloc',
      routes: {
        '/bloc':(context) => BlocPage(),
        '/login':(context) => LoginPage()
      },
    );
  }
}