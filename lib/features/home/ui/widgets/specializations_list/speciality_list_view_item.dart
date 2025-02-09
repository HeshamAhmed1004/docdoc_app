import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/core/theming/color.dart';
import 'package:docdoc_app/core/theming/styles.dart';
import 'package:docdoc_app/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpecialityListViewItem extends StatelessWidget {
  const SpecialityListViewItem(
      {super.key,
      required this.itemIndex,
      this.specializationData,
      required this.selectedIndex});

  final int itemIndex;
  final SpecializationData? specializationData;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        children: [
          itemIndex == selectedIndex
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorsManger.darkBlue,
                      width: 1.5,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: ColorsManger.lightBlue,
                    child: SvgPicture.asset(
                        height: 42.h,
                        width: 42.w,
                        "assets/svgs/general_speciality.svg"),
                  ),
                )
              : CircleAvatar(
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
            style: itemIndex == selectedIndex
                ? TextStyles.font14DarkBlueBold
                : TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
