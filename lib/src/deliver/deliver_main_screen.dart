

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'list_screen/list_screen.dart';

class DeliverMainScreen extends StatefulWidget {
  const DeliverMainScreen({Key? key}) : super(key: key);

  @override
  State<DeliverMainScreen> createState() => _DeliverMainScreenState();
}

class _DeliverMainScreenState extends State<DeliverMainScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListScreen(),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.only(right: 32.w ,left: 32.w, top: 12.w),
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(CupertinoIcons.map_fill),
              title: Text("Maps"),
              selectedColor: Colors.purple,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(CupertinoIcons.list_dash),
              title: Text("List"),
              selectedColor: Colors.teal,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
