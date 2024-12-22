import 'package:flutter/material.dart';
import 'package:sbce_visitors/pages/addvisitor.dart';
import 'package:sbce_visitors/pages/viewall.dart';

class SecMenu extends StatefulWidget {
  const SecMenu({super.key});

  @override
  State<SecMenu> createState() => _MenuSystemState();
}

class _MenuSystemState extends State<SecMenu> {
  final List<Widget> pages = [Visitor(), Viewall()];
  int currentIndexValue = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Scaffold(
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndexValue,
          onTap: (index) {
            setState(() {
              currentIndexValue = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.add), label: "Add Visitor"),
            BottomNavigationBarItem(
                icon: Icon(Icons.view_comfy), label: "View All Visitors")
          ],
        ),
      ),
    );
  }
}
