 
import 'package:flutter/material.dart';

void main() {
  runApp(SkillHubApp());
}

class SkillHubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkillHub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SkillHub - Хаб Навичок'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ласкаво просимо до SkillHub!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CourseListScreen()),
                );
              },
              child: Text('Переглянути курси'),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseListScreen extends StatelessWidget {
  final List<String> courses = [
    "Основи програмування",
    "Фінансова грамотність",
    "Маркетинг у соцмережах",
    "Основи графічного дизайну",
    "Як ефективно навчатися"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Курси'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(courses[index]),
            leading: Icon(Icons.book),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CourseDetailScreen(courseName: courses[index])),
              );
            },
          );
        },
      ),
    );
  }
}

class CourseDetailScreen extends StatelessWidget {
  final String courseName;

  CourseDetailScreen({required this.courseName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseName),
      ),
      body: Center(
        child: Text('Вивчайте $courseName у SkillHub!', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
