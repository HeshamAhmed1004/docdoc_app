import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/core/theming/color.dart';
import 'package:docdoc_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation(
      {super.key,
      required this.hasLowerCase,
      required this.hasUpperCase,
      required this.hasNumber,
      required this.hasSpecialChar,
      required this.hasMinLength});

  final bool hasLowerCase;

  final bool hasUpperCase;

  final bool hasNumber;

  final bool hasSpecialChar;

  final bool hasMinLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow(hasLowerCase, 'At least 1 lowercase letter'),
        verticalSpacing(2),
        buildValidationRow(hasUpperCase, 'At least 1 uppercase letter'),
        verticalSpacing(2),

        buildValidationRow(hasNumber, 'At least 1 number'),
        verticalSpacing(2),

        buildValidationRow(hasSpecialChar, 'At least 1 special character'),
        verticalSpacing(2),

        buildValidationRow(hasMinLength, 'At least 8 characters'),
      ],
    );
  }

  Widget buildValidationRow(bool hasValidated, String text) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManger.gray,
        ),
        horizontalSpacing(6),
        Text(text,
            style: TextStyles.font13DarkBlueRegular.copyWith(
              color: hasValidated ? ColorsManger.gray : ColorsManger.darkBlue,
              decoration: hasValidated ? TextDecoration.lineThrough : null,
              decorationColor: Colors.green,
              decorationThickness: 2,
            )),
      ],
    );
  }
}
