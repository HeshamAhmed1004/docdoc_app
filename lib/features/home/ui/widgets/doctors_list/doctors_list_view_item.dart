import 'package:cached_network_image/cached_network_image.dart';
import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/core/theming/color.dart';
import 'package:docdoc_app/core/theming/styles.dart';
import 'package:docdoc_app/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DoctorsListViewItem extends StatelessWidget {
  const DoctorsListViewItem({super.key, this.doctorsModel});
  final Doctors? doctorsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl:
            "https://static.wikia.nocookie.net/five-world-war/images/6/64/Hisoka.jpg/revision/latest?cb=20190313114050",
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return Shimmer.fromColors(
                baseColor: ColorsManger.lightBlue,
                highlightColor: Colors.white,
                child: Container(
                  width: 110.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                ),
              );
            },
            imageBuilder: (context, imageProvider) => Container(
              width: 110.w,
              height: 120.h,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(12),
          //   child: Image(
          //     fit: BoxFit.cover,
          //     image: const AssetImage("assets/images/WhatsApp Imagenew.jpg"),
          //     height: 110.h,
          //     width: 110.w,
          //   ),
          // ),
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
