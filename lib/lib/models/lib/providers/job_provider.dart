import 'package:flutter/material.dart';
import 'package:doomjober/models/job.dart';
import 'package:doomjober/utils/constants.dart';

class JobProvider extends ChangeNotifier {
  List<Job> _jobs = [];
  List<Job> _filteredJobs = [];
  String _searchQuery = '';

  List<Job> get jobs => _filteredJobs;

  JobProvider() {
    _loadJobs();
  }

  void _loadJobs() {
    _jobs = Constants.demoJobs;
    _filteredJobs = _jobs;
    notifyListeners();
  }

  void filterJobs(String query, {List<String>? skills}) {
    _searchQuery = query;
    _filteredJobs = _jobs.where((job) {
      final matchesQuery = job.title.toLowerCase().contains(query.toLowerCase()) ||
          job.company.toLowerCase().contains(query.toLowerCase()) ||
          job.description.toLowerCase().contains(query.toLowerCase());
      final matchesSkills = skills == null || skills.isEmpty ||
          job.skills.any((s) => skills.contains(s));
      return matchesQuery && matchesSkills;
    }).toList();
    notifyListeners();
  }

  void addJob(Job job) {
    _jobs.add(job);
    filterJobs(_searchQuery);
  }
}

