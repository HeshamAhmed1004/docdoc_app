import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/features/home/ui/widgets/doctors_list/doctors_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'widgets/doctor_blue_container.dart';
import 'widgets/doctors_speciality_see_all.dart';
import 'widgets/home_top_bar.dart';
import 'widgets/specializations_list/specializations_bloc_builder.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorBlueContainer(),
              verticalSpacing(24),
              const DoctorsSpecialitySeeAll(),
              verticalSpacing(16),
              const SpecializationsBlocBuilder(),
              verticalSpacing(8),
              const DoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}


