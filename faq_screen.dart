import 'package:flutter/material.dart';
import 'package:health_apps/utils/color_utils.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Frequently Asked Questions"),
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
        child: ListView(
          children: [
            _buildFAQItem("How do I track my water intake?",
                "You can track your water intake by entering the amount of water you drink in the app."),
            _buildFAQItem("What is the purpose of urine color reminders?",
                "Urine color reminders help you monitor your hydration levels."),
            _buildFAQItem("How can I access educational content?",
                "You can access educational content through the Educational Content section of the app."),
            _buildFAQItem("Is my health data secure?",
                "Yes, we prioritize your privacy and security of your health data."),
            // Add more FAQs as needed
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              answer,
              style: const TextStyle(color: Color.fromARGB(255, 34, 35, 35)),
            ),
          ],
        ),
      ),
    );
  }
}
