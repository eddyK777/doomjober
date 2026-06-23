```dart
import 'package:flutter/material.dart';
import 'package:doomjober/providers/application_provider.dart';
import 'package:doomjober/providers/job_provider.dart';
import 'package:provider/provider.dart';

class ApplicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<ApplicationProvider>(context);
    final jobProvider = Provider.of<JobProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Мои отклики')),
      body: appProvider.applications.isEmpty
          ? Center(child: Text('Пока нет откликов'))
          : ListView.builder(
              itemCount: appProvider.applications.length,
              itemBuilder: (ctx, index) {
                final app = appProvider.applications[index];
                final job = jobProvider.jobs.firstWhere((j) => j.id == app.jobId, orElse: () => null);
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(app.status[0].toUpperCase()),
                    backgroundColor: app.status == 'pending' ? Colors.orange : Colors.green,
                  ),
                  title: Text(job?.title ?? 'Вакансия удалена'),
                  subtitle: Text('${app.date.toLocal()} - ${app.status}'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Сопроводительное письмо'),
                        content: Text(app.coverLetter),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: Text('Закрыть')),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
```
