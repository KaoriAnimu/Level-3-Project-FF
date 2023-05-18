class UserModel {
  final String? id;
  final String name;
  final String email;
  final String kota;

  const UserModel(
      {this.id, required this.name, required this.email, required this.kota});

  toJson() {
    return {"nama": name, "email": email, "kota": kota};
  }
}
