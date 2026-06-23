import 'package:flutter/material.dart';
import 'package:doomjober/providers/application_provider.dart';
import 'package:doomjober/screens/job_list_screen.dart';
import 'package:doomjober/screens/application_screen.dart';
import 'package:doomjober/screens/profile_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<ApplicationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('DoomJober'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen())),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ваша статистика', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: StatsCard(
                    title: 'Всего откликов',
                    value: appProvider.totalCount.toString(),
                    icon: Icons.send,
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  child: StatsCard(
                    title: 'В ожидании',
                    value: appProvider.pendingCount.toString(),
                    icon: Icons.hourglass_empty,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text('Быстрые действия', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _actionButton(context, 'Найти вакансии', Icons.search, () => Navigator.push(context, MaterialPageRoute(builder: (_) => JobListScreen()))),
                _actionButton(context, 'Мои отклики', Icons.folder, () => Navigator.push(context, MaterialPageRoute(builder: (_) => ApplicationScreen()))),
              ],
            ),
            SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Совет дня', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('Не отправляйте одинаковые письма всем. Персонализируйте каждый отклик – наш генератор вам поможет!'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionButton(BuildContext context, String label, IconData icon, VoidCallback onTap) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey[800],
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}

class StatsCard extends StatelessWidget {
  final String title, value;
  final IconData icon;
  final Color color;
  const StatsCard({required this.title, required this.value, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

