// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Analyzer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WorkoutInputScreen(),
    );
  }
}

class WorkoutInputScreen extends StatefulWidget {
  const WorkoutInputScreen({super.key});

  @override
  _WorkoutInputScreenState createState() => _WorkoutInputScreenState();
}

class _WorkoutInputScreenState extends State<WorkoutInputScreen> {
  TextEditingController workoutController = TextEditingController();
  ExerciseInfo? analyzedExerciseInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Analyzer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: workoutController,
              decoration: const InputDecoration(
                labelText: 'Enter Your Exercise',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                analyzeExercise(workoutController.text);
              },
              child: const Text('Analyze Exercise'),
            ),
            const SizedBox(height: 20),
            if (analyzedExerciseInfo != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${analyzedExerciseInfo!.name}'),
                  Text('Force: ${analyzedExerciseInfo!.force}'),
                  Text('Level: ${analyzedExerciseInfo!.level}'),
                  Text('Mechanic: ${analyzedExerciseInfo!.mechanic}'),
                  Text('Equipment: ${analyzedExerciseInfo!.equipment}'),
                  Text('Primary Muscles: ${analyzedExerciseInfo!.primaryMuscles.join(', ')}'),
                  Text('Secondary Muscles: ${analyzedExerciseInfo!.secondaryMuscles.join(', ')}'),
                  Text('Category: ${analyzedExerciseInfo!.category}'),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Future<void> analyzeExercise(String exerciseName) async {
    final String apiUrl =
        'https://raw.githubusercontent.com/wrkout/exercises.json/master/exercises/$exerciseName/exercise.json';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      final ExerciseInfo exerciseInfo = ExerciseInfo.fromJson(jsonData);

      setState(() {
        analyzedExerciseInfo = exerciseInfo;
      });
    } else {
      setState(() {
        analyzedExerciseInfo = null;
      });
    }
  }
}

class ExerciseInfo {
  final String name;
  final String force;
  final String level;
  final String mechanic;
  final String equipment;
  final List<String> primaryMuscles;
  final List<String> secondaryMuscles;
  final List<String> instructions;
  final String category;

  ExerciseInfo({
    required this.name,
    required this.force,
    required this.level,
    required this.mechanic,
    required this.equipment,
    required this.primaryMuscles,
    required this.secondaryMuscles,
    required this.instructions,
    required this.category,
  });

  factory ExerciseInfo.fromJson(Map<String, dynamic> json) {
    return ExerciseInfo(
      name: json['name'],
      force: json['force'],
      level: json['level'],
      mechanic: json['mechanic'],
      equipment: json['equipment'],
      primaryMuscles: List<String>.from(json['primaryMuscles']),
      secondaryMuscles: List<String>.from(json['secondaryMuscles']),
      instructions: List<String>.from(json['instructions']),
      category: json['category'],
    );
  }
}
