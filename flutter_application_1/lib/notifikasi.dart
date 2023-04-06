import 'package:flutter/material.dart';

class notifikasi extends StatefulWidget {
  @override
  State<notifikasi> createState() => _notifikasi();
}

class _notifikasi extends State<notifikasi> {
  List<Detail> details = [
    const Detail(
        title: 'Notifikasi 1',
        isi:
            'Selamat bergabung ke dalam Travel Hub. Silahkan melihat-lihat hotel yang ingin anda tempati'),
    const Detail(
        title: 'Notifikasi 2',
        isi:
            'Ada promo murah nih di hotel berikut: Bandung, Jakarta, Bogor. Jangan sampai ketinggalan promo ini!')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notifikasi'),
        ),
        body: ListView.builder(
            itemCount: details.length,
            itemBuilder: (context, index) {
              final detail = details[index];

              return Card(
                child: ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text(detail.title),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => secondPage(detail: detail)));
                    }),
              );
            }));
  }
}

class Detail {
  final String title;
  final String isi;

  const Detail({required this.title, required this.isi});
}

class secondPage extends StatelessWidget {
  final Detail detail;

  const secondPage({
    Key? key,
    required this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(detail.title),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 25, left: 25, top: 230),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(
                  detail.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                detail.isi,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      );
}
