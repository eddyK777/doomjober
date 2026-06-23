```dart
import 'package:doomjober/models/job.dart';
import 'package:doomjober/providers/job_provider.dart';

class CoverLetterGenerator {
  static String generate(Map<String, String> user, String jobId) {
    final name = user['name'] ?? 'Соискатель';
    final skills = user['skills'] ?? 'ваши навыки';
    return '''
Уважаемые господа!

Меня зовут $name. Я заинтересован в вакансии (ID: $jobId), так как мои навыки ($skills) полностью соответствуют требованиям. 
Я обладаю опытом ${user['experience'] ?? ''} и стремлюсь развиваться в вашей компании.

С уважением,
$name
''';
  }
}
```
