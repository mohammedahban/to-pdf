import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;
  List pageoptions = [
    ListPage();
    HomePage();
    SearchPage();
    ];
  
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: pageoptions[page],
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  page = index;
                });
              },
              selectedItemColor: Colors.lightBlue,
              unselectedItemColor: Colors.black,
              currentIndex: page,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 32,
                    ),
                    ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.pages,
                      size: 32,
                    ),
                    )
              ]),
        );
      }
    }

