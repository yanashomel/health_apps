import 'package:flutter/material.dart';
import 'package:health_apps/screen/educational_screen.dart';
import 'package:health_apps/screen/health_reminder_screen.dart';
import 'package:health_apps/screen/signin_screen.dart';
import 'package:health_apps/screen/step_counting_screen.dart';
import 'package:health_apps/screen/urine_color_screen.dart';
import 'package:health_apps/screen/water_intake_screen.dart'; // Import Water Intake Screen
import 'package:health_apps/screen/faq_screen.dart'; // Import FAQ Screen
import 'package:health_apps/utils/color_utils.dart'; // Assuming color utility is imported

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int dailyWaterIntake = 1500; // Example daily water intake in milliliters
  String urineColor = "Dark Yellow"; // Example urine color, can be updated from another screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Health Tracker"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              print("User logged out");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SignInScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("33ccff"),
              hexStringToColor("ff99cc"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              _buildCard("Steps Counting", Icons.directions_walk, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StepsCountingPage()),
                );
              }),
              _buildCard("Water Intake Logs", Icons.local_drink, () {
                // Navigate to Water Intake Logs Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WaterIntakeScreen()),
                );
              }),
              _buildCard("Urine Color Tracking", Icons.color_lens, () {
                // Navigate to Urine Color Tracking Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UrineColorTrackingScreen(
                      dailyWaterIntake: dailyWaterIntake,
                    ),
                  ),
                );
              }),
              _buildCard("Health Reminders", Icons.alarm, () {
                // Create an instance of UserHealthData with current values
                UserHealthData userHealthData = UserHealthData(
                  waterIntake: dailyWaterIntake,
                  urineColor: urineColor,
                );

                // Navigate to Health Reminders Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HealthReminderScreen(
                      userHealthData: userHealthData,
                      dailyWaterIntake: dailyWaterIntake,
                      selectedColor: urineColor,
                    ),
                  ),
                );
              }),
              _buildCard("Educational Content", Icons.book, () {
                // Navigate to Educational Content Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EducationalContentScreen()),
                );
              }),
              _buildCard("Frequently Asked Questions", Icons.question_answer, () {
                // Navigate to FAQ Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FAQScreen()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String title, IconData icon, VoidCallback onTap) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: const Color.fromARGB(255, 11, 11, 11)), // Optional color for icons
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 11, 11, 11), // Change text color for visibility
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserHealthData {
  final int waterIntake; // in milliliters
  final String urineColor; // e.g., "Pale Yellow", "Dark Yellow"

  UserHealthData({required this.waterIntake, required this.urineColor});
}
