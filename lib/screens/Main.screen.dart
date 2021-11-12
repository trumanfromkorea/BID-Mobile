import 'package:bid_mobile/data/mainTheme.dart';
import 'package:bid_mobile/screens/Feed/Feed.screen.dart';
import 'package:bid_mobile/screens/Home/Home.screen.dart';
import 'package:bid_mobile/screens/My/My.screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    FeedScreen(),
    MyScreen(),
  ];

  void _onItemPressed(int index) {
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
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: "FEED",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "MY",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.black26,
        onTap: _onItemPressed,
      ),
    );
  }
}
