import 'package:flutter/material.dart';
import 'package:garbage_tracker/createlist.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Map<String, String>> employeeList = []; // List to store employee data

  void addEmployee(String name, String occupation) {
    setState(() {
      employeeList.add({
        'name': name,
        'occupation': occupation,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 112, 241, 116),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
            ),
            onPressed: () async {
              // Navigate to CreateListPage and await result
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CreateListPage()),
              );
              // Check if result is not null and add employee
              if (result != null && result is Map<String, String>) {
                addEmployee(result['name']!, result['occupation']!);
              }
            },
            child: const Text(
              'Create Employee',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: employeeList.length,
        itemBuilder: (context, index) {
          final employee = employeeList[index];
          return ListTile(
            title: Text(employee['name']!),
            subtitle: Text(employee['occupation']!),
          );
        },
      ),
    );
  }
}
