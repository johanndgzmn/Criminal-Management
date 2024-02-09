import 'package:flutter/material.dart';
import 'package:garbage_tracker/createforum.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  final List<Map<String, String>> _forumPosts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forum'),
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
              // Navigate to CreateForumPage and await result
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateForumPage()),
              );

              // Add the post to the list of forum posts
              if (result != null && result is Map<String, String>) {
                setState(() {
                  _forumPosts.add(result);
                });
              }
            },
            child: const Text(
              'Create Post',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _forumPosts.length,
        itemBuilder: (context, index) {
          final post = _forumPosts[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post['title'] ?? '',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  post['content'] ?? '',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
