import 'package:flutter/material.dart';
import 'package:doomjober/models/application.dart';
import 'package:doomjober/utils/cover_letter_generator.dart';

class ApplicationProvider extends ChangeNotifier {
  List<Application> _applications = [];

  List<Application> get applications => _applications;

  void applyForJob(String jobId, Map<String, String> userProfile) {
    final coverLetter = CoverLetterGenerator.generate(userProfile, jobId);
    final application = Application(
      jobId: jobId,
      date: DateTime.now(),
      coverLetter: coverLetter,
      status: 'pending',
    );
    _applications.add(application);
    notifyListeners();
  }

  void updateStatus(String jobId, String newStatus) {
    final index = _applications.indexWhere((app) => app.jobId == jobId);
    if (index != -1) {
      _applications[index] = Application(
        jobId: jobId,
        date: _applications[index].date,
        coverLetter: _applications[index].coverLetter,
        status: newStatus,
      );
      notifyListeners();
    }
  }

  int get pendingCount => _applications.where((a) => a.status == 'pending').length;
  int get totalCount => _applications.length;
}

