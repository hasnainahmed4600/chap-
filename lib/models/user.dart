class User {
  final String uid;

  User({this.uid});
}

class CurrentUser {
  final String uid;
  final String username;
  final String email;
  final String profilePhotoUrl;

  CurrentUser({this.uid, this.username, this.email, this.profilePhotoUrl});
}