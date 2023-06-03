class bookmark_Model {
  final String? id;
  final String nama;
  final String alamat;
  final String fasilitas;
  final String harga;
  final String email;

  const bookmark_Model(
      {this.id,
      required this.nama,
      required this.alamat,
      required this.fasilitas,
      required this.harga,
      required this.email});
  toJson() {
    return {
      "nama": nama,
      "alamat": alamat,
      "fasilitas": fasilitas,
      "harga": harga,
      "email": email
    };
  }
}
