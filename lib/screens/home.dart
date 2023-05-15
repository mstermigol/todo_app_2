import 'package:flutter/material.dart';
import 'package:todo_app_2/screens/Dashboard.dart';
import 'package:todo_app_2/screens/Calendario.dart';
import 'package:todo_app_2/screens/Proyectos.dart';
import 'package:todo_app_2/screens/Estadisticas.dart';
import 'package:todo_app_2/palette/palette.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Properties
  int _currentIndex = 0;
  static double referencia = 30;

  final List<Widget> screens = [
    const Dashboard(),
    const Calendario(),
    const Proyectos(),
    const Estadisticas()
  ]; // Store the tabs

  //Active page

  Widget currentScreen = const Dashboard();

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: Container(
        height: referencia * 2,
        decoration: const BoxDecoration(
            color: PALETTE.primaryPurple,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15))),
        child: Theme(
          data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent),
          child: BottomNavigationBar(
            iconSize: referencia,
            selectedItemColor: PALETTE.white,
            unselectedItemColor: PALETTE.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            backgroundColor: Colors.transparent,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                currentScreen = screens[index];
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard_outlined,
                ),
                label: "Dashboard",
                tooltip: "Dashboard",
                activeIcon: Icon(Icons.dashboard),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_today_outlined,
                ),
                label: "Calendar",
                tooltip: "Calendario",
                activeIcon: Icon(
                  Icons.calendar_today,
                ),
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.folder_outlined,
                  ),
                  label: "Proyects",
                  tooltip: "Proyectos",
                  activeIcon: Icon(
                    Icons.folder,
                  )),
              BottomNavigationBarItem(
                  label: "Stats",
                  icon: Icon(
                    Icons.leaderboard_outlined,
                  ),
                  tooltip: "Estadisticas",
                  activeIcon: Icon(
                    Icons.leaderboard,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
