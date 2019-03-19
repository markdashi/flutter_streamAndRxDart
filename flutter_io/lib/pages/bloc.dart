import 'package:flutter/material.dart';
import 'dart:async';

class BlocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      bloc: CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('BlocPage'),
          elevation: 0.0,
        ),
        body: Center(
          child: MyActionChip(),
        ),
        floatingActionButton: FloatingActionMyButton(),
      ),
    );
  }
}

class MyActionChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return ActionChip(
      label: Text('0'),
      onPressed: (){
          _counterBloc.log();
      },
    );
  }
}

class FloatingActionMyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return FloatingActionButton(
      onPressed: (){
        // _counterBloc.log();
        _counterBloc.counter.add(1);
      },
      child: Icon(Icons.add),
    );
  }
}

class CounterProvider extends InheritedWidget {
  CounterProvider({Key key, this.child,this.bloc}) : super(key: key, child: child);

  final Widget child;
  final CounterBloc bloc;

  static CounterProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CounterProvider)as CounterProvider);
  }

  @override
  bool updateShouldNotify( CounterProvider oldWidget) {
    return true;
  }
}

// 负责传递数据
class CounterBloc {
  final _counterActionController = StreamController<int>();
  // 可以使用sink 往Stream 上添加数据了
  StreamSink<int> get counter => _counterActionController.sink;

  CounterBloc(){
    _counterActionController.stream.listen(onData);
  }
  void onData(int data){
    print(data);
  }

  void dispose(){
    _counterActionController.close();
  }
  
   void log(){
     print('Bloc');
   }
}