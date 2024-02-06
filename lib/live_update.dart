import 'package:flutter/material.dart';
import 'package:garbage_tracker/feedcreate.dart';

class LiveUpdatePage extends StatefulWidget {
  const LiveUpdatePage({super.key});

  @override
  State<LiveUpdatePage> createState() => _LiveUpdate();
}

class _LiveUpdate extends State<LiveUpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Updates'),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 112, 241, 116),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8.0)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CreateFeed()),
              );
            },
            child: const Text(
              'Create Update',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
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
        ],
      ),
    );
  }
}
