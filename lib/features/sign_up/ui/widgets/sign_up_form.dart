import 'package:docdoc_app/core/helpers/app_regex.dart';
import 'package:docdoc_app/features/login/logic/login_cubit.dart';
import 'package:docdoc_app/features/login/ui/widgets/password_validation.dart';
import 'package:docdoc_app/features/sign_up/logic/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialChar = false;
  bool hasMinLength = false;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    passwordController = context.read<SignupCubit>().passwordController;
    setupPasswordControllerListener();
  }
  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasSpecialChar = AppRegex.hasSpecialCharacter(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<SignupCubit>().formKey,
        child: Column(
          children: [
            AppTextFormField(
              controller: context.read<SignupCubit>().nameController,
              hintText: 'Name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Name';
                }
              },
            ),
            verticalSpacing(20),
            AppTextFormField(
              controller: context.read<SignupCubit>().phoneController,
              hintText: 'Phone Number',
              validator: (value) {
                if (value == null || value.isEmpty || !AppRegex.isPhoneNumberValid(value)) {
                  return 'Please enter your phone number';
                }
              },
            ),
            verticalSpacing(20),
            AppTextFormField(
              controller: context.read<SignupCubit>().emailController,
              hintText: 'Email',
              validator: (value) {
                if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                  return 'Please enter your email';
                }
              },
            ),
            verticalSpacing(20),
            AppTextFormField(
              controller: context.read<SignupCubit>().passwordController,
              hintText: 'Password',
              isObscureText: isObscureText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(
                        () {
                      isObscureText = !isObscureText;
                    },
                  );
                },
                child: Icon(
                  isObscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid password';
                }
              },
            ),
            verticalSpacing(24),
            AppTextFormField(
              controller: context.read<SignupCubit>().passwordConfirmationController,
              hintText: 'Password confirmation',
              isObscureText: isPasswordConfirmationObscureText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(
                        () {
                          isPasswordConfirmationObscureText = !isPasswordConfirmationObscureText;
                    },
                  );
                },
                child: Icon(
                  isPasswordConfirmationObscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid password';
                }
              },
            ),
            verticalSpacing(24),
            PasswordValidation(
              hasLowerCase:hasLowerCase,
              hasUpperCase:hasUpperCase,
              hasNumber:hasNumber,
              hasSpecialChar:hasSpecialChar,
              hasMinLength:hasMinLength,
            ),
          ],
        ));

  }
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
