class Post{
  final String photoUrl;
  final String authorUID;
  final String title;
  final String body;
  final DateTime createDT;

  Post({this.photoUrl, this.authorUID, this.title, this.body, this.createDT});

  factory Post.fromMap(Map data){
    return Post(
      photoUrl: data['url'] ?? '',
      authorUID: data['author'] ?? '',
      title: data['title'] ?? '',
      body: data['body'] ?? '',
      createDT: data['datetime']
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'url' : photoUrl,
      'author' : authorUID,
      'title' : title,
      'body' : body,
      'datetime' : createDT
    };
  }


}