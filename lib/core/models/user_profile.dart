class UserProfile {
  String? userName;
  String? email;

  UserProfile(this.userName, this.email);

  UserProfile.fromJson(json) {
    this.userName = json['userName'];
    this.email = json['email'];
  }
}
