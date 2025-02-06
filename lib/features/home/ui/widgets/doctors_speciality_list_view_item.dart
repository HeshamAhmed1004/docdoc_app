import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/core/theming/color.dart';
import 'package:docdoc_app/core/theming/styles.dart';
import 'package:docdoc_app/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorsSpecialityListViewItem extends StatelessWidget {
  const DoctorsSpecialityListViewItem(
      {super.key, required this.itemIndex, this.specializationData});

  final int itemIndex;
  final SpecializationData? specializationData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 80.h,
      margin: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: ColorsManger.lightBlue,
            child: SvgPicture.asset(
                height: 40.h,
                width: 40.w,
                "assets/svgs/general_speciality.svg"),
          ),
          verticalSpacing(8),
          Text(
            specializationData?.name ?? "Specialization",
            style: TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
