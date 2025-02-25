import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/features/chats_page/presentation/views/widgets/chats_body.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kPrimaryColor,
        toolbarHeight: context.getHeight(givenHeight: 80),
        elevation: 7,
          title: const Text(
            'Messages',
            style: TextStyle(color: Colors.white),
          ),
          leading: const Icon(
            Icons.chat,
            color: Colors.white,

          ),
        ),
        body: const ChatsBody());
  }
}