import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  List<Widget> _pages = [
    Center(child: Text('Home Page')),
    Center(child: Text('Profile Page')),
    Center(child: Text('Settings Page')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.teal,
          title: Text('Dashboard', style: TextStyle(color: Colors.white),)),
      drawer: Drawer(
        backgroundColor: Colors.teal,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Text('Welcome!', style: TextStyle(color: Colors.teal)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home', style: TextStyle(color: Colors.white),),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile', style: TextStyle(color: Colors.white),),
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings', style: TextStyle(color: Colors.white),),
              onTap: () => _onItemTapped(2),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
