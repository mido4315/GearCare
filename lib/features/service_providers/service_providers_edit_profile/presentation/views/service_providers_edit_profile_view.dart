import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/service_locator.dart';
import 'package:gear_care/core/utils/shared_preferences.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:gear_care/features/my_profile_page/presentation/view/widgets/edit_my_profile_background.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/errors_messages.dart';
import '../../../../../core/helper/custom_snack_bar.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../Authentication/sign_up/customer_sign_up_page/presentation/view model/register cubit/register_cubit.dart';

class ServiceProvidersEditProfileView extends StatefulWidget {
  const ServiceProvidersEditProfileView({super.key});

  @override
  State<ServiceProvidersEditProfileView> createState() => _ServiceProvidersEditProfileViewState();
}

class _ServiceProvidersEditProfileViewState extends State<ServiceProvidersEditProfileView> {
  final _formKey = GlobalKey<FormState>();
  late String name = getIt.get<SharedPrefs>().name ?? "";
  late String userName = getIt.get<SharedPrefs>().username ;
  late String email = getIt.get<SharedPrefs>().email;
  late String password ;
  late String confirmPassword;
  late String phoneNumber = getIt.get<SharedPrefs>().phoneNumber;
  late String location =getIt.get<SharedPrefs>().location;
  final List<String?> errors = [];

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

  void userUpdateProfile() {
    // BlocProvider.of<RegisterCubit>(context).userRegister(
    //   name: name,
    //   phoneNumber: phoneNumber,
    //   email: email,
    //   location: location,
    //   username: userName,
    //   password: password,
    //   userType: userTypeName,
    //   photo: widget.photo,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const EditProfileBackground(),
            SizedBox(
              height: context.getHeight(givenHeight: 24),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
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
                      initialValue: name,
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
                      }, initialValue: userName,
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
                      }, initialValue: email,
                    ),
                    // const SizedBox(height: 12),
                    // _buildInputField(
                    //   hintText: 'Password',
                    //   obscureText: true,
                    //   onSaved: (newValue) => password = newValue!,
                    //   onChanged: (value) {
                    //     if (value.isNotEmpty) {
                    //       removeError(error: kPassNullError);
                    //     } else if (value.length >= 8) {
                    //       removeError(error: kShortPassError);
                    //     }
                    //     password = value;
                    //   },
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       addError(error: kPassNullError);
                    //       return kPassNullError;
                    //     } else if (value.length < 8) {
                    //       addError(error: kShortPassError);
                    //       return kShortPassError;
                    //     }
                    //     return null;
                    //   }, initialValue: '',
                    // ),
                    // const SizedBox(height: 12),
                    // _buildInputField(
                    //     hintText: 'Confirm Password',
                    //     obscureText: true,
                    //     onSaved: (newValue) => confirmPassword = newValue!,
                    //     onChanged: (value) {
                    //       if (value.isNotEmpty) {
                    //         removeError(error: kPassNullError);
                    //       } else if (value.isNotEmpty &&
                    //           password == confirmPassword) {
                    //         removeError(error: kMatchPassError);
                    //       }
                    //       confirmPassword = value;
                    //     },
                    //     validator: (value) {
                    //       if (value!.isEmpty) {
                    //         addError(error: kPassNullError);
                    //         return kPassNullError;
                    //       } else if ((password != value)) {
                    //         addError(error: kMatchPassError);
                    //         return kMatchPassError;
                    //       }
                    //       return null;
                    //     }, initialValue: ''),
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
                      }, initialValue: phoneNumber,
                    ),
                    const SizedBox(height: 12),
                    _buildInputField(
                      hintText: 'Location',
                      onSaved: (newValue) => location = newValue!,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          removeError(error: kLocationNullError);
                        }
                        location = value;
                        return;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          addError(error: kLocationNullError);
                          return kLocationNullError;
                        }
                        return null;
                      }, initialValue: location,
                    ),
                    const SizedBox(height: 32),
                    // handle different types of users____________________________________________________________________________________________________________________

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
                          onTap: () =>
                              GoRouter.of(context).push(AppRouter.kSignIn),
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration inputDecorationMethod({required String text}) {
    return InputDecoration(
        border: const OutlineInputBorder(),
        labelText: text,
        labelStyle: Styles.textStyle24
            .copyWith(color: AppColors.kPrimaryColor.withOpacity(.5)),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.kPrimaryColor.withOpacity(.5))),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.kPrimaryColor.withOpacity(.5))));
  }
}

Widget _buildInputField({
  required String hintText,
  required String initialValue,
  TextInputType? keyboardType,
  bool obscureText = false,
  void Function(String?)? onSaved,
  required Function(String) onChanged,
  required String? Function(String?)? validator,
}) {
  return TextFormField(
    initialValue: initialValue,
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
        borderSide: const BorderSide(color: AppColors.kPrimaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}