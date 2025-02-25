import 'package:flutter/material.dart';

import 'widgets/customer_sign_up_body.dart';

class CustSignUpPage extends StatelessWidget {
  const CustSignUpPage({Key? key, required this.userType}) : super(key: key);
  static String routName = 'CustSignUpPage';

  final String userType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustSignUpBody(
        userType: userType,
      ),
    );
  }
}