import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  String _name = '';
  String _email = '';
  String _phone = '';
  String _skills = '';
  String _experience = '';

  String get name => _name;
  String get email => _email;
  String get phone => _phone;
  String get skills => _skills;
  String get experience => _experience;

  UserProvider() {
    _loadFromPrefs();
  }

  void updateProfile({
    required String name,
    required String email,
    required String phone,
    required String skills,
    required String experience,
  }) {
    _name = name;
    _email = email;
    _phone = phone;
    _skills = skills;
    _experience = experience;
    _saveToPrefs();
    notifyListeners();
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _name = prefs.getString('name') ?? '';
    _email = prefs.getString('email') ?? '';
    _phone = prefs.getString('phone') ?? '';
    _skills = prefs.getString('skills') ?? '';
    _experience = prefs.getString('experience') ?? '';
    notifyListeners();
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _name);
    await prefs.setString('email', _email);
    await prefs.setString('phone', _phone);
    await prefs.setString('skills', _skills);
    await prefs.setString('experience', _experience);
  }

  Map<String, String> getProfileMap() => {
    'name': _name,
    'email': _email,
    'phone': _phone,
    'skills': _skills,
    'experience': _experience,
  };
}

