import 'dart:math';

import 'package:flutter/material.dart';


class AnimatedContainerPage extends StatefulWidget {
  AnimatedContainerPage({Key key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadios = BorderRadius.circular(8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animated Container'),
        ),
        body: Center(
          child: AnimatedContainer(
            
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            width: _width,
            height: _height,
            decoration:
                BoxDecoration(borderRadius: _borderRadios, color: _color),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.edit),
          onPressed: _changeShape,
        ));
  }

  void _changeShape() {
    final random = Random();
    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _borderRadios = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
