import 'package:flutter/material.dart';
import 'package:petro/ServiceLocator.dart';
import 'package:petro/datamodel/Post.dart';
import 'package:petro/services/DatabaseService.dart';

class HomeFeed extends StatelessWidget {

  Post post = Post(authorUID: "qwerfvdbj",
    title: "rbt",
  body: "erg",
  createDT: DateTime.now());

//  var db = locator<Databaseservice>();
//  db.addPost(post);

  Databaseservice db = Databaseservice();
  db.addPost(post);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('HomeFeed'),
    );
  }
}
