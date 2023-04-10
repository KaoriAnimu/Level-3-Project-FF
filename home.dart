import 'package:flutter/material.dart';
import 'package:flutter_application_travelhub/icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:getwidget/getwidget.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       const Text(
        //         'Travel Hub',
        //         style: TextStyle(color: Color(0xFFFFFFFF)),
        //       ),
        //     ],
        //   ),
        //   backgroundColor: Color(0xFFFF0000),
        // ),
        bottomNavigationBar: BottomNavigationBar(
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
          currentIndex: _selectedNavbar,
          selectedItemColor: Color.fromARGB(255, 207, 12, 12),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: _changeSelectedNavBar,
        ),
        body: ListView(children: [
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
                        width: 212,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: TextFormField(
                                    // controller: _model.textController,
                                    autofocus: true,
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
                    icon: Icon(Icons.notifications_none),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),

                  // color: FlutterFlowTheme.of(context).primaryText,
                  // size: 30,

                  Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: IconButton(
                        icon: Icon(Icons.chat_outlined),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      )),
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
                        'Rekomendasi Hotel',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              '../assets/images/hotel1.png',
                              width: 347,
                              height: 183,
                              fit: BoxFit.cover,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Text(
                                    'Hotel Sanur Beach \nBali',
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: Text(
                                          'Rp. 350.000,- ~ Rp. 950.000,-',
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
                                              rating: 2.5,
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
                          ],
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
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              '../assets/images/wisata1.png',
                              width: 347,
                              height: 183,
                              fit: BoxFit.cover,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: Text(
                                          'Rp. 50.000,- / Orang',
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ])
        //
        );
  }
}
