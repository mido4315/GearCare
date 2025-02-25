// import 'package:flutter/material.dart';




const kAnimationDuration = Duration(milliseconds: 200);



const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kECarTypeNullError = "Please Enter your car type";
const String kELocationNullError = "Please Enter your location";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kSpecializationNullError = "Please Enter your specialization";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

const String kLocationNullError = "Please Enter your Location";

// final otpInputDecoration = InputDecoration(
//   contentPadding: const EdgeInsets.symmetric(vertical: 16),
//   border: outlineInputBorder(),
//   focusedBorder: outlineInputBorder(),
//   enabledBorder: outlineInputBorder(),
// );

// OutlineInputBorder outlineInputBorder() {
//   return OutlineInputBorder(
//     borderRadius: BorderRadius.circular(16),
//     borderSide: const BorderSide(color: kTextColor),
//   );
//}