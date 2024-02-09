import 'package:flutter/material.dart';

class CreateForumPage extends StatefulWidget {
  const CreateForumPage({Key? key});

  @override
  State<CreateForumPage> createState() => _CreateForumPageState();
}

class _CreateForumPageState extends State<CreateForumPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Post Title',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _contentController,
              maxLines: null, // Allows multiple lines
              keyboardType: TextInputType.multiline, // Allows multiline input
              decoration: const InputDecoration(
                labelText: 'Post Content',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String title = _titleController.text;
                String content = _contentController.text;

                print('Title: $title, Content: $content');

                _titleController.clear();
                _contentController.clear();

                Navigator.pop(context, {
                  'title': title,
                  'content': content,
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
