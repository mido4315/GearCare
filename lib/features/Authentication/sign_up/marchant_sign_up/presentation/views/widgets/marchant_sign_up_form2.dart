import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/app_router.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:gear_care/features/Authentication/sign_up/marchant_sign_up/presentation/view%20model/complete_merchant_data_cubit/complete_merchant_data_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../../core/helper/custom_snack_bar.dart';
import '../../../../../../../widgets/upload_container_image.dart';

class MarchantSignUpForm2 extends StatefulWidget {
  const MarchantSignUpForm2({
    Key? key,
  }) : super(key: key);

  @override
  State<MarchantSignUpForm2> createState() => _MarchantSignUpFormState();
}

class _MarchantSignUpFormState extends State<MarchantSignUpForm2> {
  //File? shopImage;
  File? idPictureImage;
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

  void completeMerchantData() {
    BlocProvider.of<CompleteMerchantDataCubit>(context)
        .completeMerchantData(idImage: idPictureImage!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.kPrimaryGredientColor,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: context.getHeight(givenHeight: 32),
              ),
              const SizedBox(
                height: 12,
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () => getImage(
                    ImageSource.gallery, (image) => idPictureImage = image),
                child: const UploadImageContainer(
                  text: 'Upload your ID picture',
                ),
              ),
              Center(
                  child: idPictureImage == null
                      ? const Text('No image selected.')
                      : Text(
                          '${idPictureImage?.path.split('/').last} Is selected')),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: context.getHeight(givenHeight: 32),
              ),
              BlocConsumer<CompleteMerchantDataCubit,
                  CompleteMerchantDataState>(
                listener: (context, state) {
                  if (state is CompleteMerchantDataFailure) {
                    customSnackBar(context, state.errorMessage);
                  } else if (state is CompleteMerchantDataSuccess) {
                    GoRouter.of(context)
                        .go(AppRouter.kMerchantBottomNavBarView);
                  }
                },
                builder: (context, state) {
                  if (state is CompleteMerchantDataLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return GestureDetector(
                    onTap: () {
                      if (idPictureImage != null) {
                        completeMerchantData();
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Validation Error'),
                              content: const Text('Please Finish Form'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Container(
                      height: context.height * .055,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.kPrimaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          'Create My Account',
                          style:
                              Styles.textStyle24.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}