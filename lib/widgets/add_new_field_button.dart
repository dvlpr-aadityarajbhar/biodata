// File: lib/widgets/add_new_field_button.dart

import 'package:flutter/material.dart';

class AddNewFieldButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddNewFieldButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
        child: const Text('+ Add New Field'),
      ),
    );
  }
}
