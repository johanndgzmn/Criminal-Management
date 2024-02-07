import 'package:flutter/material.dart';
import 'package:garbage_tracker/forum.dart';
import 'package:garbage_tracker/list.dart';
import 'package:garbage_tracker/live_update.dart';
import 'package:garbage_tracker/schedule.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColorDark: Colors.green),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barangay Garbage Tracker',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
      ),
      body: IndexedStack(
        index: currentPage,
        children: const [
          HomePageContent(),
          LiveUpdatePage(
            phase: '',
            street: '',
          ),
          SchedulePage(),
          ForumPage(),
          ListPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map, color: Colors.black),
            label: 'Live Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month, color: Colors.black),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum, color: Colors.black),
            label: 'Forums',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.more_horiz,
              color: Colors.black,
            ),
            label: '',
          ),
        ],
        currentIndex: currentPage,
        onTap: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedLabelStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Hi, user!',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const Padding(
            // Container 1
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                '      Current day',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            widthFactor: 50,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 238, 176, 83),
                borderRadius: BorderRadius.circular(40.0),
              ),
              width: 450,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('EEEE').format(
                              DateTime.now()), // displays the day of the week
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          DateTime.now().weekday == 1
                              ? 'Recyclable Waste'
                              : DateTime.now().weekday == 2
                                  ? 'Biodegradeable Waste'
                                  : DateTime.now().weekday == 3
                                      ? 'General Waste'
                                      : DateTime.now().weekday == 4
                                          ? 'Recyclable Waste'
                                          : DateTime.now().weekday == 5
                                              ? 'Biodegradeable Waste'
                                              : DateTime.now().weekday == 6
                                                  ? 'General Waste'
                                                  : 'No Waste Taken',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                      ]),
                  Container(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 60,
                      child: Image.asset(
                          DateTime.now().weekday == 1 // Monday
                              ? 'images/recycle.png'
                              : DateTime.now().weekday == 2 // Tuesday
                                  ? 'images/biodegradable.png'
                                  : DateTime.now().weekday == 3 // Wed
                                      ? 'images/generalwaste.png'
                                      : DateTime.now().weekday == 4 // Thur
                                          ? 'images/recycle.png'
                                          : DateTime.now().weekday == 5 // Fri
                                              ? 'images/biodegradable.png'
                                              : DateTime.now().weekday ==
                                                      6 // Sat
                                                  ? 'images/generalwaste.png'
                                                  : '', // Sun
                          fit: BoxFit.fitWidth),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            // Container 2
            padding: EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                '       Announcements',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            widthFactor: 50,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(40.0),
              ),
              width: 450,
              height: 100,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "     No announcements...",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            // Container 3
            padding: EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                '       Live Feed',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            widthFactor: 50,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(40.0),
              ),
              width: 450,
              height: 100,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "     No live feed...",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          // Other widgets
        ],
      ),
    );
  }
}
