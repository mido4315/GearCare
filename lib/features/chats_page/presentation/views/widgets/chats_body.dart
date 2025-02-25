import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/app_router.dart';
import 'package:gear_care/core/utils/assets.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:go_router/go_router.dart';

class ChatsBody extends StatelessWidget {
  const ChatsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(color: AppColors.kPrimaryColor.withOpacity(.5),),
        itemCount: 15,
        itemBuilder: (context,index) {
          return ElevatedButton(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
      ),
      onPressed: () {
        GoRouter.of(context).push(AppRouter.kChatPage);
      },
      child: Container(
    height: context.getHeight(givenHeight: 85),
    decoration: const BoxDecoration(
      color: Colors.white
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AssetData.accountImage2,
          height: context.getHeight(givenHeight: 70),
          width: context.getWidth(givenWidth: 70),
        ),
        const SizedBox(width: 8,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'sayed mohsen',
              style: Styles.textStyle24.copyWith(color: AppColors.kPrimaryColor),
            ),
            Text(
              'مشكلة عربيتك اية و مكانك فين دلوقتي',
              style: Styles.textStyle16.copyWith(color: AppColors.kPrimaryColor.withOpacity(.5)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    ),
      ),
    );
        }
      ),
    );
  }
}