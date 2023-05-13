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

  final List<Widget> screens = [
    const Dashboard(),
    const Calendario(),
    const Proyectos(),
    const Estadisticas()
  ];// Store the tabs

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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: PALETTE.white,
        unselectedItemColor: PALETTE.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: PALETTE.primaryPurple,
        onTap: (index){
          setState(() {
            _currentIndex = index;
            currentScreen = screens[index];
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
            tooltip: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Calendar",
            tooltip: "Calendario"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: "Proyects",
            tooltip: "Proyectos"
          ),
          BottomNavigationBarItem(
            label: "Stats",
            icon: Icon(Icons.bar_chart),
            tooltip: "Estadisticas"
          ),
        ],
      ),
      
    );
  }
}