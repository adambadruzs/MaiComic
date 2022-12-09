class UserModel {
  final String username, password, email;
  final int id;

  UserModel(
      {required this.username,
      required this.password,
      required this.email,
      required this.id});

  factory UserModel.fromJSON(Map parsedJson) {
    return UserModel(
        id: parsedJson['id'],
        username: parsedJson['username'],
        password: parsedJson['password'],
        email: parsedJson['email']);
  }
}
