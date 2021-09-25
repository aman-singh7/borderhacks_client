import 'package:borderhacks_client/ui/components/button/primary_button.dart';
import 'package:flutter/material.dart';

class LogInButton extends StatelessWidget {
  final VoidCallback onPress;
  const LogInButton(this.onPress, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PrimaryButton(
        text: 'Login',
        isFilled: true,
        press: onPress,
      ),
    );
  }
}
