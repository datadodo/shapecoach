import 'dart:async';

import 'package:shapecoach/Constant/Constant.dart';
import 'package:shapecoach/viewmodels/startup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatefulWidget {
  @override
  StartUpViewState createState() => new StartUpViewState();
}

class StartUpViewState extends State<StartUpView>
  with SingleTickerProviderStateMixin {

  var _visible = true;
   // StartUpView({Key key}) : super(key: key);
   AnimationController animationController;
   Animation<double> animation;



   startTime() async {
     var _duration = new Duration(seconds: 3);
     return new Timer(_duration, navigationPage);
   }

   void navigationPage() {
     // Navigator.of(context).pushReplacementNamed(PROFILE);
   }

   @override
   void initState() {
     super.initState();
     animationController = new AnimationController(
         vsync: this, duration: new Duration(seconds: 2));
     animation =
     new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

     animation.addListener(() => this.setState(() {}));
     animationController.forward();

     setState(() {
       _visible = !_visible;
     });
     startTime();
   }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: new Image.asset(
                    'assets/images/powered_by.png',
                    height: 25.0,
                    fit: BoxFit.scaleDown,
                  )),



              CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(
                  Color(0xff19c7c1),
                ),
              ),

              new Image.asset(
                'assets/images/logo.png',
                // width: animation.value * 250,
                // height: animation.value * 250,
              ),


            ],
          ),

        ),
      ),
    );
  }
}