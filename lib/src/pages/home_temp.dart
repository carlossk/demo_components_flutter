import 'package:flutter/material.dart';

class HomeTemp extends StatelessWidget {
  final options = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco', 'Seis'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components temp'),
      ),
      body: ListView(
        children: _createItemsShort(),
      ),
    );
  }

  List<Widget> _createItems() {
    List<Widget> items = new List<Widget>();
    for (var item in options) {
      final tempWidget = ListTile(
        title: Text(item),
      );
      items..add(tempWidget)..add(Divider());
    }
    return items;
  }

  List<Widget> _createItemsShort() {
    return    options.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item+'!'),
            leading: Icon(Icons.account_balance),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: ()=>{
              print('hola')
            },
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
