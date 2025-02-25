import 'package:flutter/material.dart';
import 'package:gear_care/features/my_profile_page/presentation/view/widgets/my_profile_background.dart';
import 'package:gear_care/features/my_profile_page/presentation/view/widgets/my_profile_info.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileBackground(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2,
                  ),
                  MyProfileInfo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}