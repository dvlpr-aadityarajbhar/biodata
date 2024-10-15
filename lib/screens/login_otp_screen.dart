import 'package:bio_data/consts/colors.dart';
import 'package:flutter/material.dart';

class LoginOtpScreen extends StatefulWidget {
  const LoginOtpScreen({super.key});

  @override
  _LoginOtpScreenState createState() => _LoginOtpScreenState();
}

class _LoginOtpScreenState extends State<LoginOtpScreen> {
  // Define a list of country codes
  final List<String> countryCodes = ['+91', '+1', '+44', '+61', '+971'];

  // Variable to store the selected country code
  String selectedCountryCode = '+91';

  // Create a TextEditingController for the mobile number field
  final TextEditingController mobileNumberController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 40,
                  color: AppColors.orangeColor,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Image.asset(
                  'assets/images/SVG.png',
                  height: 150,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 50,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Country Code",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        value: selectedCountryCode,
                        items: countryCodes.map((code) {
                          return DropdownMenuItem<String>(
                            value: code,
                            child: Text(code),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedCountryCode = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 50,
                      child: TextFormField(
                        controller:
                            mobileNumberController, // Attach the controller
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Mobile Number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              FilledButton(
                onPressed: () {
                  // Retrieve the text from the controller
                  String mobileNumber = mobileNumberController.text;
                  print("Selected Country Code: $selectedCountryCode");
                  print("Mobile Number: $mobileNumber");
                },
                style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: AppColors.orangeColor,
                ),
                child: Text("Send OTP"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
