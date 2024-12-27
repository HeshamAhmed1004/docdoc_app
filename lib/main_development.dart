import 'package:docdoc_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/dependency_injection.dart';
import 'docdoc_app.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  setupGetIt();

  runApp(
    DocDocApp(
      appRouter: AppRouter(),
    ),
  );
}
