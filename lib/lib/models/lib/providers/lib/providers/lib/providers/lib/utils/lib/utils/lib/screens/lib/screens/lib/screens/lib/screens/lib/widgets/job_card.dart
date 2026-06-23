```dart
import 'package:flutter/material.dart';
import 'package:doomjober/models/job.dart';

class JobCard extends StatelessWidget {
  final Job job;
  final VoidCallback onApply;

  const JobCard({required this.job, required this.onApply});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(job.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('${job.company} • ${job.location}'),
            SizedBox(height: 4),
            Text(job.salary, style: TextStyle(color: Colors.greenAccent)),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: job.skills.map((s) => Chip(label: Text(s), backgroundColor: Colors.blueGrey[700])).toList(),
            ),
            SizedBox(height: 8),
            Text(job.description, maxLines: 2, overflow: TextOverflow.ellipsis),
            SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: onApply,
                child: Text('Автоотклик'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
