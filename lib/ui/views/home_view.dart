import 'package:calendarro/calendarro.dart';
import 'package:calendarro/date_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:shapecoach/ui/views/CreatePostView.dart';
import 'package:shapecoach/ui/views/ProfileView.dart';
import 'package:shapecoach/ui/views/notifications.dart';

import 'PostHomeView.dart';
import 'PostPic.dart';
import 'calander_view.dart';


class HomeView extends StatefulWidget  {

  @override
  State<StatefulWidget> createState() {
    return _HomeViewState();
  }

}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Calander_View(),
    PostHomeView(),
     // CreatePostView(),
    // ProfileView(),
    // PostPic(),
    // MessagesPage(),

  ];

  Calendarro monthCalendarro;

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: _children[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        // currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.calendar_today),
            title: new Text('Forschritt'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.add_a_photo_rounded),
            title: new Text('Fortschrittsbericht'),
          ),
          // BottomNavigationBarItem(
          //   icon: new Icon(Icons.mail),
          //   title: new Text('Messages'),
          // ),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.person),
          //     title: Text('Profile')
          // )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class CustomWeekdayLabelsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // RaisedButton(child: Text("M", textAlign: TextAlign.center),
    //   onPressed: tmpFunction,
    //   color: Color(0xff0091EA),
    //   textColor: Colors.white,
    //   splashColor: Colors.grey,
    //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
    //
    //
    // ),

  }
}
