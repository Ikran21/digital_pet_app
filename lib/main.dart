import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Digital Pet',
      home: DigitalPetPage(),
    );
  }
}

class DigitalPetPage extends StatefulWidget {
  @override
  _DigitalPetPageState createState() => _DigitalPetPageState();
}

class _DigitalPetPageState extends State<DigitalPetPage> {
  int happiness = 50;
  int hunger = 50;

  // Method to feed the pet:
  void feedPet() {
    setState(() {
      // Feeding reduces hunger and slightly increases happiness.
      hunger = (hunger - 10).clamp(0, 100);
      happiness = (happiness + 5).clamp(0, 100);
    });
  }

  // Method to play with the pet:
  void playWithPet() {
    setState(() {
      // Playing increases happiness but also increases hunger.
      happiness = (happiness + 10).clamp(0, 100);
      hunger = (hunger + 5).clamp(0, 100);
    });
  }

  // A simple getter to determine pet status based on its hunger and happiness.
  String get petStatus {
    if (hunger > 70) {
      return "I'm hungry!";
    } else if (happiness < 30) {
      return "I'm feeling sad...";
    } else {
      return "I'm doing okay!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Digital Pet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Pet Status: $petStatus",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "Hunger: $hunger/100",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Happiness: $happiness/100",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 40),
              TextButton(
                onPressed: feedPet,
                child: Text(
                  'Feed Pet',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: playWithPet,
                child: Text(
                  'Play with Pet',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
