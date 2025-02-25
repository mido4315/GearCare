import 'package:flutter/material.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_router.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({
    super.key,
    required this.text,
    required this.index,
    required this.servicesLength,
    required this.routeName,
  });

  final String? text;
  final String? routeName;
  final int index;
  final int servicesLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () =>
              GoRouter.of(context).push(AppRouter.kCustSignUp, extra: text),
          //Navigator.pushNamed(context, pushname??CustSignUpPage.routName),
          child: Container(
            padding: const EdgeInsets.only(left: 16, top: 9),
            height: 52,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: index == 0
                    ? const Radius.circular(10)
                    : const Radius.circular(0),
                topRight: index == 0
                    ? const Radius.circular(10)
                    : const Radius.circular(0),
                bottomLeft: index == servicesLength
                    ? const Radius.circular(10)
                    : const Radius.circular(0),
                bottomRight: index == servicesLength
                    ? const Radius.circular(10)
                    : const Radius.circular(0),
              ),
            ),
            child: Text(
              text ?? '',
              style: Styles.textStyle24,
            ),
          ),
        ),
        const SizedBox(
          height: 1.5,
        )
      ],
    );
  }
}