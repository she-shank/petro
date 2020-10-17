import 'package:flutter/material.dart';
import 'file:///C:/Users/shesh/FlutterProjects/petro/lib/screens/HomeFeed/HomeFeed.dart';
import 'file:///C:/Users/shesh/FlutterProjects/petro/lib/screens/Profile/Profile.dart';
import 'package:petro/screens/RecentActivities.dart';
import 'package:petro/screens/UploadPost.dart';

class Ruter{

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => HomeFeed());
      case '/recentacivities':
        return MaterialPageRoute(builder: (_) => RecentActivities());
      case '/uploadpost':
        return MaterialPageRoute(builder: (_) => UploadPost());
      case '/profile':
        return MaterialPageRoute(builder: (_) => Profile());
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