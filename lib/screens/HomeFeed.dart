import 'package:flutter/material.dart';
import 'package:petro/ServiceLocator.dart';
import 'package:petro/datamodel/Post.dart';
import 'package:petro/datamodel/User.dart';
import 'package:petro/services/DatabaseService.dart';
import 'package:petro/services/AuthenticationService.dart';

class HomeFeed extends StatefulWidget {
  @override
  _HomeFeedState createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  var db = locator<DatabaseService>();
  var as = locator<AuthenticationService>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('HomeFeed'),
          FlatButton(
              onPressed: () async {
                print(as.auth.currentUser.uid);
              },
              child: Text("lkek"),
          )
        ],
      ),
    );
  }
}
