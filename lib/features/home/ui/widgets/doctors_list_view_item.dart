import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/core/theming/styles.dart';
import 'package:docdoc_app/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListViewItem extends StatelessWidget {
  const DoctorsListViewItem({super.key, this.doctorsModel});
  final Doctors? doctorsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image(
              fit: BoxFit.cover,
              image: const AssetImage("assets/images/WhatsApp Imagenew.jpg"),
              height: 110.h,
              width: 110.w,
            ),
          ),
          horizontalSpacing(16),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorsModel?.name ?? "Name",
                    style: TextStyles.font18darkBlueBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpacing(5),
                  Text(
                    '${doctorsModel?.degree} | ${doctorsModel?.phone}',
                    style: TextStyles.font12GrayRegular,
                  ),
                  verticalSpacing(5),
                  Text(
                    doctorsModel?.email ?? 'Email',
                    style: TextStyles.font12GrayRegular,
                  ),

                ]
            ),
          )
        ],
      ),
    );
  }
}
