import 'package:flutter_getx_git_repositories/app/modules/splash/controllers/splash_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  test('api data/cache data added Successfully', () {
    final splashController = SplashController();
    splashController.getGitDetailsData();
    expect(splashController.isLoading, false.obs);
  });
}
