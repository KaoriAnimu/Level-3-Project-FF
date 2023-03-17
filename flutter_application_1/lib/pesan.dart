import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Pesan'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        '${entries[index]}',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  Column(
                    children: [Text('${hasil[index]}')],
                  )
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
          Center(
            child: Container(
              width: 100,
              child: GFButton(
                onPressed: () {},
                child: Text(
                  'Pilih Metode\nPembayaran',
                  style: TextStyle(fontSize: 16),
                ),
                size: GFSize.LARGE,
              ),
            ),
          )
        ],
      ),
    );
  }
}

final List<String> entries = <String>[
  'Tempat: ',
  'Tanggal Check In: ',
  'Tanggal Check Out: ',
  'Harga per/malam: ',
  'Total harga: '
];

final List<String> hasil = <String>['Haha', 'Haha', 'Haha', 'Haha', 'Haha'];
// Ambil dari DB