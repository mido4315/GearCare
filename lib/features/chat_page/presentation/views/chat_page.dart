import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:go_router/go_router.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        toolbarHeight: context.getHeight(givenHeight: 80),
        elevation: 7,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Icon(Icons.arrow_back,color: Colors.white,size: context.getHeight(givenHeight: 30),),
        ),
        title: Text('Sayed Mohsen',style: Styles.textStyle26normal
              .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
      ),),
      body: const ChatBody(),
    );
  }
}
class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
