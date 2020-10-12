import 'package:calendarro/calendarro.dart';
import 'package:calendarro/date_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:shapecoach/ui/views/ProfileView.dart';
import 'package:shapecoach/ui/views/schedule_notifications.dart';

import 'package:intl/intl.dart';

import 'notifications.dart';



class Calander_View extends StatefulWidget  {

  @override
  State<StatefulWidget> createState() {
    return _Calander_ViewState();
  }

}


ScheduleNotifications notifications;
class _Calander_ViewState extends State<Calander_View> {
  void initState() {
    super.initState();

    notifications = ScheduleNotifications(
      'your channel id',
      'your other channel name',
      'your other channel description',
    );

    notifications.init(onSelectNotification: (String payload) async {
      if (payload == null || payload
          .trim()
          .isEmpty) return null;
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondScreen(payload)),
      );
      return;
    });

    // notifications.getNotificationAppLaunchDetails().then((details) {
    //   notificationAppLaunchDetails = details;
    // });
  }
  Calendarro monthCalendarro;

  @override
  Widget build(BuildContext context) {
    var startDate = DateUtils.getFirstDayOfCurrentMonth();
    var endDate = DateUtils.getLastDayOfNextMonth();

    ScheduleNotifications notifications;
    notifications = ScheduleNotifications(
      'your channel id',
      'your other channel name',
      'your other channel description',
    );


    monthCalendarro = Calendarro(
        startDate: startDate,
        endDate: endDate,
        displayMode: DisplayMode.MONTHS,
        selectionMode: SelectionMode.MULTI,
        weekdayLabelsRow: CustomWeekdayLabelsRow(),
        onTap: (date)  {
          var now = new DateTime.now();
          var formatter = new DateFormat('yyyy-MMM-dd');
          String sdate = formatter.format(date);
          // return notifications.show(
          //     id: 0,
          //   importance: Importance.Max,
          //   priority: Priority.High,
          //   ticker: 'ticker',
          //   title: 'date ' + sdate + " has been selected",
          //   body: 'plain body',
          //   payload: 'item x',
          // );
          // Navigator.pop(context);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => ProfileView()),
          //

            // flutter defined function
            showDialog(
              context: context,
              builder: (BuildContext context) {
                // return object of type Dialog
                return AlertDialog(
                  title: new Text("Warst du erfolgreich?"),
                  content: new Text("Hast du dir heute 5 Minuten Zeit genommen, um über deine Essgewohnheiten nachzudenken?"),
                  actions: <Widget>[
                    // usually buttons at the bottom of the dialog
                    new FlatButton(
                      child: new Text("Nein"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    new FlatButton(
                      child: new Text("Ja"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),


                  ],
                );
              },
            );


          print("onTap: $date");

          // Link here
          // insert statement here
        });
    List months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    var now = new DateTime.now();
    var currentMon = now.month;
    print(months[currentMon]);
    return Scaffold(
      appBar: AppBar(
        title: new Text("Calendar          "+ months[currentMon-1]),
        leading: new Container(),
      ),
      body: Column(

      children: <Widget>[
      Container(height: 120.0),
      monthCalendarro,
        const ListTile(
          leading: Icon(Icons.album, size: 50),
          title: Text('Woche 1: '),
          subtitle: Text('Nimm dir jeden Tag 5 Minuten Zeit, um über deine Essgewohnheiten '),
        ),
      ],
      ),

    );
  }


}

class CustomWeekdayLabelsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Row(
      children: <Widget>[
        Expanded(child: Text("M", textAlign: TextAlign.center)),
        Expanded(child: Text("T", textAlign: TextAlign.center)),
        Expanded(child: Text("W", textAlign: TextAlign.center)),
        Expanded(child: Text("T", textAlign: TextAlign.center)),
        Expanded(child: Text("F", textAlign: TextAlign.center)),
        Expanded(child: Text("S", textAlign: TextAlign.center)),
        Expanded(child: Text("S", textAlign: TextAlign.center)),
      ],
    );
  }
}
