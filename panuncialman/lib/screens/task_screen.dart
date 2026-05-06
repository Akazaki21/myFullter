import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 📄 Task content
        const Center(
          child: Text("Task Screen"),
        ),

        // ➕ Fixed button
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              print("Add Task");
            },
            elevation: 3,
            child: const Icon(Icons.add,color: Colors.white,),
          ),
        ),
      ],
    );
  }
}