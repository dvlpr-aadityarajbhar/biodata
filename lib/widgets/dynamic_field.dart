// File: lib/widgets/dynamic_field.dart

import 'package:flutter/material.dart';

import '../screens/AppTheme.dart';

class DynamicField extends StatelessWidget {
  final Map<String, dynamic> field;

  const DynamicField({Key? key, required this.field}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: field['controller'],
            decoration: InputDecoration(
              labelText: field['label'],
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.unfold_more, color: AppTheme.primaryColor),
          onPressed: () {
            // Implement reordering logic here
          },
        ),
        IconButton(
          icon: const Icon(Icons.delete, color: AppTheme.primaryColor),
          onPressed: () {
            // Implement delete logic here
          },
        ),
      ],
    );
  }
}
