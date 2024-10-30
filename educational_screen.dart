import 'package:flutter/material.dart';
import 'package:health_apps/utils/color_utils.dart';
import 'package:url_launcher/url_launcher.dart'; // Ensure this import is added

class EducationalContentScreen extends StatelessWidget {
  const EducationalContentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Educational Content"),
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
            _buildListItem(
              context,
              title: "Importance of Hydration",
              description: "Learn why staying hydrated is essential for your health.",
              url: "https://www.example.com/hydration",
            ),
            const SizedBox(height: 10), // Add spacing between items
            _buildListItem(
              context,
              title: "Healthy Eating Habits",
              description: "Discover tips for maintaining a balanced diet.",
              url: "https://www.example.com/healthy-eating",
            ),
            const SizedBox(height: 10),
            _buildListItem(
              context,
              title: "Understanding Urine Color",
              description: "Find out what your urine color says about your hydration.",
              url: "https://www.example.com/urine-color",
            ),
            const SizedBox(height: 10),
            _buildListItem(
              context,
              title: "Benefits of Regular Exercise",
              description: "Explore how physical activity impacts your health.",
              url: "https://www.example.com/exercise-benefits",
            ),
            const SizedBox(height: 10),
            // Add more educational content items as needed
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, {
    required String title,
    required String description,
    required String url,
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
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8), // Spacing between title and description
            Text(description),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
