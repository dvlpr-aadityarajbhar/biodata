import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'TermsAndConditionsPage.dart';
import 'home_screen/home_page.dart';
import 'login_form.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _agreeToTerms = false;
  String? _mobileNumber, _email, _password;
  final String _verify = "Verify";
  bool _isLoading = false;

  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate() && _agreeToTerms) {
      _formKey.currentState!.save();

      setState(() {
        _isLoading = true;
      });

      final dio = Dio();
      const String apiUrl =
          "https://techfluxsolutions.com/royal_maratha/api/register";

      try {
        final response = await dio.post(
          apiUrl,
          data: {
            "phone": _mobileNumber,
            "email": _email,
            "password": _password,
            "cpass_status": _verify,
          },
          options: Options(
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
            },
            validateStatus: (status) => true,
          ),
        );

        if (response.statusCode == 200) {
          final responseData = response.data;
          if (responseData["response"] == true) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else {
            _showErrorDialog(
                responseData['error_msg'] ?? 'User Already exists.');
          }
        } else {
          _showErrorDialog(
              'Server error: ${response.statusCode}. ${response.statusMessage}');
        }
      } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionTimeout) {
          _showErrorDialog(
              'Connection timed out. Please check your internet connection and try again.');
        } else if (e.type == DioExceptionType.receiveTimeout) {
          _showErrorDialog(
              'Receive timeout. The server took too long to respond.');
        } else if (e.error is SocketException) {
          _showErrorDialog(
              'Network error. Please check your internet connection and try again.');
        } else {
          _showErrorDialog('An unexpected error occurred: ${e.message}');
        }
      } catch (e) {
        _showErrorDialog('User Already exists.');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Registration Error"),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text("Okay"),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 80),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/SVG.png',
                    height: 100,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              // Wrap the Form in an Expanded widget
              child: Form(
                key: _formKey,
                child: ListView(
                  // Keep using ListView for the form fields
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Mobile Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Mobile Number';
                        }
                        return null;
                      },
                      onSaved: (value) => _mobileNumber = value,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      onSaved: (value) => _email = value,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      obscureText: _obscureText,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters long';
                        }
                        return null;
                      },
                      onSaved: (value) => _password = value,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: _agreeToTerms,
                          onChanged: (bool? value) {
                            setState(
                              () {
                                _agreeToTerms = value!;
                              },
                            );
                          },
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: 'I have read and agree to the ',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14.0),
                              children: [
                                TextSpan(
                                  text: 'terms and conditions.',
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const TermsAndConditionsPage()),
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        // Add padding around the button
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: _isLoading ? null : _registerUser,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF5507),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                minimumSize: const Size(280, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23),
                ),
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Sign up'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginForm(
                      onLoginSuccess: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
              child: const Text(
                "Already have an account? Login",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
