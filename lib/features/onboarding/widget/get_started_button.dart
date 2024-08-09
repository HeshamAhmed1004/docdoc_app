import 'package:docdoc_app/core/helpers/extention.dart';
import 'package:docdoc_app/core/routing/routes.dart';
import 'package:docdoc_app/core/theming/color.dart';
import 'package:flutter/material.dart';
import '../../../core/theming/styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorsManger.mainBlue),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 52),
        ),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
        ),
      ),
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      child: Text(
        "Get Started",
        style: TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
