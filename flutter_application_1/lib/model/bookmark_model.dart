class bookmark_Model {
  final String? id;
  final String nama;
  final String alamat;
  final String fasilitas;
  final String harga;
  final String email;
  final String gambarUrl;
  final String gambarNama;
  final String deskripsi;

  const bookmark_Model(
      {this.id,
      required this.nama,
      required this.alamat,
      required this.fasilitas,
      required this.harga,
      required this.email,
      required this.gambarNama,
      required this.gambarUrl,
      required this.deskripsi});
  toJson() {
    return {
      "nama": nama,
      "alamat": alamat,
      "fasilitas": fasilitas,
      "harga": harga,
      "email": email,
      "gambarNama": gambarNama,
      "gambar": gambarUrl,
      "deskripsi": deskripsi
    };
  }
}
