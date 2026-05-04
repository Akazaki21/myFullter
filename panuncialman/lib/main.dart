import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: const HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'What TO DO?',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF047DD8),
              ),
            ),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              width: 250,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  print('Gi pindot ang Login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF047DD8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Login',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}