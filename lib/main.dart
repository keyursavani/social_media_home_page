import 'package:flutter/material.dart';
import 'package:practical_task/provider/home_screen_provider.dart';
import 'package:practical_task/provider/note_provider.dart';
import 'package:practical_task/screen/bottom_navigationbar_screen.dart';
import 'package:practical_task/screen/note_keeper_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (_) => HomeScreenProvider()),
          ChangeNotifierProvider(create: (_) => NoteProvider()),
        ],
      child: const MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        useMaterial3: false,
      ),
      // home: const BottomNavigationBarScreen(),
      home: const NoteKeeperScreen(),
    );
  }
}




