import 'package:flutter/material.dart';
import 'package:gear_care/core/utils/app_router.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/features/splash_view/presentation/views/widgets/custum_button.dart';

class SplashButtons extends StatelessWidget {
  const SplashButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomButton(text: 'Sign IN',route: AppRouter.kSignIn,),
        SizedBox(height: context.getHeight(givenHeight: 25),),
        const CustomButton(text: 'SIGN UP',route: AppRouter.kIdentifyService,),
          
      ],
    );
  }
}


