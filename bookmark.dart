import 'package:flutter/material.dart';
import 'package:flutter_application_travelhub/icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:getwidget/getwidget.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bookmark(),
    );
  }
}

class Bookmark extends StatefulWidget {
  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
  // key: scaffoldKey,
  // backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
  appBar: AppBar(
    backgroundColor: Color(0xFFFF0000),
    automaticallyImplyLeading: true,
    title: Align(
      alignment: AlignmentDirectional(0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional(-1, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
              child: InkWell(
                onTap: () async {},
                child: Text(
                  'Bookmark',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    actions: [],
    centerTitle: false,
    elevation: 4,
  ),
  body: SafeArea(
    child: GestureDetector(
      // onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 29, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(17, 0, 0, 0),
                      child: Image.network(
                        'https://picsum.photos/seed/130/600',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(11, 0, 0, 0),
                      child: Text(
                        'Wisata 1',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 29, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(17, 0, 0, 0),
                      child: Image.network(
                        'https://picsum.photos/seed/130/600',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(11, 0, 0, 0),
                      child: Text(
                        'Penginapan 1',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);


  }

}