import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mobile/LogSign/auth.dart';
import 'package:mobile/product.dart';
import 'package:mobile/team.dart';
import 'signout.dart';
import 'API/api.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  int _selectedIndex = 0;

  late Api api; // Declare the api variable

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();

    api = Api(); // Initialize the api instance

    _pages.addAll([
      TeamPage(),
      product(),
      SignOutPage(), // Add your sign-out page here
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Manchester United FanClub'),
          backgroundColor: Theme.of(context).primaryColor),
      bottomNavigationBar: GNav(
        backgroundColor: const Color.fromARGB(255, 255, 17, 0),
        gap: 30,
        tabBackgroundColor: Colors.white24,
        padding: EdgeInsets.all(20),
        tabs: [
          GButton(icon: Icons.sports, text: 'Team'),
          GButton(
            icon: Icons.shop_2_outlined,
            text: 'Buy Product',
          ),
          GButton(
            icon: Icons.logout_outlined,
            text: 'Logout',
          )
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _pages[_selectedIndex],
    );
  }
}
