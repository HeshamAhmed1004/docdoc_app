
import 'package:docdoc_app/core/routing/app_router.dart';
import 'package:docdoc_app/core/routing/routes.dart';
import 'package:docdoc_app/core/theming/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocDocApp extends StatelessWidget {
  const DocDocApp({super.key, required this.appRouter});
final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return   ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: "DocDoc App",
        theme: ThemeData(
          primaryColor: ColorsManger.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
