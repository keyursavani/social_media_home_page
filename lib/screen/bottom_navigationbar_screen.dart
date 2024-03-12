import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'home_screen.dart';


class BottomNavigationBarScreen extends StatefulWidget{
  const BottomNavigationBarScreen({super.key});


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomNavigationBarScreenState();
  }
}

class BottomNavigationBarScreenState extends State<BottomNavigationBarScreen>{

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    // TabBarScreen(),
    Center(
      child: Text(
        'Index 2: Search Screen',
        style: optionStyle,
      ),
    ),
    Center(
      child: Text(
        'Index 3: Account Screen',
        style: optionStyle,
      ),
    ),
    Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Index 4: Notification Screen',
          style: optionStyle,
        ),
      ),
    ),
    Center(
      child: Text(
        'Index 5: Menu Screen',
        style: optionStyle,
      ),
    ),
  ];

  @override
  void initState(){
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async{
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items:  const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: ""
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: ""
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_outlined),
                    label: ""
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications_none_outlined),
                    label: ""
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu),
                    label: ""
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedIconTheme:  const IconThemeData(color: Colors.deepPurpleAccent, size: 30,),
              unselectedIconTheme: const IconThemeData(color: Colors.black45, size: 25),
              backgroundColor: Colors.purple.shade50,
              selectedItemColor: Colors.deepPurpleAccent,
              unselectedItemColor: Colors.grey,
              // selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
              // unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal , fontSize: 10),
            ),
          ),
        ),
      ),
    );
  }
}