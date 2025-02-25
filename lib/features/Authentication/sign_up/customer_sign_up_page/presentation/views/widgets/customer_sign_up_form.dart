import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/constants/errors_messages.dart';
import 'package:gear_care/core/utils/app_router.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/constants/map_helper.dart';
import '../../../../../../../core/helper/custom_snack_bar.dart';
import '../../../../../../home_page/presentation/view model/home_view_cubit/home_view_cubit.dart';
import '../../view model/register cubit/register_cubit.dart';
import 'customer_sign_up_burtton.dart';
import 'other_services_sign_up_burtton.dart';

class CustSignUpForm extends StatefulWidget {
  const CustSignUpForm({
    super.key,
    required this.userType,
    required this.photo,
  });

  final String userType;
  final File? photo;

  @override
  State<CustSignUpForm> createState() => _CustSignUpFormState();

  void onNext() {}
}

class _CustSignUpFormState extends State<CustSignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String userName;
  late String email;
  late String password;
  late String careType;
  late String confirmPassword;
  late String phoneNumber;
  late String latitude;
  late String longitude;
  final List<String?> errors = [];

  String? _pickupLocation = 'Pickup Location';

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  final TextEditingController mapTextController =
      TextEditingController(text: 'Pickup Location');

  void userRegister() {
    String userTypeName;
    if (widget.userType == 'Customer') {
      userTypeName = 'Client';
    } else if (widget.userType == 'Winch') {
      userTypeName = 'WinchDriver';
    } else if (widget.userType == 'Merchant') {
      userTypeName = 'Seller';
    } else if (widget.userType == 'Mechanic') {
      userTypeName = 'Mechanic';
    } else {
      userTypeName = 'Electrician';
    }

    BlocProvider.of<RegisterCubit>(context).userRegister(
      name: name,
      phoneNumber: phoneNumber,
      email: email,
      location: mapTextController.text,
      username: userName,
      password: password,
      userType: userTypeName,
      photo: widget.photo,
      latitude: latitude,
      longitude: longitude,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 10),
          _buildInputField(
            hintText: 'name',
            onSaved: (newValue) => name = newValue!,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kNamelNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kNamelNullError);
                return kNamelNullError;
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          _buildInputField(
            hintText: 'username',
            onSaved: (newValue) => userName = newValue!,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kNamelNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kNamelNullError);
                return kNamelNullError;
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          _buildInputField(
            hintText: 'Email Address..',
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue!,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kEmailNullError);
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(error: kInvalidEmailError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kEmailNullError);
                return kEmailNullError;
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                addError(error: kInvalidEmailError);
                return kInvalidEmailError;
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          _buildInputField(
            hintText: 'Password',
            obscureText: true,
            onSaved: (newValue) => password = newValue!,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPassNullError);
              } else if (value.length >= 8) {
                removeError(error: kShortPassError);
              }
              password = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kPassNullError);
                return kPassNullError;
              } else if (value.length < 8) {
                addError(error: kShortPassError);
                return kShortPassError;
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          _buildInputField(
              hintText: 'Confirm Password',
              obscureText: true,
              onSaved: (newValue) => confirmPassword = newValue!,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  removeError(error: kPassNullError);
                } else if (value.isNotEmpty && password == confirmPassword) {
                  removeError(error: kMatchPassError);
                }
                confirmPassword = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  addError(error: kPassNullError);
                  return kPassNullError;
                } else if ((password != value)) {
                  addError(error: kMatchPassError);
                  return kMatchPassError;
                }
                return null;
              }),
          const SizedBox(height: 12),
          _buildInputField(
            hintText: 'Phone Number',
            keyboardType: TextInputType.phone,
            onSaved: (newValue) => phoneNumber = newValue!,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPhoneNumberNullError);
              }
              phoneNumber = value;
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kPhoneNumberNullError);
                return kPhoneNumberNullError;
              }
              return null;
            },
          ),
          const SizedBox(height: 12),

          mapTextButton(context),
          const SizedBox(height: 32),
          // handle different types of users____________________________________________________________________________________________________________________

          BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterFailure) {
                customSnackBar(context, state.errorMessage);
              } else if (state is RegisterSuccess) {
                customSnackBar(context, 'done');
                if (widget.userType == 'Customer') {
                  context.go(AppRouter.kHomeView);
                } else if (widget.userType == 'Winch') {
                  GoRouter.of(context).push(AppRouter.kwinchform2);
                } else if (widget.userType == 'Merchant') {
                  GoRouter.of(context).push(AppRouter.kMarchantForm2);
                } else {
                  GoRouter.of(context).push(AppRouter.kMaintForm2);
                }
              }
            },
            builder: (context, state) {
              if (widget.userType == 'Customer') {
                if (state is RegisterLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CustomerSignUpButton(
                  formKey: _formKey,
                  userRegister: userRegister,
                );
              } else {
                if (state is RegisterLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return OtherServicesSignUpButton(
                  formKey: _formKey,
                  userType: widget.userType,
                  userRegister: userRegister,
                );
              }
            },
          ),

          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Have An Account? ',
                style: GoogleFonts.akshar(
                  color: AppColors.kPrimaryColor,
                  fontSize: 20,
                ),
              ),
              GestureDetector(
                onTap: () => GoRouter.of(context).push(AppRouter.kSignIn),
                child: Text(
                  'Login',
                  style: GoogleFonts.akshar(
                    color: AppColors.kPrimaryColor,
                    decorationColor: AppColors.kPrimaryColor,
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }

  Widget mapTextButton(BuildContext context) {
    return TextField(
      controller: mapTextController,
      onTap: () async {
        setState(() {
          mapTextController.text = "Loading...";
        });
        List<String> address = await MapHelper.determinePosition();
        setState(() {
          mapTextController.text = address[0];
        });
        latitude = address[1];
        longitude = address[2];
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        prefixIcon: Icon(
          Icons.my_location,
          color: AppColors.kPrimaryColor.withOpacity(.3),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String hintText,
    TextInputType? keyboardType,
    bool obscureText = false,
    void Function(String?)? onSaved,
    required Function(String) onChanged,
    required String? Function(String?)? validator,
  }) {
    return TextFormField(
      onSaved: onSaved,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Styles.textStyle24,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: InputBorder.none,
        isDense: true,
        contentPadding: const EdgeInsets.only(top: 14, bottom: 14, left: 8),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}