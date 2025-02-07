import 'package:docdoc_app/core/helpers/constant.dart';
import 'package:docdoc_app/core/helpers/extention.dart';
import 'package:docdoc_app/core/helpers/shared_pref_helper.dart';
import 'package:docdoc_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/dependency_injection.dart';
import 'docdoc_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  await checkIfUserIsLoggedIn();
  runApp(
    DocDocApp(
      appRouter: AppRouter(),
    ),
  );
}

checkIfUserIsLoggedIn() async {
  String? token=await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if(token.isNullOrEmpty() ){
    isLoggedIn = false;
  }else{
    isLoggedIn = true;
  }
}
