import 'package:flutter/material.dart';
import 'package:health_apps/utils/color_utils.dart'; // Assuming color utility is imported


class StepsCountingPage extends StatefulWidget {
  const StepsCountingPage({Key? key}) : super(key: key);

  @override
  _StepsCountingPageState createState() => _StepsCountingPageState();
}

class _StepsCountingPageState extends State<StepsCountingPage> {
  int _stepCount = 0;

  void _incrementSteps() {
    setState(() {
      _stepCount++;
    });
  }

  void _resetSteps() {
    setState(() {
      _stepCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Step Counting"),
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Current Steps",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                Text(
                  "$_stepCount",
                  style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _incrementSteps, // Increment steps on button press
                  child: const Text("Add Step"), // Updated button text
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // You can choose your preferred color
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0), // Adjust padding as needed
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _resetSteps,
                  child: const Text("Reset Steps"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
