import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';

import 'button_container.dart';

class LoginElevationButton extends StatelessWidget {
  const LoginElevationButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.errors,
    required this.userLogin,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final List<String?> errors;
  final Function() userLogin;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            backgroundColor: AppColors.kPrimaryColor),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            userLogin();
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Validation Error'),
                  content: Text(errors.join(", ")),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        },
        child: const ButtonContainer());
  }
}