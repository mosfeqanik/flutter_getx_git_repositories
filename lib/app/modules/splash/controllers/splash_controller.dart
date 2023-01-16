import 'package:get/get.dart';

import '../../../data/services/cache_manager.dart';
import '../../../routes/app_pages.dart';
import '../providers/splash_provider.dart';

class SplashController extends GetxController with CacheManager {
  GetGitRepositoriesProvider provider = GetGitRepositoriesProvider();

  @override
  void onInit() {
    //splash Effect with delay
    Future.delayed(const Duration(seconds: 5), getGitRepositories);
    super.onInit();
  }

  getGitRepositories() async {
    //get saved git api response data
    var gitData = getGitDetailsData();
    //get saved git api response data null check and save Getstorage
    if (gitData == null) {
      final String responseBody = await provider.getGitRepositories();
      saveGitDetailsData(GitDetails: responseBody);
    }
    Get.offNamed(Routes.HOME);
  }
}
