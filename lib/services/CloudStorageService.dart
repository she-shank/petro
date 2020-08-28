import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

// use storageuploadtask.events to get a stream of bytes transferred and total bytes to display a progressmeter

class CloudStorageService {
  Future<CloudStorageResult> uploadImage({
  @required File imageToUpload,
  @required String title,
  @required User user
  }) async {

    var imageFileName = title + DateTime.now().millisecondsSinceEpoch.toString();

    final StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(user.uid+'/'+imageFileName);

    StorageUploadTask uploadTask = firebaseStorageRef.putFile(imageToUpload);
    StorageTaskSnapshot storageSnapshot = await uploadTask.onComplete;

    var downloadUrl = await storageSnapshot.ref.getDownloadURL();

    if(uploadTask.isComplete){
      var url = downloadUrl.toString();
      return CloudStorageResult(
        imageFileName: imageFileName,
        imageUrl: url
      );
    }
  }

  Future deleteImage(String imageFileName, User user) async {
    final StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(user.uid+'/'+imageFileName);
    try{
      await firebaseStorageRef.delete();
      return true;
    } catch(e){
      return (e.toString());
    }
  }
}

class CloudStorageResult{
  final String imageUrl;
  final String imageFileName;

  CloudStorageResult({this.imageUrl, this.imageFileName});
}