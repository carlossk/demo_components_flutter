import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          _cardtypeOne(),
          SizedBox(),
          _cardTypeTwo(),
          SizedBox(),
          _cardtypeOne(),
          SizedBox(),
          _cardTypeTwo(),
          SizedBox(),
          _cardtypeOne(),
          SizedBox(),
          _cardTypeTwo(),
          SizedBox(),
          _cardtypeOne(),
          SizedBox(),
          _cardTypeTwo(),
          SizedBox(),
          _cardtypeOne(),
          SizedBox(),
          _cardTypeTwo(),
          SizedBox(),
        ],
      ),
    );
  }

  Widget _cardtypeOne() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Hola muy buenas a todos'),
            subtitle: Text(
                'esta es una tarjeta en flutter para trabajar con las tarjetas y el coronavirus esta muy contagioso'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  print('cancel');
                },
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  print('OK');
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTypeTwo() {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://cdn.theculturetrip.com/wp-content/uploads/2017/12/shutterstock_743160877-1.jpg'),
            placeholder: AssetImage('data/original.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300,
            fit: BoxFit.cover,
          ),
          // Image(
          //   image: NetworkImage(
          //       'https://cdn.theculturetrip.com/wp-content/uploads/2017/12/shutterstock_743160877-1.jpg'),
          // ),
          Container(
              padding: EdgeInsets.all(10), child: Text('esto es un texto'))
        ],
      ),
    );
  }
}
