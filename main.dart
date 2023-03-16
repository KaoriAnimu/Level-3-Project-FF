import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: RootPage(),
      debugShowCheckedModeBanner: false,
    ));

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => login();
}

class login extends State<RootPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    Container(
      height: 200,
  width: double.infinity,
  decoration: const BoxDecoration(
    image: DecorationImage(
        image: NetworkImage("https://picsum.photos/id/237/200/300"),
        fit: BoxFit.cover),
  ),
    );
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Travel Hub'),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     debugPrint('Tombol Sudah Ditekan');
      //   },
      //   child: Icon(Icons.add),
      // ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Color(0xffA22C2A),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.app_registration), label: 'Register'),
          NavigationDestination(icon: Icon(Icons.login), label: 'Login'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
