import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../presentation/view/page/FavoritesScreen.dart';
import '../../presentation/view/page/ProfileScreen.dart';
import '../../presentation/view/page/RecipeFeedScreen.dart';
import '../../presentation/view/page/create.dart';
import '../utils/app_icons.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    RecipeFeedScreen(),
    RecipeCreateScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconBroken.Home),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon:Icon(IconBroken.Paper_Upload),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon:Icon(IconBroken.Heart),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon:Icon(IconBroken.Profile),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
