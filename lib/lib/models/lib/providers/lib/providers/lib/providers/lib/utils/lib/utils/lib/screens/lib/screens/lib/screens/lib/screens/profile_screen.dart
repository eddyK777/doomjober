```dart
import 'package:flutter/material.dart';
import 'package:doomjober/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController, _emailController, _phoneController, _skillsController, _experienceController;

  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserProvider>(context, listen: false);
    _nameController = TextEditingController(text: user.name);
    _emailController = TextEditingController(text: user.email);
    _phoneController = TextEditingController(text: user.phone);
    _skillsController = TextEditingController(text: user.skills);
    _experienceController = TextEditingController(text: user.experience);
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Профиль')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(controller: _nameController, decoration: InputDecoration(labelText: 'ФИО')),
              TextFormField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
              TextFormField(controller: _phoneController, decoration: InputDecoration(labelText: 'Телефон')),
              TextFormField(controller: _skillsController, decoration: InputDecoration(labelText: 'Навыки (через запятую)')),
              TextFormField(
                controller: _experienceController,
                decoration: InputDecoration(labelText: 'Опыт работы (лет)'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    userProvider.updateProfile(
                      name: _nameController.text,
                      email: _emailController.text,
                      phone: _phoneController.text,
                      skills: _skillsController.text,
                      experience: _experienceController.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Профиль сохранён')));
                  }
                },
                child: Text('Сохранить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
