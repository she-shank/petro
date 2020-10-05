class CustomUser {
  String userID;
  String profilePhotoURL;
  String username;
  int followerCount;
  int followingCount;

  CustomUser(
      {this.userID,
      this.profilePhotoURL,
      this.username,
      this.followerCount,
      this.followingCount});

  factory CustomUser.fromMap(data) {
    return CustomUser(
        userID: data['UID'],
        profilePhotoURL: data['profilePhotoURL'],
        username: data['username'],
        followerCount: data['followerCount'],
        followingCount: data['followingCount']);
  }

  Map<String, dynamic> toMap () {
    return {
      'UID' : userID,
      'profilePhotoURL' : profilePhotoURL,
      'username' : username,
      'followerCount' : followerCount,
      'followingCount' : followingCount,
    };
  }
}

class UserSavedForLater {
  List<String> savedPID;

  UserSavedForLater({this.savedPID});

  factory UserSavedForLater.fromMap(data) {
    return UserSavedForLater(savedPID: data['savedPID']);
  }
}

class UserFollowers {
  List<String> followerUIDList;

  UserFollowers({this.followerUIDList});

  factory UserFollowers.fromMap(data) {
    return UserFollowers(followerUIDList: data['followerUIDList']);
  }
}

class UserFollowing {
  List<String> followingUIDList;

  UserFollowing({this.followingUIDList});

  factory UserFollowing.fromMap(data) {
    return UserFollowing(followingUIDList: data['followingUIDList']);
  }
}

class UserDrafts {}
