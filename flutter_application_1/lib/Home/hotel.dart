import 'package:flutter/material.dart';
import 'package:flutter_application_1/Order/pesan.dart';
import 'package:get/get.dart';

class hotel extends StatefulWidget {
  @override
  State<hotel> createState() => _hotel();
}

class _hotel extends State<hotel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hotel Ibis'),
        ),
        body: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
              child: Container(
                width: 400,
                height: 236.6,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.01, -0.15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          'images/wisata1.png',
                          width: 208.1,
                          height: 208.4,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Align(
                        alignment: AlignmentDirectional(0.81, 0.08),
                        child: IconButton(
                          icon: Icon(Icons.navigate_next),
                          onPressed: () {},
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
              child: Container(
                width: 431.8,
                height: 295.3,
                child: Align(
                  alignment: AlignmentDirectional(-0.7, -0.35),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Hotel Ibis',
                        ),
                        Divider(
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Deskripsi',
                              ),
                              TextButton(
                                child: Text(
                                  'Lihat \nSelengkapnya',
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(25, 15, 25, 0),
                          child: Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: SizedBox(
                width: 200,
                height: 50,
                child: TextButton(
                  child: Text(
                    'Pesan',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFFFF0000),
                  ),
                  onPressed: () {
                    Get.to(() => pesanPenginapan());
                  },
                ),
              ),
            ),
          ]),
        ));
  }
}
