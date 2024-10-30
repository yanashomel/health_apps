import 'package:flutter/material.dart';
import 'package:health_apps/utils/color_utils.dart'; // Assuming color utility is imported

class WaterIntakeScreen extends StatefulWidget {
  const WaterIntakeScreen({super.key});

  @override
  _WaterIntakeScreenState createState() => _WaterIntakeScreenState();
}

class _WaterIntakeScreenState extends State<WaterIntakeScreen> {
  int _waterIntake = 0; // Track the user's water intake
  final int _goal = 3000; // Set a daily water intake goal in milliliters

  void _addWater(int amount) {
    if (_waterIntake + amount > _goal) {
      // Notify user if they try to exceed the goal
      _showAlert("You cannot exceed the daily goal of $_goal mL.");
    } else {
      setState(() {
        _waterIntake += amount; // Add water intake
      });
    }
  }

  void _resetIntake() {
    setState(() {
      _waterIntake = 0; // Reset water intake to zero
    });
  }

  void _checkGoal() {
    if (_waterIntake < _goal) {
      // Notify user if the goal is not met
      _showAlert("You have not reached your daily water intake goal. Please drink more water!");
    } else {
      _showAlert("Congratulations! You've reached your daily goal of $_goal mL.");
    }
  }

  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Water Intake"),
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
        title: const Text("Water Intake Tracker"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _checkGoal, // Check if the goal is reached
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Water Intake: $_waterIntake mL",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Goal: $_goal mL",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _waterIntake >= _goal ? null : () => _addWater(250), // Disable if goal reached
              child: const Text("Add 250 mL"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _waterIntake >= _goal ? null : () => _addWater(500), // Disable if goal reached
              child: const Text("Add 500 mL"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _resetIntake, // Reset water intake
              child: const Text("Reset"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.red, // Set text color to white
              ),
            ),
          ],
        ),
      ),
    );
  }
}

