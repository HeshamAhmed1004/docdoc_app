import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/core/theming/color.dart';
import 'package:docdoc_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/models/specializations_response_model.dart';
import 'doctors_speciality_list_view_item.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  final List<SpecializationData?> specializationDataList;

  const DoctorsSpecialityListView(
      {super.key, required this.specializationDataList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        itemCount: specializationDataList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return DoctorsSpecialityListViewItem(
            itemIndex: index,
            specializationData: specializationDataList[index],
          );
        },
      ),
    );
  }
}
