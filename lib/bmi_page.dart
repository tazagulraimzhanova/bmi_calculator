import 'gender_card.dart';
import 'counter_card.dart';
import 'package:flutter/material.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  int height = 170;
  int weight = 60;
  int age = 18;
  bool isMale = true; // Пол: true - мужчина, false - женщина

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')),
      body: Column(
        children: [
          // Выбор пола
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GenderCard(
                icon: Icons.male,
                label: "Male",
                isSelected: isMale,
                onTap: () {
                  setState(() {
                    isMale = true;
                  });
                },
              ),
              GenderCard(
                icon: Icons.female,
                label: "Female",
                isSelected: !isMale,
                onTap: () {
                  setState(() {
                    isMale = false;
                  });
                },
              ),
            ],
          ),

          // Ползунок для выбора роста
          Expanded(
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Height (cm)"),
                  Text(
                    "$height",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.purple,
                      inactiveTrackColor: Colors.purple.shade100,
                      thumbColor: Colors.deepPurple,
                      overlayColor: Colors.deepPurple.withAlpha(32),
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 12,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 24,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 250,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Выбор веса и возраста
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CounterCard(
                label: "Weight",
                value: weight,
                onIncrement: () {
                  setState(() {
                    weight++;
                  });
                },
                onDecrement: () {
                  setState(() {
                    weight--;
                  });
                },
              ),
              CounterCard(
                label: "Age",
                value: age,
                onIncrement: () {
                  setState(() {
                    age++;
                  });
                },
                onDecrement: () {
                  setState(() {
                    age--;
                  });
                },
              ),
            ],
          ),

          // Кнопка расчета
          ElevatedButton(
            onPressed: () {
              double bmi = weight / ((height / 100) * (height / 100));
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Your BMI"),
                    content: Text(bmi.toStringAsFixed(1)),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text("Calculate BMI"),
          ),
        ],
      ),
    );
  }
}
