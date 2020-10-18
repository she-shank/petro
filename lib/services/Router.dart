import 'package:flutter/material.dart';
import 'package:petro/screens/Login/LoginView.dart';
import 'package:petro/screens/Main/MainView.dart';
import 'package:petro/screens/HomeFeed/HomeFeed.dart';
import 'package:petro/screens/Profile/Profile.dart';
import 'package:petro/screens/RecentActivities.dart';
import 'package:petro/screens/Startup/StartupView.dart';
import 'package:petro/screens/UploadPost.dart';

class Ruter{

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => StartupView());
      case '/mainview':
        return MaterialPageRoute(builder: (_) => MainView());
      case '/homefeed':
        return MaterialPageRoute(builder: (_) => HomeFeed());
      case '/recentacivities':
        return MaterialPageRoute(builder: (_) => RecentActivities());
      case '/uploadpost':
        return MaterialPageRoute(builder: (_) => UploadPost());
      case '/profile':
        return MaterialPageRoute(builder: (_) => Profile());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginView());
    }
    return errorRoute();
  }

  static Route<dynamic> errorRoute(){
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          body: Center(child: Text('Error 404'),),
        );
      }
    );
  }
}