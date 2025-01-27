import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

import 'wigdets/doctor_blue_container.dart';
import 'wigdets/doctors_list_view.dart';
import 'wigdets/doctors_speciality_list_view.dart';
import 'wigdets/doctors_speciality_see_all.dart';
import 'wigdets/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(
            20.0,
            16.0,
            20.0,
            28.0,
          ),
          width: double.infinity,
          child:   Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorBlueContainer(),
              verticalSpacing(24),
              const DoctorsSpecialitySeeAll(),
              verticalSpacing(16),
              const DoctorsSpecialityListView(),
              verticalSpacing(8),
              const DoctorsListView(),

            ],
          ),
        ),
      ),
    );
  }
}
