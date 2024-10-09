// File: lib/widgets/save_button.dart

import 'package:flutter/material.dart';

import '../screens/AppTheme.dart';

class SaveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SaveButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: onPressed,
        child: const Text('Save', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
