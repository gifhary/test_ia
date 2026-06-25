import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditCharDialog {
  static Future<void> show(
    BuildContext context, {
    required String currentText,
    required Function(String) onSave,
  }) {
    final TextEditingController textController = TextEditingController(
      text: currentText,
    );
    final formKey = GlobalKey<FormState>();

    return showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          title: const Text(
            "Edit Item",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF6A1B9A), // Theme color matching login/dashboard
            ),
          ),
          content: Form(
            key: formKey,
            child: TextFormField(
              controller: textController,
              decoration: InputDecoration(
                labelText: "Item Name",
                hintText: "Enter new text",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Item name cannot be empty';
                }
                return null;
              },
            ),
          ),
          actionsPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          actions: [
            // Cancel Button
            TextButton(
              onPressed: () => context.pop(),
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Save Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6A1B9A),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // Trigger the Cubit update method using the updated text string
                  onSave(textController.text);

                  // Close the dialog box
                  context.pop();
                }
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
