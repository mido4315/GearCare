import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/app_router.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/service_locator.dart';
import 'package:gear_care/core/utils/shared_preferences.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:gear_care/features/Authentication/sign_up/maintenance_sign_up_page/presentation/views/view%20model/complete_service_provider_cubit_cubit/complete_service_provider_data_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../../core/helper/custom_snack_bar.dart';
import '../../../../../../../widgets/upload_container_image.dart';

class MaintSignUpForm2 extends StatefulWidget {
  const MaintSignUpForm2({
    Key? key,
  }) : super(key: key);

  @override
  State<MaintSignUpForm2> createState() => _MaintSignUpForm2State();
}

class _MaintSignUpForm2State extends State<MaintSignUpForm2> {
  final List<String> specializations = [
    'Engine',
    'Cooling system (radiator)',
    'Break',
    'Suspension',
    'Exhaust',
    'Car electrician',
    'Car computer check'
  ];
  final List<String> carModels = [
    'Manuel',
    'Automatic',
    'Sedan',
    'SUV',
    'Hatchback',
    'Convertible',
    'Coupe',
    'Minivan',
    'Pickup Truck',
    'Crossover',
    'Electric Vehicle',
    'Luxury Car',
  ];

  String? specialization;
  String? model;

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

  void completeServiceProviderData() {
    BlocProvider.of<CompleteServiceProviderDataCubit>(context)
        .completeServiceProviderData(
      carTypeToRepair: model ?? '',
      specialization: [
        specialization ?? '',
      ],
      idImage: idPictureImage!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CompleteServiceProviderDataCubit,
        CompleteServiceProviderDataState>(
      listener: (context, state) {
        if (state is CompleteServiceProviderDataFailure) {
          customSnackBar(context, state.errorMessage);
        } else if (state is CompleteServiceProviderDataSuccess) {
          GoRouter.of(context).go(AppRouter.kServiceProvidersBottomNavBarView);
        }
      },
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: AppColors.kPrimaryGredientColor,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Form(
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
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () => getImage(ImageSource.gallery,
                          (image) => idPictureImage = image),
                      child: const UploadImageContainer(
                        text: 'Upload ID photo',
                      ),
                    ),
                    Center(
                      child: idPictureImage == null
                          ? const Text('No image selected.')
                          : Text(
                              '${idPictureImage?.path.split('/').last} Is selected'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    dropDownButton(
                      itemList: specializations,
                      selectedItem: specialization,
                      onChanged: (String? newValue) {
                        setState(() {
                          specialization = newValue;
                        });
                        print(specialization);
                      },
                      hintText: 'Select Specialization',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    dropDownButton(
                      itemList: carModels,
                      selectedItem: model,
                      onChanged: (String? newValue) {
                        setState(() {
                          model = newValue;
                        });
                        print(model);
                      },
                      hintText: 'Select Car Type To Repaire',
                    ),
                    SizedBox(
                      height: context.getHeight(givenHeight: 32),
                    ),
                    BlocBuilder<CompleteServiceProviderDataCubit,
                        CompleteServiceProviderDataState>(
                      builder: (context, state) {
                        if (state is CompleteServiceProviderDataLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            backgroundColor: AppColors.kPrimaryColor,
                          ),
                          onPressed: () {
                            if (model != null &&
                                specialization != null &&
                                idPictureImage != null) {
                              completeServiceProviderData();
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Validation Error'),
                                    content: const Text('Please Finish Form'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
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
                                style: Styles.textStyle24
                                    .copyWith(color: Colors.white),
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
          ),
        ),
      ),
    );
  }

  Container dropDownButton({
    required List<String> itemList,
    required String? selectedItem,
    required ValueChanged<String?> onChanged,
    required String hintText,
  }) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: DropdownButton<String>(
        value: selectedItem,
        hint: Text(
          hintText,
          style: Styles.textStyle24.copyWith(color: AppColors.kPrimaryColor),
        ),
        iconSize: 48,
        iconEnabledColor: AppColors.kPrimaryColor,
        isExpanded: true,
        underline: const SizedBox.shrink(),
        items: itemList.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style:
                  Styles.textStyle20.copyWith(color: AppColors.kPrimaryColor),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}