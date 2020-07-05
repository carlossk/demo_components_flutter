import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  InputsPage({Key key}) : super(key: key);

  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _name = '';
  String _email = '';
  String _date = '';
  List<String> _powers = ['Volar', 'Rayos X', 'Fuerza'];
  String _selectedOption = 'Volar';

  TextEditingController _inputTextEditing = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inputs'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          children: <Widget>[
            _createInput(),
            Divider(),
            _createEmail(),
            Divider(),
            _createPassword(),
            Divider(),
            _createDate(context),
            Divider(),
            _createDropDaown(),
            Divider(),
            _createPerson(),
          ],
        ));
  }

  Widget _createInput() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          counter: Text('${_name.length}'),
          hintText: 'Name',
          labelText: 'Name:',
          helperText: 'Only name',
          suffixIcon: Icon(Icons.text_fields),
          icon: Icon(Icons.star)),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Name: $_name'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_selectedOption),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Email',
          labelText: 'Email:',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Password',
          labelText: 'Password:',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (value) {},
    );
  }

  Widget _createDate(context) {
    return TextField(
      controller: _inputTextEditing,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Date',
          labelText: 'Date:',
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime dates = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2026),
        locale: Locale('es', 'ES'));
    if (dates != null) {
      setState(() {
        _date = dates.toString();
        _inputTextEditing.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptionsDrop() {
    List<DropdownMenuItem<String>> lista = new List();

    _powers.forEach((poder) {
      lista.add(DropdownMenuItem(child: Text(poder), value: poder));
    });
    return lista;
  }

  Widget _createDropDaown() {
    return Row(
      children: <Widget>[
        Icon(Icons.adb, color: Colors.blue),
        SizedBox(
          width: 30,
        ),
        Expanded(
          child: DropdownButton(
              // icon: Icon(Icons.account_circle),

              value: _selectedOption,
              items: getOptionsDrop(),
              onChanged: (options) {
                setState(() {
                  _selectedOption = options;
                });
              }),
        )
      ],
    );
  }
}
