import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/hotel.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/notifikasi.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _home();
}

final user = FirebaseAuth.instance.currentUser!;

class _home extends State<homePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    SingleChildScrollView(
        child: Column(
      children: [
        Align(
          alignment: AlignmentDirectional(0, 0),
          child: Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              color: Color(0xFFFF0000),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Color(0x4D000000),
                  offset: Offset(0, 2),
                )
              ],
              // borderRadius: BorderRadius.circular(8),
              shape: BoxShape.rectangle,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(29, 18, 10, 18),
                    child: Container(
                      width: 312,
                      height: 38,
                      decoration: BoxDecoration(
                        color: Color(0xD4D9D9D9),
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle,
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: TextFormField(
                                  // controller: _model.textController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Pencarian',
                                    // hintStyle: GoogleFonts.getFont(
                                    //   'Montserrat',
                                    //   color: FlutterFlowTheme.of(context).primaryText,
                                    //   fontSize: 13,
                                    // ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 10),
                                  ),
                                  style: TextStyle(fontSize: 15),
                                  // validator: _model.textControllerValidator
                                  //     .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.notifications),
                  color: Colors.yellow,
                  onPressed: () {
                    Get.to(() => notifikasi());
                    ;
                  },
                ),

                // color: FlutterFlowTheme.of(context).primaryText,
                // size: 30,
              ],
            ),
          ),
        ),
        Column(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 30, 0, 0),
                    child: Text(
                      'Hotel Terdekat',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => hotel());
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/wisata1.png',
                              width: 347,
                              height: 183,
                              fit: BoxFit.contain,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    child: Text(
                                      'Hotel Ibis',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Text(
                                            'Rp. 500.000,- / malam',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(),
                                            RatingBarIndicator(
                                                rating: 4,
                                                itemCount: 5,
                                                itemSize: 30.0,
                                                itemBuilder: (context, _) =>
                                                    const Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                    )),
                                            // FlutterFlowIconButton(
                                            //   borderColor: Colors.transparent,
                                            //   borderRadius: 30,
                                            //   borderWidth: 1,
                                            //   buttonSize: 60,
                                            IconButton(
                                              icon: Icon(Icons.thumb_up),
                                              // color:
                                              //     FlutterFlowTheme.of(context).primaryText,
                                              // size: 15,
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),

                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 30, 0, 0),
                    child: Text(
                      'Hotel Terdekat',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => hotel());
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/wisata1.png',
                              width: 347,
                              height: 183,
                              fit: BoxFit.contain,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Text(
                                      'FarmHouse Lembang \nJawaBarat',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Text(
                                            'Rp. 50.000,- / malam',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(),
                                            RatingBarIndicator(
                                                rating: 3,
                                                itemCount: 5,
                                                itemSize: 30.0,
                                                itemBuilder: (context, _) =>
                                                    const Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                    )),
                                            // FlutterFlowIconButton(
                                            //   borderColor: Colors.transparent,
                                            //   borderRadius: 30,
                                            //   borderWidth: 1,
                                            //   buttonSize: 60,
                                            IconButton(
                                              icon: Icon(Icons.thumb_up),
                                              // color:
                                              //     FlutterFlowTheme.of(context).primaryText,
                                              // size: 15,
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),

                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    )),
    Text('HAHA'),
    Text('HAHA'),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(user.email!),
        TextButton(
            child: Text('Logout'),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            })
      ],
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 207, 12, 12),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'PESANAN',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined),
            label: 'BOOKMARK',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'PROFILE',
          ),
        ],
      ),
    );
  }
}
