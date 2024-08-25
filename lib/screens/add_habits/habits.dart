import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitat_app/datamodel/todocontroller.dart';
import 'package:iconsax/iconsax.dart';

class HabitDetailScreen extends StatelessWidget {
  const HabitDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Todocontroller());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Iconsax.notification))
        ],
        title: Text('Habit'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                'Create Custom Habit',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20), // Space between title and message
              // Motivational Message
              Text(
                'Every small step towards a new habit brings you closer to the best version of yourself.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20), // Space between message and next text
              // Question
              Text(
                'What do you want to do?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              // Text Field for Habit Name
              TextField(
                controller: controller.name,
                decoration: InputDecoration(
                  hintText: 'Enter your habit name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20), // Space between text field and icons
              // List of Icons (Placeholder for Icons)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.fitness_center),
                      Text('Fitness'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.fastfood),
                      Text('Diet'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.sixteen_mp),
                      Text('Meditation'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20), // Space between icons and description
              // Description Text
              Text(
                'Describe your habit',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              // Text Field for Description
              TextField(
                decoration: InputDecoration(
                  hintText: 'Describe your habit',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20), // Space between description and quantity
              // Quantity and Measurement Text
              Text(
                'Quantity and Measurement',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              // Text Field for Scope of Execution
              TextField(
                decoration: InputDecoration(
                  hintText: 'Scope of execution',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              // Text Field for Measurement (ml)
              TextField(
                controller: controller.number,
                decoration: InputDecoration(
                  hintText: 'Measurement (ml)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20), // Space between fields and duration
              // Duration Options
              Text(
                'Duration',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ChoiceChip(
                    label: Text('14 Days'),
                    selected: false,
                    onSelected: (selected) {
                      // Handle selection
                    },
                  ),
                  ChoiceChip(
                    label: Text('30 Days'),
                    selected: false,
                    onSelected: (selected) {
                      // Handle selection
                    },
                  ),
                  ChoiceChip(
                    label: Text('Custom'),
                    selected: false,
                    onSelected: (selected) {
                      // Handle selection
                    },
                  ),
                ],
              ),
              SizedBox(height: 20), // Space between duration and days
              // Days of the Week
              Text(
                'Days of the Week',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              // List of Days of the Week
              Wrap(
                spacing: 10,
                children: [
                  Chip(label: Text('Mon')),
                  Chip(label: Text('Tue')),
                  Chip(label: Text('Wed')),
                  Chip(label: Text('Thu')),
                  Chip(label: Text('Fri')),
                  Chip(label: Text('Sat')),
                  Chip(label: Text('Sun')),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      controller.addtodo();
                    },
                    child: const Text("Continue")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
