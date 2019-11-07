import 'package:fatapp/pages/models/user.dart';
import 'package:fatapp/pages/views/home.dart';
import 'package:flutter/material.dart';
import './currenEvent.dart';
import './pastEvents.dart';

class EventsList extends StatelessWidget {
  const EventsList({this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomePage(user: user)));
          return true;
        },
        child: MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Colors.white,
              labelStyle: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
              tabs: [
                Tab(
                  // icon: Icon(Icons.check_box),
                  text: 'Evento Atual',
                ),
                Tab(
                  // icon: Icon(Icons.history),
                  text: 'Eventos Passados',
                ),
              ],
            ),
            title: Text(
              'Eventos',
              style: TextStyle(fontFamily: 'Noto'),
            ),
            backgroundColor: Colors.red,
            leading: IconButton(icon:Icon(Icons.arrow_back),
              onPressed:() => Navigator.pop(context, false),
            )
          ),
          body: TabBarView(
            children: [
              CurrentEvent(this.user),
              PastEvents(this.user),
            ],
          ),
        ),
      ),
    )
    );
  }
}
