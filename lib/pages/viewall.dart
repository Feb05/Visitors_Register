import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Viewall extends StatefulWidget {
  const Viewall({super.key});

  @override
  State<Viewall> createState() => _ViewallState();
}

class _ViewallState extends State<Viewall> {
  List<Map<String, dynamic>> students = [];

  Future<void> fetchStudentData() async {
    final ApiUrl =
        Uri.parse("https://log-app-demo-api.onrender.com/getvistors");
    try {
      final response = await http.get(ApiUrl);
      if (response.statusCode == 200) {
        List data = json.decode(response.body);
        setState(() {
          students = List<Map<String, dynamic>>.from(data);
        });
      } else {
        throw Exception("Failed to fetch API data");
      }
    } catch (exception) {
      print(exception);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchStudentData();
  }

  @override
  Widget build(BuildContext context) {
    return students.isEmpty
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];
              return Card(
                elevation: 10,
                child: ListTile(
                  title: Text(student["firstname"] ??
                      "No first name"), // Handle null with a default value
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(student["lastname"] ?? "No last name"),
                      Text(student["whom to meet"] ?? "No details"),
                      Text(student["purpose"] ?? "No purpose specified"),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
