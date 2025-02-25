import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/assets.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:image_picker/image_picker.dart';

import 'customer_sign_up_form.dart';

class CustSignUpBody extends StatefulWidget {
  const CustSignUpBody({Key? key, required this.userType}) : super(key: key);

  final String userType;

  @override
  State<CustSignUpBody> createState() => _CustSignUpBodyState();
}

class _CustSignUpBodyState extends State<CustSignUpBody> {
  File? profileImage;
  final picker = ImagePicker();

  Future getImage(ImageSource source, Function(File?) setImage) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        setImage(File(pickedFile.path));
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppColors.kPrimaryGredientColor,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Column(
            children: [
              _buildProfileImage(context),
              SizedBox(
                height: context.getHeight(givenHeight: 32),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: CustSignUpForm(
                    userType: widget.userType, photo: profileImage,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return GestureDetector(
      onTap: () => getImage(ImageSource.gallery, (image) {
        setState(() {
          profileImage = image;
        });
      }),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (profileImage != null)
            CircleAvatar(
              radius: 50,
              backgroundImage: FileImage(profileImage!),
            )
          else
            SvgPicture.asset(
              AssetData.brofileCustomImage,
              height: context.getHeight(givenHeight: 100),
              width: context.getWidth(givenWidth: 100),
            ),
          Positioned(
            top: context.getHeight(givenHeight: 60),
            left: context.getWidth(givenWidth: 60),
            child: IconButton(
              onPressed: () => getImage(ImageSource.gallery, (image) {
                setState(() {
                  profileImage = image;
                });
              }),
              icon: Image.asset(
                AssetData.signUpIcon,
                height: context.height * 0.04,
              ),
            ),
          ),
        ],
      ),
    );
  }
}