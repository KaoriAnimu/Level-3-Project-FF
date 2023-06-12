class ownerHotel_Model {
  final String? id;
  final String nama;
  final String approve;
  final String ktp;
  final String tlp;
  final String alamat;
  final String deskripsi;
  final String fasilitas;
  final String harga;
  final String email;
  final String gambarUrl;
  final String gambarNama;

  const ownerHotel_Model(
      {this.id,
      required this.nama,
      required this.alamat,
      required this.approve,
      required this.ktp,
      required this.tlp,
      required this.fasilitas,
      required this.harga,
      required this.email,
      required this.gambarUrl,
      required this.deskripsi,
      required this.gambarNama});
  toJson() {
    return {
      "nama": nama,
      "alamat": alamat,
      "fasilitas": fasilitas,
      "harga": harga,
      "email": email,
      "gambar": gambarUrl,
      "deskripsi": deskripsi,
      "gambarNama": gambarNama,
      "approve": approve,
      "ktp": ktp,
      "tlp": tlp
    };
  }
}
