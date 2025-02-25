
import 'package:flutter/material.dart';

import 'widgets/sign_in_body.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);
    static String routName='CustomForm';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInBody(),
    );
  }
}