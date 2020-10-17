
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
      print("createUser Success");
    } catch (e) {
      print("createUser fail");
      print(e.toString());
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
        print(p.toString());
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
    try {
      _db.collection('posts').add(post.toMap()).then((docref) {
        docref.update({'PID': docref.id});
        print("${post.title} added successfully");
        docref.collection('AdditionalDetails').doc('PostComments').set(
            {'Comments': []});
        docref.collection('AdditionalDetails').doc('PostLikes').set(
            {'LikesUID': []});
        print('empty additional details document created successfully');
      });
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  //if successful
  // returns a list of comment objects of POST of PID provided in the argument
  //if fail
  // prints the error
  Future getCommentsbyPID(String PID) async {
    try {
      return await _db.doc('posts/$PID/AdditionalDetails/PostComments')
          .get()
          .then((snap) =>
          snap.data()['Comments'].map((element) => Comment.fromMap(element)));
    } catch (e) {
      print(e.toString());
    }
  }

  Future addComment(String PID, Comment comment) async {
    try {
      await _db.doc('posts/$PID/AdditionalDetails/PostComments')
          .update({'Comments': FieldValue.arrayUnion([comment.toMap()])});
      await _db.doc('posts/$PID')
          .update({'commentCount': FieldValue.increment(1)});
    } catch (e) {
      print(e.toString());
    }
  }

  Future getLikesUID(String PID) async {
    try {
      return await _db.doc('posts/$PID/AdditionalDetails/PostLikes')
          .get()
          .then((snap) => snap.data()['LikesUID']);
    } catch (e) {
      print(e.toString());
    }
  }

  Future addLike(String PID, String UID) async {
    try {
      await _db.doc('posts/$PID/AdditionalDetails/PostLikes')
          .update({'LikesUID': FieldValue.arrayUnion([UID])});
      await _db.doc('posts/$PID')
          .update({'likesCount': FieldValue.increment(1)});
    } catch (e) {
      print(e.toString());
    }
  }

  var _lastDoc;

  Future getPostsPaginated() async {
    try {
      var postQuery = _db.collection('posts').orderBy('createTimeStamp').limit(
          2);
      if (_lastDoc != null) {
        postQuery = postQuery.startAfterDocument(_lastDoc);
      }
      QuerySnapshot querySnapshot = await postQuery.get();
      _lastDoc = querySnapshot.docs.last;
      return querySnapshot.docs.map((e) => Post.fromMap(e.data()));
    } catch (e) {
      print(e.toString());
    }
  }

  Future addFollower(String UIDfrom, String UIDto) async {
    try {
      await _db.doc('users/$UIDfrom/AdditionalDetails/Following')
          .update({'FollowingUID' : FieldValue.arrayUnion([UIDto])});
      await _db.doc('users/$UIDfrom')
          .update({'followingCount' : FieldValue.increment(1)});
      await _db.doc('users/$UIDto/AdditionalDetails/Followers')
          .update({'FollwersUID' : FieldValue.arrayUnion([UIDfrom])});
      await _db.doc('users/$UIDto')
          .update({'followerCount' : FieldValue.increment(1)});
    } catch (e) {

    }
  }

  Future addForSavedToLater(String UID, String PID) async {
    try{
      await _db.collection('users/$UID/AdditionalDetails')
          .doc('SavedForLater')
          .update({'SavedPostsPID' : FieldValue.arrayUnion([PID])});
    } catch(e){
      print(e.toString());
    }
  }
  
  Future getSavedForLater(String UID) async {
    try{
      return await _db.collection('users/$UID/AdditonalDetails')
          .doc('SavedForLater')
          .get()
          .then((value) => value.data()['SavedPostsPID']);
    } catch(e){
      print(e.toString());
    }
   }
  
  Future addToDrafts(PostOutlines draftPost, String UID) async {
    try{
      await _db.collection('users/$UID/Drafts').add(draftPost.toMap());
    } catch(e){
      print(e.toString());
    }
   }

  Future getDrafts(String UID) async {
    try{
      if(await _db.collection('users/$UID/Drafts').get().then((snap) => snap.size) == 0){
        print('drafts collection empty');
      }else{
        return await _db.collection('users/$UID/Drafts')
            .get()
            .then((value) => value.docs.map((e) => PostOutlines.fromMap(e.data())));
      }
    } catch(e) {
      print(e.toString());
    }
   }

}
