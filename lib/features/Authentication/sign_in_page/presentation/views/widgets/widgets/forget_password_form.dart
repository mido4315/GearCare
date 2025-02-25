import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/constants/errors_messages.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
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
              decoration: InputDecoration(
                errorBorder: const OutlineInputBorder(
                  
                    borderSide: BorderSide(
                      
                      color: AppColors.kPrimaryColor,
                    ),
                    ),
                focusedErrorBorder: InputBorder.none,
                isDense: true,
                contentPadding:
                    const EdgeInsets.only(top: 14, bottom: 14, left: 8),
                hintText: 'Email Address..',
                hintStyle: Styles.textStyle24.copyWith(color: AppColors.kPrimaryColor.withOpacity(.5)),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    style: BorderStyle.solid,
                    color: AppColors.kPrimaryColor,
                  ),
                  
                  
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.kPrimaryColor,
                    ),
                    ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
      
            //password text field
      
            SizedBox(
              height: context.getHeight(givenHeight: 36),
            ),
      
            //log in putton
            GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Validation Error'),
                        content: Text(errors.join(", ")),
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
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                    child: Text(
                  'Submit',
                  style: Styles.textStyle24.copyWith(color: Colors.white),
                )),
              ),
            ),
      
          ],
        ),
      ),
    );
  }
}
