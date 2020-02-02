import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  static final String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentTab = 0;
  PageController _pageController;

   @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
         title: Text(
           'Gitgram',
           style: TextStyle(
             fontFamily: 'Billabong',
             color: Colors.black,
             fontSize: 35.0,
           ),
         ),
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[

        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentTab,
          onTap: (int index){
            setState(() {
              _currentTab = index;
            });
          },
        activeColor: Colors.blue,
          items:[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 32.0,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 32.0,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                size: 32.0,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                size: 32.0,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 32.0,
              ),
            ),
          ],
      ),
    );
  }
}
