class Job {
  final String id;
  final String title;
  final String company;
  final String location;
  final String description;
  final List<String> skills;
  final String salary;

  Job({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.description,
    required this.skills,
    required this.salary,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json['id'],
        title: json['title'],
        company: json['company'],
        location: json['location'],
        description: json['description'],
        skills: List<String>.from(json['skills']),
        salary: json['salary'],
      );
}

