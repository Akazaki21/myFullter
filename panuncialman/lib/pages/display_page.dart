import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panuncialman/screens/note_screen.dart';
import 'package:panuncialman/screens/profile_screen.dart';
import 'package:panuncialman/screens/task_screen.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({super.key});

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  final TextEditingController searhBar = TextEditingController();

  final List<String> navigation = ["Notes", "Tasks", "Profile"];

  final List<Widget> screens = const [
    NoteScreen(),
    TaskScreen(),
    ProfileScreen(),
  ];

  int _currentIndex = 0;

  Widget handleHeadText() {
    return _currentIndex != 2
        ? Text(
            navigation[_currentIndex],
            style: GoogleFonts.inter(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          )
        : const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text(
          'What TO DO?',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),

      body: Column(
        children: [
          // Header (hidden on Profile)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: handleHeadText(),
            ),
          ),

          const SizedBox(height: 4),

          // Screen content
          Expanded(
            child: screens[_currentIndex],
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print("${navigation[index]} clicked");
          });
        },
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: List.generate(navigation.length, (index) {
          return BottomNavigationBarItem(
            icon: Icon(
              index == 0
                  ? Icons.note
                  : index == 1
                      ? Icons.task
                      : Icons.person,
            ),
            label: navigation[index],
          );
        }),
      ),
    );
  }
}