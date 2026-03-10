import 'package:flutter/material.dart';
import 'package:health_app/The%20App/Discover.dart';
import 'package:health_app/The%20App/Favorite.dart';
import 'package:health_app/The%20App/Home.dart';
import 'package:health_app/The%20App/UserProfile.dart';

class App extends StatefulWidget {
  final String token;

  const App({super.key, required this.token});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedindex,
        children: [
          HomePage(token: widget.token),
          FilteredResultsScreen(),
          Favorite(token: widget.token),
          Userprofile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Explore", icon: Icon(Icons.explore)),
          BottomNavigationBarItem(
            label: "Favorite",
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.settings)),
        ],
        currentIndex: selectedindex,
        selectedItemColor: Color(0xFF7ED957),
        unselectedItemColor: Color(0xffA1A1AA),

        onTap: (int index) {
          setState(() {
            selectedindex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
