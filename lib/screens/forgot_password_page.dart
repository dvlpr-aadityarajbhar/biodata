import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 80), // Space from top
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/SVG.png', // SVG logo
                    height: 100,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Registered Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(23), // Rounded textbox
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your registered email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle OTP request logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF5507),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                minimumSize: const Size(280, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23),
                ),
              ),
              child: const Text('OTP in Email'),
            ),
          ],
        ),
      ),
    );
  }
}
