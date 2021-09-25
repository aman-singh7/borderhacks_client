import 'package:borderhacks_client/ui/components/TextField/custom_text_field.dart';
import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField(
      {required TextEditingController usernameController, Key? key})
      : _usernameController = usernameController,
        super(key: key);

  final TextEditingController _usernameController;

  String? validateUsernameField(String? value) {
    if (value!.isEmpty) {
      return 'Required Field';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: _usernameController,
      label: 'Username',
      prefix: const Icon(Icons.person),
      hint: 'Enter the Username',
      validator: validateUsernameField,
    );
  }
}
