import 'package:fatapp/pages/controllers/eventController.dart';
import 'package:fatapp/pages/models/event.dart';
import 'package:fatapp/pages/models/user.dart';
import 'package:fatapp/pages/views/eventDetail.dart';
import 'package:flutter/material.dart';

class CurrentEvent extends StatelessWidget {
  const CurrentEvent(this.user);
  final User user;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: EventController().getEvents(this.user.token),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List<Event> eventList;
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.red)));
          } else {
            eventList = snapshot.data;
            eventList = eventList.where((event) {
              var now = DateTime.now().toLocal();
              var finalDate = event.finalDate.toLocal();
              var isBeforeNow = finalDate.isAfter(now);
              var isSameNow = finalDate.isAtSameMomentAs(now);

              return isBeforeNow || isSameNow;
            }).toList();
          }

          if (eventList.length == 0)
            return Center(child: Text("Sem eventos no momento"));

          return ListView.builder(
              itemCount: eventList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    elevation: 2.0,
                    margin: EdgeInsets.all(10.0),
                    child: InkWell(
                        splashColor: const Color(0xFFCE0000),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EventDetail(this.user, eventList[index])),
                          );
                        },
                        child: ListTile(
                          title: Padding(
                            padding:
                                EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                            child: Text(eventList[index].title,
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontFamily: 'Noto',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w900)),
                          ),
                          subtitle: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
                              child: Text(eventList[index].description)),
                        )));
              });
        });
  }
}
