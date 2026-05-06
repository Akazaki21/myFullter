import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> notes = [
      "Buy groceries",
      "Finish Flutter project",
      "Call client",
      "Study for exam",
      "Mag Jabol",
    ];

    return Stack(
      children: [
        // 📄 Notes list
        ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    notes[index],
                    style: GoogleFonts.inter(fontSize: 16),
                  ),
                ),
              ),
            );
          },
        ),

        // ➕ Fixed button
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              print("Add Note");
            },
            elevation: 3,
            child: const Icon(Icons.add,color: Colors.white,),
          ),
        ),
      ],
    );
  }
}