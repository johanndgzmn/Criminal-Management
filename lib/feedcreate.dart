import 'package:flutter/material.dart';
import 'package:garbage_tracker/live_update.dart';

class CreateFeed extends StatefulWidget {
  const CreateFeed({Key? key});

  @override
  State<CreateFeed> createState() => _CreateFeedState();
}

class _CreateFeedState extends State<CreateFeed> {
  String? selectedPhase;
  String? selectedStreet;

  List<String> phases = ['Phase 1', 'Phase 2'];
  List<String> streets1 = [
    'London',
    'Madrid',
    'Rome',
    'Miami',
    'Brussels', // Unique values
    'Tokyo',
    'Paris',
    'New Hope Drive',
    'Countryside Drive',
    'Brooksville Drive',
    'Norristown Street',
    'Ridgeway Drive',
    'Homestead Drive',
    'Lewiston Drive',
    'North Circle',
    'Sunbury Street',
    'Landsdale'
  ];
  List<String> streets2 = [
    'Main Road',
    'Afables',
    'Getty Burg',
    'Comanche',
    'South Circle',
    'Citrus Lane',
    'Park Place Avenue',
    'Palo Alto',
    'Atherton',
    'Boardwalk',
    'Palm Drive',
    'Marble Lane',
    'Delos Angeles Drive',
    'Standford',
    'Nonat',
    'Sequig',
    'Monterey St'
  ];

  List<String> getAvailableStreets() {
    if (selectedPhase == 'Phase 1') {
      return streets1;
    } else if (selectedPhase == 'Phase 2') {
      return streets2;
    } else {
      return [];
    }
  }

  void _createUpdate() {
    if (selectedPhase != null && selectedStreet != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LiveUpdatePage(
            phase: selectedPhase!,
            street: selectedStreet!,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Update'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Phase:',
              style: TextStyle(fontSize: 18.0),
            ),
            DropdownButton<String>(
              value: selectedPhase,
              onChanged: (String? newValue) {
                setState(() {
                  selectedPhase = newValue;
                  selectedStreet =
                      null; // Reset selected street when phase changes
                });
              },
              items: phases.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              'Select Street:',
              style: TextStyle(fontSize: 18.0),
            ),
            DropdownButton<String>(
              value: selectedStreet,
              onChanged: selectedPhase == null
                  ? null
                  : (String? newValue) {
                      setState(() {
                        selectedStreet = newValue;
                      });
                    },
              items: getAvailableStreets()
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 112, 241, 116),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              ),
              onPressed: _createUpdate,
              child: const Text(
                'Create Update',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CreateFeed(),
  ));
}
