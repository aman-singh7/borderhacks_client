import 'app_theme.dart';
import 'package:borderhacks_client/locator.dart';
import 'package:borderhacks_client/ui/view/landing_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 592),
      builder: () {
        //For easy navigation.
        return GetMaterialApp(
          title: 'MyApp',
          debugShowCheckedModeBanner: false,
          getPages: [
            GetPage(name: '/landing', page: () => LandingView()),
          ],
          initialRoute: '/landing',
          theme: ThemeData(
            fontFamily: 'OpenSans',
            backgroundColor: AppTheme.grey1,
            primaryColor: AppTheme.blue,
            textTheme: TextTheme(
              headline1: AppTheme.h1,
              headline2: AppTheme.h2,
              headline3: AppTheme.h3,
              headline4: AppTheme.h4,
              headline5: AppTheme.h5,
            ),
          ),
        );
      },
    );
  }
}
