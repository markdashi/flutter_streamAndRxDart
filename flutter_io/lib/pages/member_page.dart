import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:math';
import 'dart:async';

class MemberPage extends StatefulWidget {
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {


 PublishSubject _subject;
 void initState() { 
   super.initState();
   //  Observable<T> extends Stream<T>
   //  Observable 继承于 Stream
  //  Observable<String> _observable = Observable(Stream.fromIterable(['hello','nihao']));
  // _observable.listen(print);
 
  // Stream _stream = Stream.fromIterable(['hello1','world1']);
  // _stream.listen(print);

  // PublishSubject相当于 StreamController
  // 1.PublishSubject
  // PublishSubject<String> _subject = PublishSubject<String>();
  // _subject.listen((string)=>print('receive - $string'));
  // _subject.add('${Random().nextInt(100)}');
  // _subject.add('${Random().nextInt(100)}');
  // _subject.add('${Random().nextInt(100)}');
  
  // 2.BehaviorSubject
  // 只会捕获最新添加的数据
  // BehaviorSubject<String> _subjetc2 = BehaviorSubject<String>();

  // // 3.ReplaySubject
  // // 可以控制接收的数量
  // ReplaySubject<String> _subject3 = ReplaySubject<String>(maxSize: 2); 
    _subject = PublishSubject();
    _subject
        //.map((item)=>'item:$item') // 数据转换
        //.where((item) => item.length>3) // 添加过滤条件
        .debounce(Duration(milliseconds: 500)) // 输入结束后500ms才输出数据 可以进行数据校验，错误提示等
        .listen((data)=> print('$data'));
 }

 @override
  void dispose() {
    super.dispose();
    _subject.close();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MemberPage'),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black
        ),
        child: TextField(
          onChanged: (value){
              _subject.add(value);
          },
          decoration: InputDecoration(
            labelText: 'title',
            filled: true
          ),
        ),
      ),
    );
  }
}