import 'dart:convert';
import 'dart:developer';

import 'package:bio_data/screens/login_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'forgot_password_page.dart';
import 'home_screen/home_page.dart';
import 'signup_form.dart';

class LoginForm extends StatefulWidget {
  final Function onLoginSuccess;
  const LoginForm({super.key, required this.onLoginSuccess});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _isLoading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // void _login() async {
  //   if (_formKey.currentState!.validate()) {
  //     setState(() {
  //       _isLoading = true;
  //     });

  //     final String email = _emailController.text.trim();
  //     final String password = _passwordController.text.trim();

  //     try {
  //       const String apiUrl =
  //           'https://techfluxsolutions.com/royal_maratha/api/login';

  //       final response = await http.post(
  //         // print();
  //         // return;
  //         Uri.parse(apiUrl),
  //         body: {
  //           'email': email,
  //           'password': password,
  //         },
  //       );

  //       print('Response status: ${response.statusCode}');
  //       print('Response body: ${response.body}');

  //       var data = jsonDecode(response.body);
  //       if (data["response"] == true) {
  //         var tokenKey = data["data"]["token"];
  //         var matriId = data["data"]["matri_id"];

  //         final SharedPreferences prefs = await SharedPreferences.getInstance();
  //         await prefs.setString('token_key', tokenKey);
  //         await prefs.setString('matri_id', matriId);
  //         await prefs.setString('biodata_id', "");
  //         await prefs.setBool('isLoggedIn', true);
  //         log(matriId);
  //         log("Login Successfully");
  //         widget.onLoginSuccess();
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(builder: (context) => HomePage()),
  //         );
  //       } else {
  //         _showErrorDialog(data["error_msg"]);
  //         log("Login Failed");
  //       }
  //     } catch (e) {
  //       log(e.toString());
  //       _showErrorDialog("Server side error.");
  //     } finally {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     }
  //   }
  // }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();

      try {
        const String apiUrl =
            'https://techfluxsolutions.com/royal_maratha/api/login';

        final response = await http.post(
          Uri.parse(apiUrl),
          body: {
            'email_or_phone': email,
            'password': password,
          },
        );

        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        var data = jsonDecode(response.body);
        if (data["response"] == true) {
          var tokenKey = data["data"]["token"];
          var matriId = data["data"]["matri_id"];

          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token_key', tokenKey);
          await prefs.setString('matri_id', matriId);
          await prefs.setString('biodata_id', "");
          await prefs.setBool('isLoggedIn', true);

          log(matriId);
          log("Login Successfully");

          widget.onLoginSuccess();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          // Handling error_msg when it's a Map
          var errorMsg = data["error_msg"];
          if (errorMsg is Map) {
            // Extract the message from the map (e.g., "email_or_phone" field)
            String errorMessage = errorMsg.values.first.join(", ");
            _showErrorDialog(errorMessage);
          } else {
            _showErrorDialog(errorMsg.toString());
          }
          log("Login Failed");
        }
      } catch (e) {
        log(e.toString());
        _showErrorDialog("Server side error.");
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
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
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
                      'Login',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Use a SizedBox to provide height constraints to the ListView
              SizedBox(
                height: 200, // Provide a fixed height here or make it dynamic
                child: Form(
                  key: _formKey,
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email or Mobile no.',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email or mobile number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        obscureText: _obscurePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPasswordPage()));
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _isLoading ? null : _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5507),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  minimumSize: const Size(double.infinity, 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
                child: _isLoading
                    ? SizedBox(
                        height: 30,
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          // fontSize: 18,
                        ),
                      ),
              ),
              const SizedBox(height: 10),
              Text(
                "OR",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginOtpScreen();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5507),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  minimumSize: const Size(double.infinity, 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
                child: const Text(
                  'Login with OTP',
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              FilledButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5507),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  minimumSize: const Size(double.infinity, 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupForm()),
                  );
                },
                child: const Text(
                  'New User? Sign up',
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
