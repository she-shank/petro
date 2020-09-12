import 'package:flutter/material.dart';
import 'package:petro/ServiceLocator.dart';
import 'package:petro/datamodel/Post.dart';
import 'package:petro/services/DatabaseService.dart';
class HomeFeed extends StatefulWidget {

  @override
  _HomeFeedState createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {

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
          FlatButton(onPressed: () {
          }, child: Text("lkek"))
        ],
      ),
    );
  }
}
