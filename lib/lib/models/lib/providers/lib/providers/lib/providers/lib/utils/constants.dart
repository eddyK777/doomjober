import 'package:doomjober/models/job.dart';

class Constants {
  static List<Job> demoJobs = [
    Job(
      id: '1',
      title: 'Flutter-разработчик',
      company: 'TechCorp',
      location: 'Москва (удалённо)',
      description: 'Разработка кроссплатформенных приложений на Flutter. Опыт от 2 лет.',
      skills: ['Flutter', 'Dart', 'REST API', 'Firebase'],
      salary: 'от 250 000 ₽',
    ),
    Job(
      id: '2',
      title: 'Аналитик данных',
      company: 'DataHub',
      location: 'Санкт-Петербург',
      description: 'Сбор и обработка данных, построение дашбордов. Знание Python, SQL, Tableau.',
      skills: ['Python', 'SQL', 'Tableau', 'Статистика'],
      salary: '200 000 – 300 000 ₽',
    ),
    Job(
      id: '3',
      title: 'Менеджер продукта',
      company: 'ProductLab',
      location: 'Новосибирск (гибрид)',
      description: 'Управление жизненным циклом продукта, работа с командой разработки.',
      skills: ['Agile', 'Product Management', 'Jira', 'Аналитика'],
      salary: 'от 180 000 ₽',
    ),
  ];
}

