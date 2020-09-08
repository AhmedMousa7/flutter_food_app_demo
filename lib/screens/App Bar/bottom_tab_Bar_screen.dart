import 'package:flutter/material.dart';
import '../Categories/categories_screen.dart';
import '../Favorites/favorite_screen.dart';

class BottomTabBar extends StatefulWidget {
  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  List<Widget> _pages = [
    CategoriesScreen(),
    FavoritesScreen(),
  ];

  List<BottomNavigationBarItem> _bottomViewItems = [
      BottomNavigationBarItem(
          icon: Icon(Icons.category), title: Text("Categories")),
      BottomNavigationBarItem(
          icon: Icon(Icons.star), title: Text("Favorites")),
  ];

  int _selectedPageIndex = 0;

  _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _bottomViewItems[_selectedPageIndex].title,
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        items: _bottomViewItems,
        onTap: _selectPage,
      ),
    );
  }
}
