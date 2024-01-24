import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColorDark: Colors.green),
        home: const RootPage());
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: const SingleChildScrollView(
            child: Column(
          children: [
            Text(
              'Hi YIPIEE',
              style: TextStyle(fontSize: 45, color: Colors.black),
              textAlign: TextAlign.left,
            ),
            Text('Current Day'),
          ],
        )),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.map), label: 'Live Update'),
            NavigationDestination(
                icon: Icon(Icons.calendar_month), label: 'Schedule'),
            NavigationDestination(icon: Icon(Icons.forum), label: 'Forums'),
            NavigationDestination(
                icon: Icon(Icons.list), label: 'Employee List'),
            NavigationDestination(icon: Icon(Icons.more_horiz), label: 'More'),
          ],
          onDestinationSelected: (int index) {
            setState(() {
              currentPage = index;
            });
          },
          selectedIndex: currentPage,
        ));
  }
}
