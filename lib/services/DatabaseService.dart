//DocumentReference reportRef = _db.collection('reports').document(user.uid);
//reportRef.setData({
//'uid': user.uid,
//'lastActivity' : DateTime.now()
//}, merge: true);

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petro/datamodel/Post.dart';
import 'package:petro/datamodel/User.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future createUser(CustomUser user) async {
    try {
      await _db.collection('users').doc(user.userID).set(user.toMap());
      await _db.collection('users/${user.userID}/AdditionalDetails')
          .doc('Followers')
          .set({'FollowersUID': []});
      await _db.collection('users/${user.userID}/AdditionalDetails')
          .doc('Following')
          .set({'FollowingUID': []});
      await _db.collection('users/${user.userID}/AdditionalDetails')
          .doc('SavedForLater')
          .set({'SavedPostsPID': []});
      // await _db.collection('users/${user.userID}/AdditionalDetails')
      //    .doc('UserPosts')
      //    .set({'PostPID': []});
    } catch (e) {
      return e.toString();
    }
  }

  Future getUser(String UID) async {
    try {
      return await _db.collection('users')
          .doc(UID)
          .get()
          .then((snapshot) => CustomUser.fromMap(snapshot.data()));
    } catch (e) {
      return e.toString();
    }
  }

  Future<Post> getPostbyPID(PID) async {
    try {
      return await _db.collection('posts')
          .doc(PID)
          .get()
          .then((snap) {
        Post p = Post.fromMap(
            snap.data()); // replace with (snap)=> Post.fromMap(snap.data());
        print(p);
        return p;
      });
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future getUserFollower(String UID) async {
    try {
      return await _db.collection('users/$UID/AdditionalDetails')
          .doc('Followers')
          .get()
          .then((snapshot) => snapshot.data()['FollowingUID']);
    } catch (e) {

    }
  }

  Future<void> addPost(Post post) {
    _db.collection('posts').add(post.toMap()).then((docref) {
      //addPostToUser(docref.id, post.authorUID, post.photoURL);
      print("${post.title} added successfully");
    });
    return null;
  }

  void addPostToUser(String PID, String UID, String postPhotoURL) {
    _db.doc('users/$UID/AdditionalDetails/UserPosts')
        .update({'PostPID': FieldValue.arrayUnion([]) //arrayunion not working
    });
  }

  var _lastDoc;

  Future getPostsPaginated() async {
    try {
      var postQuery = _db.collection('posts').orderBy('createTimeStamp').limit(5);
      if (_lastDoc != null) {
        postQuery = postQuery.startAfter(_lastDoc);
      }
      var querySnapshot = postQuery.get();
      querySnapshot.then((value) => value.docs.forEach((element) {return Post.fromMap(element.data());}));

    } catch (e) {

    }
  }
}
