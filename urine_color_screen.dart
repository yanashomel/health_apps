import 'package:flutter/material.dart';
import 'package:health_apps/utils/color_utils.dart'; // Assuming color utility is imported

class UrineColorTrackingScreen extends StatefulWidget {
  const UrineColorTrackingScreen({Key? key, required int dailyWaterIntake}) : super(key: key);

  @override
  _UrineColorTrackingScreenState createState() => _UrineColorTrackingScreenState();
}

class _UrineColorTrackingScreenState extends State<UrineColorTrackingScreen> {
  String? _selectedColor; // Track the selected urine color

  // Predefined colors and their meanings
  final Map<String, String> _colorFeedback = {
    'Clear': 'Great! You are well hydrated.',
    'Light Yellow': 'Good! You are hydrated.',
    'Dark Yellow': 'Fair. Consider drinking more water.',
    'Amber': 'Caution! You are dehydrated.',
    'Brown': 'Danger! Seek medical advice.',
    'Red': 'Emergency! Seek medical attention immediately.',
  };

  void _showFeedback() {
    if (_selectedColor != null) {
      String feedback = _colorFeedback[_selectedColor!] ?? 'Unknown color. Please consult a doctor.';
      _showAlert(feedback);
    } else {
      _showAlert('Please select a urine color first.');
    }
  }

  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Urine Color Feedback"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Urine Color Tracking"),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Select Urine Color:",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: _colorFeedback.keys.map((color) {
                  return ListTile(
                    title: Text(color, style: const TextStyle(color: Colors.white)),
                    leading: Radio<String>(
                      value: color,
                      groupValue: _selectedColor,
                      onChanged: (value) {
                        setState(() {
                          _selectedColor = value;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: _showFeedback, // Show feedback based on the selected color
              child: const Text("Check Urine Color"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}


