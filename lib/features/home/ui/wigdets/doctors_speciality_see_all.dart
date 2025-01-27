import 'package:docdoc_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class DoctorsSpecialitySeeAll extends StatelessWidget {
  const DoctorsSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Doctor Speciality",
          style: TextStyles.font18darkBlueBold,
        ),
        const Spacer(),
        Text(
          "See all",
          style: TextStyles.font12BlueRegular,
        ),
      ],
    );
  }
}
