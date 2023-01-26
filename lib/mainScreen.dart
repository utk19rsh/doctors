import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:doctors/components/frontend/screen.dart';
import 'package:doctors/constants.dart';
import 'package:doctors/screens/appointment/appointment.dart';
import 'package:doctors/screens/doctors/doctors.dart';
import 'package:doctors/screens/home/home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController pc = PageController(keepPage: true, initialPage: 0);
  int currentPage = 0;

  onChanged(int index) => setState(() {
        if (pc.hasClients) {
          pc.jumpToPage(index);
          currentPage = index;
        }
      });

  List<Widget> screens = [
    const HomePage(),
    const Doctors(),
    const Appointment(),
    const Scaffold(
      body: Center(
        child: Text("Page3"),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: PageView(
          controller: pc,
          onPageChanged: (index) => onChanged(index),
          physics: const NeverScrollableScrollPhysics(),
          children: screens,
        ),
        bottomNavigationBar: MediaQuery.removePadding(
          context: context,
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 0),
            decoration: BoxDecoration(
              color: white,
              border: Border(
                top: BorderSide(color: grey.shade300, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyBottomNavigationBarItem(
                  iconData: MdiIcons.home,
                  isActive: currentPage == 0,
                  onTap: () => onChanged(0),
                ),
                MyBottomNavigationBarItem(
                  iconData: MdiIcons.fileDocument,
                  isActive: currentPage == 1,
                  onTap: () => onChanged(1),
                ),
                MyBottomNavigationBarItem(
                  iconData: MdiIcons.calendar,
                  isActive: currentPage == 2,
                  onTap: () => onChanged(2),
                ),
                MyBottomNavigationBarItem(
                  iconData: MdiIcons.cog,
                  isActive: currentPage == 3,
                  onTap: () => onChanged(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyBottomNavigationBarItem extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onTap;
  final bool isActive;
  const MyBottomNavigationBarItem({
    Key? key,
    required this.iconData,
    required this.onTap,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Screen s = Screen(context);
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.bounceOut,
              alignment: Alignment.center,
              height: 3,
              width: isActive ? 25 : 0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(4),
                ),
                color: amber,
              ),
            ),
            Icon(
              iconData,
              color: isActive ? amber : grey.shade500,
            ),
            SizedBox(height: s.bottomPadding),
          ],
        ),
      ),
    );
  }
}
