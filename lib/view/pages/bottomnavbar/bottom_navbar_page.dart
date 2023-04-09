import 'package:flutter/material.dart';
import 'package:inventory_app/view/pages/bottomnavbar/landing/home_page.dart';
import 'package:inventory_app/view/pages/bottomnavbar/landing/account_page.dart';


class BottomNavbarPage extends StatefulWidget {
  static const String routeName = "/bottomnavbar";
  const BottomNavbarPage({Key? key}) : super(key: key);

  @override
  State<BottomNavbarPage> createState() => _BottomNavbarPageState();
}

class _BottomNavbarPageState extends State<BottomNavbarPage> {

  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    // First item in the bottom navigation bar
    HomePage(),

    // Second item in the bottom navigation bar
    AccountPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
