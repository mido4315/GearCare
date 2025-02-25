import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class WinchSignUpFormNextButton extends StatelessWidget {
  const WinchSignUpFormNextButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.widget,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final WinchSignUpForm widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          //widget.onNext();
    
        } else {
          //widget.onNext();
    
          // showDialog(
          //   context: context,
          //   builder: (BuildContext context) {
          //     return AlertDialog(
          //       title: const Text('Validation Error'),
          //       content: const Text("Please Finish The Form" ),
          //       actions: <Widget>[
          //         TextButton(
          //           onPressed: () => Navigator.of(context).pop(),
          //           child: const Text('OK'),
          //         ),
          //       ],
          //     );
          //   },
          // );
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .055,
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

class WinchSignUpForm {
}
