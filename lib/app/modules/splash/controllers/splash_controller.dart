import 'package:get/get.dart';

import '../../../data/services/cache_manager.dart';
import '../../../routes/app_pages.dart';
import '../providers/splash_provider.dart';

class SplashController extends GetxController with CacheManager {
  GetGitRepositoriesProvider provider = GetGitRepositoriesProvider();

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 5), getGitRepositories);
    super.onInit();
  }

  getGitRepositories() async {
    var gitData = getGitDetailsData();
    if (gitData == null) {
      final String responsebody = await provider.getGetGitRepositories();
      saveGitDetailsData(GitDetails: responsebody);
    }
    Get.offNamed(Routes.HOME);
  }
}
