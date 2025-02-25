import 'package:flutter/material.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../core/constants/app_colors.dart';
import '../features/profile_page/presentation/view/widgets/profile_card.dart';
import 'open_whats_app_button.dart';

class ChatButtons extends StatelessWidget {
  const ChatButtons({
    super.key,
    required this.number,
    required this.size,
    required this.height,
    required this.width,
  });

  final String number;
  final double size;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ChatButton(
          icon: Icons.call,
          onTap: () {
            launchUrlString("tel://$number");
          },
          size: size, height: height, width: width,
        ),
        ChatButton(

          icon: Icons.mail,
          onTap: () {
            openWhatsApp(number);
          },
          size: size, width: width, height: height,
        ),
      ],
    );
  }
}

class ChatButton extends StatelessWidget {
  const ChatButton(
      {super.key, required this.icon, required this.onTap, required this.size, required this.height, required this.width});

  final IconData? icon;
  final void Function()? onTap;
  final double size;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: GestureDetector(
          onTap: onTap,
          child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  color: AppColors.kPrimaryColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Icon(
                icon,
                weight: 5,
                color: Colors.white,
                size: size,
              ))),
    );
  }
}