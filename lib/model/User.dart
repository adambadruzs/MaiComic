class UserModel {
  final String username, password, email;

  UserModel(
      {required this.username, required this.password, required this.email});

  factory UserModel.fromJSON(Map parsedJson) {
    return UserModel(
        username: parsedJson['username'],
        password: parsedJson['password'],
        email: parsedJson['email']);
  }
}
