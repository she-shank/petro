//DocumentReference reportRef = _db.collection('reports').document(user.uid);
//reportRef.setData({
//'uid': user.uid,
//'lastActivity' : DateTime.now()
//}, merge: true);

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petro/datamodel/Post.dart';

class Databaseservice {

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<Post> getPost (postID) {
    return _db.collection('posts')
              .doc(postID)
              .get()
              .then((snap) { Post p = Post.fromMap(snap.data());
              print(p);
              return p;});
  }

  Future<void> addPost(Post postData) {
    _db.collection('posts').add(postData.toMap()).then((docref) {
      //addPostToUser(docref.id, postData.authorUID);
      print("${postData.title} added successfully");

    });
    return null;
  }

  void addPostToUser(String postID, String user){
    _db.doc('users/$user/posts').update({postID : postID});
  }

}
