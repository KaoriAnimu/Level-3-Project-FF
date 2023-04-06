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
            'Ada promo murah nih di hotel berikut: Bandung, Jakarta, Bogor. Jangan sampai ketinggalan promo ini!'),
    const Detail(title: 'Notifikasi 3', isi: 'Ini Nao')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notifikasi'),
        ),
        body: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: details.length,
            itemBuilder: (context, index) {
              final detail = details[index];

              return Dismissible(
                key: Key(detail.title),
                onDismissed: (direction) {
                  setState(() {
                    details.removeAt(index);
                  });
                },
                child: ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text(detail.title),
                  subtitle: Text(detail.isi),
                  // Pakai Dialog
                  // onLongPress: () => showDialog<String>(
                  //   context: context,
                  //   builder: (BuildContext context) => AlertDialog(
                  //     title: Text('Hapus'),
                  //     content:
                  //         Text('Apakah anda yakin ingin menghapus notifikasi?'),
                  //     actions: <Widget>[
                  //       TextButton(
                  //           onPressed: () {
                  //             Navigator.of(context).pop();
                  //           },
                  //           child: Text('Cancel')),
                  //       TextButton(
                  //           onPressed: () {
                  //             setState(() {
                  //               details.removeAt(index);
                  //             });
                  //             Navigator.of(context).pop();
                  //           },
                  //           child: Text('Ok')),
                  //     ],
                  //   ),
                  // ),
                ),
              );
            }));
  }
}

class Detail {
  final String title;
  final String isi;

  const Detail({required this.title, required this.isi});
}
