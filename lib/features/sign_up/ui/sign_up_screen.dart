import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/core/theming/styles.dart';
import 'package:docdoc_app/core/widgets/app_text_button.dart';
import 'package:docdoc_app/core/widgets/terms_and_conditions_text.dart';
import 'package:docdoc_app/features/sign_up/logic/sign_up_cubit.dart';
import 'package:docdoc_app/features/sign_up/ui/widgets/already_have_account_text.dart';
import 'package:docdoc_app/features/sign_up/ui/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/sign_up_bloc_listener.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                Text("Create Account", style: TextStyles.font24BlueBold),
                verticalSpacing(8),
                Text(
                  "Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!",
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpacing(36),
                Column(
                  children: [
                    const SignupForm(),
                    verticalSpacing(20),
                    AppTextButton(
                      textStyle: TextStyles.font16WhiteSemiBold,
                      textButton: "Sign Up",
                      onPressed: () {
                        validateThenDoSignup(context);
                      },
                    ),
                    verticalSpacing(16),
                    const TermsAndConditionsText(),
                    verticalSpacing(20),
                    const AlreadyHaveAccountText(),
                    const SignupBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void validateThenDoSignup(BuildContext context) {
  if (context.read<SignupCubit>().formKey.currentState!.validate()) {
    context.read<SignupCubit>().emitSignupStates();
  }
}
