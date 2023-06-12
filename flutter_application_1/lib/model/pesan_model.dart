class pesanModel {
  final String? id;
  final String namaHotel;
  final String dateIn;
  final String dateOut;
  final String total;
  final String code;
  final String email;
  final String approve;

  const pesanModel(
      {this.id,
      required this.namaHotel,
      required this.dateIn,
      required this.dateOut,
      required this.total,
      required this.code,
      required this.email,
      required this.approve});
  toJson() {
    return {
      "hotel": namaHotel,
      "datein": dateIn,
      "dateOut": dateOut,
      "total": total,
      "code": code,
      "email": email,
      "approve": approve
    };
  }
}
