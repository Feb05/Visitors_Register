import 'package:flutter/material.dart';
import 'package:sbce_visitors/pages/viewall.dart';

class AdminMenu extends StatefulWidget {
  const AdminMenu({super.key});

  @override
  State<AdminMenu> createState() => _MenuSystemState();
}

class _MenuSystemState extends State<AdminMenu> {
  final List<Widget> pages = [Viewall()];
  int currentIndexValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SBCE Visitors"),
        leading: GestureDetector(
          onTap: () {
            print("Logo Clicked");
          },
          child: Icon(Icons.book),
        ),
      ),
      body: pages[currentIndexValue],
    );
  }
}
