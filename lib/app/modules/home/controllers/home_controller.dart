import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/services/cache_manager.dart';
import '../../splash/get_git_repositories_model.dart';

class HomeController extends GetxController with CacheManager {
  var getGitData = "".obs;
  var getGitRepositories = GetGitRepositories().obs;

  loadGitDetailsData() {
    getGitData.value = getGitDetailsData()!;
    getGitRepositories.value =
        GetGitRepositories.fromJson(jsonDecode(getGitData.value));
    print("ANik-----> ${getGitRepositories.value.totalCount}");
  }
}
