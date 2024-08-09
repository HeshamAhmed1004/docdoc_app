import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/core/theming/styles.dart';
import 'package:docdoc_app/core/widgets/app_text_button.dart';
import 'package:docdoc_app/core/widgets/app_text_form_field.dart';
import 'package:docdoc_app/core/widgets/terms_and_conditions_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/already_have_account_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back", style: TextStyles.font24BlueBold),
                verticalSpacing(8),
                Text(
                  "We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.",
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpacing(36),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const AppTextFormField(
                        hintText: 'Email',
                      ),
                      verticalSpacing(20),
                      AppTextFormField(
                        hintText: 'Password',
                        isObscureText: isObscureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          child: Icon(
                            isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      verticalSpacing(24),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyles.font13BlueRegular,
                        ),
                      ),
                      verticalSpacing(40),
                      AppTextButton(textStyle: TextStyles.font16WhiteSemiBold, textButton: "Login"),
                      verticalSpacing(16),
                      TermsAndConditionsText(),
                      verticalSpacing(60),
                      const AlreadyHaveAccountText(),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
