import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profile();
}

class _profile extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Align(
          alignment: AlignmentDirectional(1, 0.55),
          child: Icon(
            Icons.account_circle_rounded,
            color: Colors.black,
            size: 36,
          ),
        ),
        title: Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
            child: Text(
              'User Profile',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                  ),
            ),
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  title: Text(
                    'Informasi Akun',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                  onTap: () {},
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'Password & Security',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                  onTap: () {},
                ),
              ),
            ],
          )),
    );
  }
}
