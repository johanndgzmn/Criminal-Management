import 'package:flutter/material.dart';

class CreateListPage extends StatefulWidget {
  const CreateListPage({Key? key});

  @override
  State<CreateListPage> createState() => _CreateListPageState();
}

class _CreateListPageState extends State<CreateListPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Employee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Employee Name',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _occupationController,
              decoration: const InputDecoration(
                labelText: 'Occupation',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Get the input values
                String name = _nameController.text;
                String occupation = _occupationController.text;

                // Return data back to the previous screen
                Navigator.pop(context, {
                  'name': name,
                  'occupation': occupation,
                });
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class ListPage extends StatefulWidget {
  const ListPage({Key? key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Map<String, String>> employeeList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to CreateListPage and await result
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateListPage()),
          );

          // Check if result is not null and add employee
          if (result != null && result is Map<String, String>) {
            setState(() {
              employeeList.add(result);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ListPage(),
  ));
}
