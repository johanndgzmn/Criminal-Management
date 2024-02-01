import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
import 'package:garbage_tracker/profile.dart';

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
  List<Widget> pages = const [HomePage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title bar
          title: const Text('Home'),
        ),
        body:
        Column(
          // body
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '   Hi, ___',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
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
                  '       Current day',
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
                            DateFormat('     EEEE').format(
                                DateTime.now()), // displays the day of the week
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "      Waste Taken for the Week",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ]),
                    Container(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 60, // Adjust width as needed
                        child: Image.asset(
                            DateTime.now().weekday == 1
                                ? 'images/recycle.png'
                                : DateTime.now().weekday == 2
                                    ? 'images/biodegradable.png'
                                    : DateTime.now().weekday == 3
                                        ? 'images/generalwaste.png'
                                        : DateTime.now().weekday == 4
                                            ? 'images/recycle.png'
                                            : DateTime.now().weekday == 5
                                                ? 'images/biodegradable.png'
                                                : DateTime.now().weekday == 6
                                                    ? 'images/generalwaste.png'
                                                    : '',
                            fit: BoxFit.fitWidth),
                      ),
                    )
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
        bottomNavigationBar: NavigationBar(
          // bottom navigation bar
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
