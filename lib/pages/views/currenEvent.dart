import 'package:flutter/material.dart';

class CurrentEvent extends StatelessWidget {
  const CurrentEvent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: ListTile.divideTiles(
        context: context,
        tiles: [
          Card(
            elevation: 2.0,
            margin: EdgeInsets.all(15.0),
            child: ListTile(
              title: Text('Fatecnologia',
              style: TextStyle(color: Colors.black, fontFamily: 'Raleway', fontSize: 18.0)),
            ),
          ),
        ],
      ).toList(),
    );
  }
}