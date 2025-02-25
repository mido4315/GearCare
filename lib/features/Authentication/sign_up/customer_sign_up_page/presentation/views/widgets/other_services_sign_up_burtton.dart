import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherServicesSignUpButton extends StatelessWidget {
  const OtherServicesSignUpButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.userType,
    required this.userRegister,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final String userType;
  final Function() userRegister;

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
          _formKey.currentState!.save();
          userRegister();
        } else {
          // if (userType == 'Winch') {
          //   GoRouter.of(context).push(AppRouter.kwinchform2);
          // } else if (userType == 'Merchant') {
          //   GoRouter.of(context).push(AppRouter.kMarchantForm2);
          // } else {
          //   GoRouter.of(context).push(AppRouter.kMaintForm2);
          // }
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Validation Error'),
                content: const Text("Please Finish The Form"),
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
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            'Next',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}