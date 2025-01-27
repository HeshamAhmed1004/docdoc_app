import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/core/theming/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
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
                        "Dr. Hesham",
                        style: TextStyles.font18darkBlueBold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpacing(5),
                      Text(
                        "010 6611 3493",
                        style: TextStyles.font12GrayRegular,
                      ),
                      verticalSpacing(5),
                      Text(
                        "Heshamahmed1004@gmail.com",
                        style: TextStyles.font12GrayRegular,
                      ),

                    ]
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
