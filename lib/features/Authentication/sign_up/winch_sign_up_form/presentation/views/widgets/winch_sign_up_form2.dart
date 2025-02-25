import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/app_router.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../../widgets/custom_dropdown_button.dart';
import '../../../../../../../widgets/custom_multidropdown_button.dart';
import '../../../../../../../core/helper/custom_snack_bar.dart';
import '../../../../../../../widgets/upload_container_image.dart';
import '../../view model/complete_winch_data_cubit/complete_winch_data_cubit.dart';

class WinchSignUpForm2 extends StatefulWidget {
  const WinchSignUpForm2({
    Key? key,
  }) : super(key: key);

  @override
  State<WinchSignUpForm2> createState() => _WinchSignUpFormState();
}

class _WinchSignUpFormState extends State<WinchSignUpForm2> {
  final List<String> specializations = [
    'Heavy-Duty Winch Operators',
    'Tow Truck Operators',
    'Marine Winch Operators',
    'Off-Road and Recovery Specialists',
    'Construction and Crane Operators',
    'Logging Winch Operators',
    'Theatrical Winch Operators',
    'Industrial Maintenance Operators',
    'Rescue and Emergency Services',
    'Utility and Infrastructure Maintenance'
  ];
  final List<String> carModels = [
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

  List<String> selectedSpecializations = [];
  String? model;

  File? drivingLicenseImage;
  File? winchPhotoImage;
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

  void completeWinchData() {
    BlocProvider.of<CompleteWinchDataCubit>(context).completeWinchData(
      model: model ?? '',
      specialization: selectedSpecializations,
      licenceImage: drivingLicenseImage!,
      winchImage: winchPhotoImage!,
    );
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
                  GestureDetector(
                    onTap: () => getImage(ImageSource.gallery,
                        (image) => drivingLicenseImage = image),
                    child: const UploadImageContainer(
                      text: 'Upload driving license',
                    ),
                  ),
                  Center(
                    child: drivingLicenseImage == null
                        ? const Text('No image selected.')
                        : Text(
                            '${drivingLicenseImage?.path.split('/').last} Is selected'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () => getImage(ImageSource.gallery,
                        (image) => winchPhotoImage = image),
                    child: const UploadImageContainer(
                      text: 'Upload winch photo',
                    ),
                  ),
                  Center(
                    child: winchPhotoImage == null
                        ? const Text('No image selected.')
                        : Text(
                            '${winchPhotoImage?.path.split('/').last} Is selected'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomMultiDropDownButton(
                    itemList: specializations,
                    selectedItems: selectedSpecializations,
                    onChanged: (newValue) {
                      setState(() {
                        selectedSpecializations = newValue;
                      });
                    },
                    hintText: 'Select Specialization',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  customDropDownButton(
                    itemList: carModels,
                    selectedItem: model,
                    onChanged: (String? newValue) {
                      setState(() {
                        model = newValue;
                      });
                      print(model);
                    },
                    hintText: 'Select Winch Brand',
                  ),
                  SizedBox(
                    height: context.getHeight(givenHeight: 32),
                  ),
                  BlocConsumer<CompleteWinchDataCubit, CompleteWinchDataState>(
                    listener: (context, state) {
                      if (state is CompleteWinchDataFailure) {
                        customSnackBar(context, state.errorMessage);
                      } else if (state is CompleteWinchDataSuccess) {
                        GoRouter.of(context).go(AppRouter.kWinchBottomNavBarView);
                      }
                    },
                    builder: (context, state) {
                      if (state is CompleteWinchDataLoading) {
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
                          if (drivingLicenseImage != null &&
                              model != null &&
                              selectedSpecializations.isNotEmpty &&
                              winchPhotoImage != null) {
                            completeWinchData();
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Validation Error'),
                                  content:
                                      const Text('Please Finish The Form'),
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
    );
  }
}