import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:rxdart/rxdart.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  StreamSubscription _streamSubscription;
  StreamController<String> _streamController;
  StreamSink _sink;
  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }
  @override
  void initState() {
    super.initState();
    // print('Create a stream');
    // Stream<String> _stream = Stream.fromFuture(fetchData());
    // print('start listening on a stream.');
    // _streamSubscription = _stream.listen(onData,onError: onError,onDone: onDone);
    // print('Initial stream completed！');
    _streamController = StreamController<String>.broadcast();
    _streamSubscription = _streamController.stream.listen(onData,onError: onError,onDone: onDone);
    _streamController.stream.listen(onDataTwo,onError: onError,onDone: onDone);
    
    _sink = _streamController.sink;
  }
  void onData(String data){
      print('onData receive ~ $data');
  }
  void onDataTwo(String data){
      print('onDataTwo receive ~ $data');
  }
  void onError(error){
    print('onError - $error');
  }
  void onDone(){
    print('onDone');
  }

  Future<String> fetchData() async{
    await Future.delayed(Duration(seconds: 3));
    return '~hello world ${Random().nextBool()}';
  }

  void _pause(){
    print('Pause subscription');
    _streamSubscription.pause();
  }
  void _resume(){
    print('Resume subscription');
    _streamSubscription.resume();
  }
  void _cancel(){
    print('Cancel subscription');
    _streamSubscription.cancel();
  }
  void _addDataStream() async{
    print('Add data to stream');
    String data = await fetchData();
    //_streamController.add(data);
    _sink.add(data);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder(
            stream: _streamController.stream,
            initialData: '...',
            builder: (context,snapshot){
              return Text('${snapshot.data}');
            },
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  shape: StadiumBorder(),
                  onPressed: _addDataStream,
                  child: Text('Add'),
                  elevation: 0.0,
                  highlightElevation: 0.0,
                ),
                FlatButton(
                  color: Colors.green,
                  shape: BeveledRectangleBorder(),
                  onPressed: _pause,
                  child: Text('Pause'),
                ),
                FlatButton(
                  color: Colors.green,
                  shape: BeveledRectangleBorder(),
                  onPressed: _resume,
                  child: Text('Resume'),
                ),
                FlatButton(
                  color: Colors.green,
                  shape: BeveledRectangleBorder(),
                  onPressed: _cancel,
                  child: Text('Cancel'),
                )
              ],
            ),
        ],
      ),
    );
  }
}