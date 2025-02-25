import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:gear_care/features/my_profile_page/presentation/view/widgets/edit_my_profile_background.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const EditProfileBackground(),
            SizedBox(
              height: context.getHeight(givenHeight: 24),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                child: Column(
                  children: [
                    SizedBox(
                      height: context.getHeight(givenHeight: 12),
                    ),
                    TextField(
                      decoration: inputDecorationMethod(text: 'Car Type'),
                    ),
                    SizedBox(
                      height: context.getHeight(givenHeight: 12),
                    ),
                    TextField(
                      decoration: inputDecorationMethod(text: 'Email'),
                    ),
                    SizedBox(
                      height: context.getHeight(givenHeight: 12),
                    ),
                    TextField(
                      decoration: inputDecorationMethod(text: 'Phone Number'),
                    ),
                    SizedBox(
                      height: context.getHeight(givenHeight: 12),
                    ),
                    TextField(
                      decoration: inputDecorationMethod(text: 'Date Of Birth'),
                    ),
                    SizedBox(
                      height: context.getHeight(givenHeight: 12),
                    ),
                    TextField(
                      decoration: inputDecorationMethod(text: 'Location'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration inputDecorationMethod({required String text}) {
    return InputDecoration(
        prefix: const SizedBox(
          width: 5,
        ),
        hintText: text,
        hintStyle: Styles.textStyle24
            .copyWith(color: AppColors.kPrimaryColor.withOpacity(.5)),
        enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.kPrimaryColor.withOpacity(.5))),
        focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.kPrimaryColor.withOpacity(.5))));
  }
}
