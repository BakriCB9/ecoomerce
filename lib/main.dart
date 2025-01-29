import 'package:ecommerce/category/view/screen/Category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        splitScreenMode: true,
        designSize: const Size(720, 1640),
        builder: (context, _) {
          return const MaterialApp(
            home: HomeScreen(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
