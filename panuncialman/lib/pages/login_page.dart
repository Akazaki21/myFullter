import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panuncialman/pages/display_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageWidgetState();
}
class _LoginPageWidgetState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

 void handleLogin() {
    print('Gi pindot ang Login');

    if (usernameController.text.isEmpty) {
      print('Username is empty');
      return;
    } else {
      print('Logging in as: ${usernameController.text}');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const DisplayPage(),
        ),
      );
    }
  }

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
                onPressed: handleLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF047DD8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Login',
                  style: GoogleFonts.inter(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
