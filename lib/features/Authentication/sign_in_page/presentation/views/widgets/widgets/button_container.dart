import 'package:flutter/material.dart';
import 'package:gear_care/core/utils/styles.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      width: double.infinity,
      child: Center(
        child: Text(
          'Login',
          style: Styles.textStyle24.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}