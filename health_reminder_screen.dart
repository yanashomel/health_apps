import 'package:flutter/material.dart';
import 'package:health_apps/screen/home_screen.dart';
import 'package:health_apps/utils/color_utils.dart';

class HealthReminderScreen extends StatelessWidget {
  final UserHealthData userHealthData;
  final int dailyWaterIntake;

  const HealthReminderScreen({
    Key? key,
    required this.userHealthData,
    required this.dailyWaterIntake, required String selectedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Health Reminders"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("33ccff"), // Light blue
              hexStringToColor("ff99cc"), // Light pink
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Health Reminders",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildHealthReminderCard(
              title: "Water Intake Reminder",
              reminder: _getWaterIntakeReminder(),
            ),
            const SizedBox(height: 20),
            _buildHealthReminderCard(
              title: "Urine Color Reminder",
              reminder: _getUrineColorReminder(),
            ),
            const SizedBox(height: 20),
            _buildGeneralHealthAdvice(),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthReminderCard({
    required String title,
    required String reminder,
  }) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              reminder,
              style: const TextStyle(color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }

  String _getWaterIntakeReminder() {
    // Simple reminder logic based on water intake
    if (userHealthData.waterIntake < dailyWaterIntake) {
      return "You should drink more water to reach your daily goal!";
    } else {
      return "Great job! You're meeting your daily water intake goal.";
    }
  }

  String _getUrineColorReminder() {
    // Simple reminder logic based on urine color
    switch (userHealthData.urineColor.toLowerCase()) {
      case "dark yellow":
        return "Your urine color indicates dehydration. Please drink more water!";
      case "pale yellow":
        return "Your urine color is healthy. Keep it up!";
      case "clear":
        return "Good job! Your hydration level looks great!";
      default:
        return "Check your urine color regularly to monitor your hydration.";
    }
  }

  Widget _buildGeneralHealthAdvice() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "General Health Advice",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Consider eating healthy foods like fruits, vegetables, "
              "and whole grains to maintain overall health.",
              style: const TextStyle(color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}

