import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class PostOutlines {
  final String PID;
  final String photoURL;
  final String authorUID;
  final String title;
  final String body;
  final DateTime createTimeStamp;

  PostOutlines({
    this.PID,
    this.photoURL,
    this.authorUID,
    this.title,
    this.body,
    this.createTimeStamp,
  });

  factory PostOutlines.fromMap(Map data) {
    return PostOutlines(
      PID: data['PID'],
      photoURL: data['photoURL'],
      authorUID: data['authorUID'],
      title: data['title'],
      body: data['body'],
      createTimeStamp: data['createTimeStamp'].toDate(),
    );
  }

    Map<String, dynamic> toMap (){
      return {
        'PID': PID,
        'photoURL': photoURL,
        'authorUID': authorUID,
        'title': title,
        'body': body,
        'createTimeStamp': createTimeStamp,
      };
    }

}

class Post extends PostOutlines {
  final int likesCount;
  final int commentCount;

  Post(
      {@required String PID,
      @required String photoURL,
      @required String authorUID,
      @required String title,
      @required String body,
      @required DateTime createTimeStamp,
      @required this.likesCount,
      @required this.commentCount})
      : super(
          PID: PID,
          photoURL: photoURL,
          authorUID: authorUID,
          title: title,
          body: body,
          createTimeStamp: createTimeStamp,
        );

  factory Post.fromMap(Map data) {
    return Post(
        PID: data['PID'],
        photoURL: data['photoURL'],
        authorUID: data['authorUID'],
        title: data['title'],
        body: data['body'],
        createTimeStamp: data['createTimeStamp'].toDate(),
        likesCount: data['likesCount'],
        commentCount: data['commentCount']);
  }

  Map<String, dynamic> toMap() {
    return {
      'PID': PID,
      'photoURL': photoURL,
      'authorUID': authorUID,
      'title': title,
      'body': body,
      'createTimeStamp': createTimeStamp,
      'likesCount': likesCount,
      'commentCount': commentCount
    };
  }
}

// class PostComments {
//   final List<Comment> commentsList;
//
//   PostComments({this.commentsList});
//
//   factory PostComments.fromMap(data) {
//     List temp = [];
//     data['commentsList'].forEach((element) => temp.add(Comment.fromMap(element)));
//     return PostComments(commentsList: temp);
//   }
// }

class Comment {
  final String commentUID;
  final String comment;

  Comment({this.commentUID, this.comment});

  factory Comment.fromMap(data) {
    return Comment(commentUID: data['commentUID'], comment: data['comment']);
  }

  Map<String, dynamic> toMap() {
    return {'commentUID': commentUID, 'comment': comment};
  }
}

// class PostLikes {
//   List<String> likesUIDList;
//
//   PostLikes({this.likesUIDList});
//
//   factory PostLikes.fromMap(data) {
//     return PostLikes(likesUIDList: data['likesUID']);
//   }
// }
