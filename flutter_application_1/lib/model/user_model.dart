class UserModel {
  final String? id;
  final String name;
  final String email;

  const UserModel({this.id, required this.name, required this.email});

  toJson() {
    return {"nama": name, "email": email};
  }
}
