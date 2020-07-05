import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  ListViewPage({Key key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<int> _numbersList = new List();
  int _lastItem = 0;
  ScrollController _scrollController = new ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _addTen();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
        ),
        body: Stack(children: <Widget>[_createList(), _createLoading()]));
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: getPageOne,
      child: ListView.builder(
        itemCount: _numbersList.length,
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          final img = _numbersList[index];
          _lastItem = index;
          return FadeInImage(
              placeholder: AssetImage('data/original.gif'),
              image:
                  NetworkImage('https://i.picsum.photos/id/$img/600/600.jpg'));
        },
      ),
    );
  }

  _addTen() {
    setState(() {
      for (var i = 0; i < 10; i++) {
        _numbersList.add(_lastItem++);
      }
    });
  }

  Future<Null> _fetchData() {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    new Timer(duration, callHttp);
  }

  void callHttp() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 300,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
    _addTen();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 20)
        ],
      );
    } else {
      return Container();
    }
  }
  Future<Null> getPageOne() async{
    final duration= Duration(seconds: 2);
    new Timer(duration, (){
        _numbersList.clear();
        _lastItem++;
        _addTen();

     });
     return Future.delayed(duration);
  }
}
