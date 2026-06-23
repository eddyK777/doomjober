import 'package:flutter/material.dart';
import 'package:doomjober/models/job.dart';
import 'package:doomjober/providers/job_provider.dart';
import 'package:doomjober/providers/application_provider.dart';
import 'package:doomjober/providers/user_provider.dart';
import 'package:doomjober/widgets/job_card.dart';
import 'package:provider/provider.dart';

class JobListScreen extends StatefulWidget {
  @override
  _JobListScreenState createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<JobProvider>(context);
    final appProvider = Provider.of<ApplicationProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Вакансии'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Поиск...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                filled: true,
                fillColor: Colors.grey[800],
              ),
              onChanged: (query) => jobProvider.filterJobs(query),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: jobProvider.jobs.length,
        itemBuilder: (ctx, index) {
          final job = jobProvider.jobs[index];
          return JobCard(
            job: job,
            onApply: () {
              if (userProvider.name.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Сначала заполните профиль в настройках')),
                );
                return;
              }
              appProvider.applyForJob(job.id, userProvider.getProfileMap());
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Отклик на "${job.title}" отправлен!')),
              );
            },
          );
        },
      ),
    );
  }
}

