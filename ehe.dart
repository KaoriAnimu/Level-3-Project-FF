import 'package:flutter/material.dart';

class LandingPageWidget extends StatefulWidget {
  const LandingPageWidget({Key? key}) : super(key: key);

  @override
  _LandingPageWidgetState createState() => _LandingPageWidgetState();

  LandingPageModel createModel(BuildContext context) => LandingPageModel();
}

class _LandingPageWidgetState extends State<LandingPageWidget> {
  late LandingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = widget.createModel(context);

    _model.textController1 ??= TextEditingController(text: 'display_name');
    _model.textController2 ??= TextEditingController(text: 'Address');
    _model.textController3 ??= TextEditingController(text: 'Birth Date');
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Color(0xFFFF0000),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          title: Text(
            'Data Pribadi ',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        'https://picsum.photos/seed/514/600',
                        width: 90,
                        height: 90,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFE1EDF9),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        'Change Photo',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                child: TextFormField(
                  controller: _model.textController1,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Nama User',
                    labelStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    hintText: 'Isi nama lengkap anda ....',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFE1EDF9),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                  ),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  validator:
                      _model.textController1Validator.asValidator(context),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                child: TextFormField(
                  controller: _model.textController2,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Alamat User',
                    labelStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    hintText: 'Isi alamat lengkap anda ....',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFE1EDF9),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                  ),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  validator:
                      _model.textController2Validator.asValidator(context),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                child: TextFormField(
                  controller: _model.textController3,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Tanggal Lahir User',
                    labelStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    hintText: 'Isi tanggal lahir anda ....',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFE1EDF9),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                  ),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  validator:
                      _model.textController3Validator.asValidator(context),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  child: Text('Simpan Perubahan'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFFF0000)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0)),
                    textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    )),
                    elevation: MaterialStateProperty.all<double>(2),
                    side: MaterialStateProperty.all<BorderSide>(BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    )),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
