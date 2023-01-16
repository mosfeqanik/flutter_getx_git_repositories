import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/AllStrings.dart';

void main() async{
  //Getstorage initialize
  await GetStorage.init();
  //widget root initialize
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      const GetRepositories()
  );
}
class GetRepositories extends StatelessWidget {
  const GetRepositories({Key? key}) : super(key: key);
  //this widget is the root of the app
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, c) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AllStrings.AppTittle,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      }
    );
  }
}
