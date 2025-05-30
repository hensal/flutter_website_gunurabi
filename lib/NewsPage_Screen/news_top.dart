import 'package:flutter/material.dart';

// Define your page widgets
class NewsTopPage extends StatelessWidget {
  const NewsTopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'News',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'News Release',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
        const Divider(),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
            '|',
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          SizedBox(width: 10),
            Text(
            'News Release',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
          ),
             SizedBox(width: 10),
            Icon(Icons.wifi, size: 30, color: Colors.blue),
          ],
        ),
        const SizedBox(height: 20),
        // Displaying 10 news items
        Column(
          children: List.generate(10, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                'Dec.05.2019   Tapica is the japane alaeteee $index',
                style: TextStyle(fontSize: 16),
              ),
            );
          }),
        ),
      ],
    );
  }
}
