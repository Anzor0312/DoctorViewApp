import 'package:doctorapp/view/bottom_pages/appointments_page.dart';
import 'package:doctorapp/view/bottom_pages/home_page.dart';
import 'package:doctorapp/view/bottom_pages/message_page.dart';
import 'package:doctorapp/view/bottom_pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrentScreen extends StatefulWidget {
  const CurrentScreen({super.key});

  @override
  State<CurrentScreen> createState() => _CurrentScreenState();
}

class _CurrentScreenState extends State<CurrentScreen> {
  final List<Widget> _pages = [
    const AppointmentsPage(),
    const MessagePage(),
    const HomePage(),const ProfilePage()
  ];
  int _currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff027C90),
          fixedColor: Colors.white,
          
          unselectedFontSize: 20,
          iconSize: 25,
           selectedIconTheme:const IconThemeData(size: 40),
          unselectedIconTheme: const IconThemeData(color: Colors.white),
          selectedFontSize: 20,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
        });
      },
      currentIndex: _currentIndex,
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.menu_outlined),label: ""),
        BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/message.svg"), label: ""),
        const BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
        const BottomNavigationBarItem(icon: Icon(Icons.person),label: ""),
      ]),);
  }
}
