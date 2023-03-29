import 'package:flutter/material.dart';
import 'package:flutter_application_travelhub/login.dart';
import 'package:flutter_application_travelhub/register.dart';

void main() => runApp(MaterialApp(
      home: LoadingPage(),
      debugShowCheckedModeBanner: false,
    ));

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => Loading();
}

class Loading extends State<LoadingPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Image.asset(
            //   'images/logo.png',
            //   scale: 100,
            // ),
            // const SizedBox(
            //   width: 10,
            // ),
            const Text(
              'Travel Hub',
              style: TextStyle(color: Color(0xFFFFFFFF)),
            ),
          ],
        ),
        backgroundColor: Color(0xFFFF0000), //<-- SEE HERE
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     debugPrint('Tombol Sudah Ditekan');
      //   },
      //   child: Icon(Icons.add),
      // ),

      body: SafeArea(
          child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Selamat Datang di Travel Hub!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Silahkan register apabila belum punya akun dan login jika sudah mempunyai akun",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 15),
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/logo.png'), scale: 24),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                          },
                          color: Color(0xFF942928),
                          // shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(40)),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xFFFFFFFF)),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                          },
                          color: Color(0xFF942928),
                          // shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(40)),
                          child: Text(
                            "Sign UP",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xFFFFFFFF)),
                          ),
                        ),
                      ],
                    )
                  ]))),
    );
  }
}
