import "package:flutter/material.dart";
import "package:todo_app_2/palette/palette.dart";

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: PALETTE.white,
        title: const Text(
          "TODO",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          ),
        actions:  [
          Container(
            color: PALETTE.primaryPurple,
            height: 30,
            child: const Text("+ Task"),

          )
        ]
      ),
    );
  }
}