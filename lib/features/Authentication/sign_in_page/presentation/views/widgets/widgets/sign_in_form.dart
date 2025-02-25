import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/constants/errors_messages.dart';
import 'package:gear_care/core/utils/app_router.dart';
import 'package:gear_care/core/utils/assets.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';

import 'package:go_router/go_router.dart';

import '../../../../../../../core/utils/service_locator.dart';
import '../../../../../../../core/helper/custom_snack_bar.dart';
import '../../../../../../../core/utils/shared_preferences.dart';
import '../../../../../data/repos/auth_repo/auth_repo_impl.dart';
import '../../../../../sign_up/customer_sign_up_page/presentation/views/customer_sign_up_page.dart';
import '../../../view model/login cubit/login_cubit.dart';
import 'login_divider.dart';
import 'logno_elevation_button.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }


  void userLogin() {
    print(email);
    print(password);
    BlocProvider.of<LoginCubit>(context).userLogin(
      username: email!,
      password: password!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          //email text field
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kEmailNullError);
                email = value;
              }
              // else if (emailValidatorRegExp.hasMatch(value)) {
              //   removeError(error: kInvalidEmailError);
              // }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kEmailNullError);
                return kEmailNullError;
              }
              // else if (!emailValidatorRegExp.hasMatch(value)) {
              //   addError(error: kInvalidEmailError);
              //   return kInvalidEmailError;
              // }
              return null;
            },
            decoration: inputDecorationMethod(text: 'User Name'),
          ),
          const SizedBox(
            height: 10,
          ),

          //password text field
          TextFormField(
              obscureText: true,
              onSaved: (newValue) => password = newValue,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  removeError(error: kPassNullError);
                }

                password = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  addError(error: kPassNullError);
                  return kPassNullError;
                }
                return null;
              },
              decoration: inputDecorationMethod(text: 'Password')),

          SizedBox(
            height: context.getHeight(givenHeight: 24),
          ),

          //log in button
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginFailure) {
                customSnackBar(context, state.errorMessage);
              } else if (state is LoginSuccess) {
                String? userType = getIt.get<SharedPrefs>().userType;
                if ( userType == 'Client') {
                  context.go(AppRouter.kHomeView);
                } else if(userType == "Seller"){
                  context.go(AppRouter.kMerchantBottomNavBarView);
                }else if(userType == "WinchDriver"){
                  context.go(AppRouter.kWinchBottomNavBarView);
                }else{
                  context.go(AppRouter.kServiceProvidersBottomNavBarView);
                }
              }
            },
            builder: (context, state) {
              if (state is LoginLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return LoginElevationButton(
                formKey: _formKey,
                errors: errors,
                userLogin: userLogin,
              );
            },
          ),
          //forget password textbutton
          TextButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kForgetPassword);
            },
            child: Text(
              'Forget your password?',
              style: Styles.textStyle20.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: AppColors.kPrimaryColor,
              ),
            ),
          ),

          //divider------
          const LogInDivider(),
          SizedBox(
            height: context.getHeight(givenHeight: 12),
          ),

          //another ways to login
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //apple
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AssetData.appleIcon,
                  width: context.getWidth(givenWidth: 60),
                ),
              ),
              //facebook
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AssetData.facebookIcon,
                  width: context.getWidth(givenWidth: 60),
                ),
              ),
              //google
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AssetData.googleIcon,
                  width: context.getWidth(givenWidth: 60),
                ),
              ),
            ],
          ),
          SizedBox(
            height: context.getHeight(givenHeight: 24),
          ),

          //sign up
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New Account? ',
                style: Styles.textStyle24.copyWith(
                    fontSize: 20,
                    color: AppColors.kPrimaryColor,
                    fontWeight: FontWeight.w500),
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, CustSignUpPage.routName),
                child: Text(
                  'Sign In',
                  style: Styles.textStyle20.copyWith(
                      color: AppColors.kPrimaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.kPrimaryColor,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  InputDecoration inputDecorationMethod({required text}) {
    return InputDecoration(
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10)),
      focusedErrorBorder: InputBorder.none,
      isDense: true,
      contentPadding: const EdgeInsets.only(top: 14, bottom: 14, left: 8),
      hintText: text,
      hintStyle: Styles.textStyle24,
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}