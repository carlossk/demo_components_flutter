
import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';
import 'package:components/src/pages/alert_page.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        print(snapshot.data);
        return ListView(
          children: _createListItem(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _createListItem(List<dynamic> data, BuildContext contexto) {
    final List<Widget> options = [];
    data.forEach((opt) {
      final wTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(contexto, opt['ruta']);
          // final route = MaterialPageRoute(builder: (contexto) {
          //   return AlertPage();
          // });
          // Navigator.push(contexto, route);
        },
      );
      options.add(wTemp);
    });
    return options;
  }
}
