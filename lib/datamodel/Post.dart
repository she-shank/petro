class Post{
  //final String PID;
  final String photoURL;
  final String authorUID;
  final String title;
  final String body;
  final DateTime createTimeStamp;
  final int likesCount;
  final int commentCount;

  Post({/*this.PID,*/ this.photoURL, this.authorUID, this.title, this.body, this.createTimeStamp, this.likesCount, this.commentCount});

  factory Post.fromMap(Map data){
    return Post(
      //PID: data['PID'],
      photoURL: data['photoURL'] ?? 'defaultnull',
      authorUID: data['authorUID'] ?? 'defaultnull',
      title: data['title'] ?? 'defaultnull',
      body: data['body'] ?? 'defaultnull',
      createTimeStamp: data['createTimeStamp'] ?? 'defaultnull',
      likesCount: data['likesCount'] ?? 'defaultnull',
      commentCount: data['commentCount'] ?? 'defaultnull'
    );
  }

  Map<String, dynamic> toMap(){
    return {
      //'PID' : PID,
      'photoURL' : photoURL,
      'authorUID' : authorUID,
      'title' : title,
      'body' : body,
      'createTimeStamp' : createTimeStamp,
      'likesCount' : likesCount,
      'commentCount' : commentCount
    };
  }


}

class PostComments {
  final List<Comment> commentsList;

  PostComments({this.commentsList});

  factory PostComments.fromMap(data) {
    List temp = [];
    data['commentsList'].forEach((element) => temp.add(Comment.fromMap(element)));
    return PostComments(commentsList: temp);
  }
}

class Comment {
  final String commentUID;
  final String comment;

  Comment({this.commentUID, this.comment});

  factory Comment.fromMap(data) {
    return Comment(
      commentUID: data['commentUID'],
      comment: data['comment']
    );
  }
}

class PostLikes {
  List<String> likesUIDList;

  PostLikes({this.likesUIDList});

  factory PostLikes.fromMap(data) {
    return PostLikes(likesUIDList: data['likesUID']);
  }
}