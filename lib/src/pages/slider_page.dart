import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 0;
  bool _lock = false;

  @override
  Widget build(BuildContext context) {
    // Scaffold customScaffold = generateScaffold('Sliders');
    // customScaffold.body=
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: <Widget>[
              _createSlider(),
              _createCheckbox(),
              _createSwitch(),
              Expanded(child: _createImage())
            ],
          )),
    );
  }

  Widget _createSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Size',
        value: _sliderValue,
        min: 0,
        max: 400,
        onChanged: !_lock
            ? (value) {
                setState(() {
                  _sliderValue = value;
                });
              }
            : null);
  }

  Widget _createImage() {
    return Image(
        width: _sliderValue,
        fit: BoxFit.contain,
        image: NetworkImage(
            'https://i.ytimg.com/vi/dil6O6imS_8/maxresdefault.jpg'));
  }

  _createCheckbox() {
    return CheckboxListTile(
      title: Text('slide block'),
        value: _lock,
        onChanged: (value) {
          setState(() {
            _lock = value;
          });
        });
  }

  _createSwitch() {
     return SwitchListTile (
      title: Text('slide block'),
        value: _lock,
        onChanged: (value) {
          setState(() {
            _lock = value;
          });
        });
  }
}
