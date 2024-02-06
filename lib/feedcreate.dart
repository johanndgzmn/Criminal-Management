import 'package:flutter/material.dart';

class CreateFeed extends StatefulWidget {
  const CreateFeed({super.key});

  @override
  State<CreateFeed> createState() => _CreateFeedState();
}

class _CreateFeedState extends State<CreateFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Update'),
      ),
      body: Container(),
    );
  }
}
