import 'package:flutter/material.dart';
import 'package:panuncialman/pages/login_page.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return Stack(
      children: [
        // 📄 Task content
        const Center(
          child: Text("Profile Screen"),
        ),

        // ➕ Fixed button
       Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton.extended(
            backgroundColor: Colors.blue,
            onPressed: () {
              print("Logout");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            elevation: 3,
            icon: const Icon(Icons.logout, color: Colors.white),
            label: const Text(
              "Logout",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}