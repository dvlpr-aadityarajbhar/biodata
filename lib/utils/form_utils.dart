// File: lib/utils/form_utils.dart

import 'package:flutter/material.dart';

class FormUtils {
  static void showAddFieldDialog(BuildContext context, Function(String) onAdd) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController fieldNameController = TextEditingController();
        return AlertDialog(
          title: const Text('Add New Field'),
          content: TextFormField(
            controller: fieldNameController,
            decoration: const InputDecoration(hintText: 'Enter field name'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onAdd(fieldNameController.text);
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
