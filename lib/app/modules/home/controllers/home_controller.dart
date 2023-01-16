import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/services/cache_manager.dart';
import '../../splash/get_git_repositories_model.dart';

class HomeController extends GetxController with CacheManager {
  var getGitData = "".obs;
  var getGitRepositories = GetGitRepositories().obs;

  loadGitDetailsData() {
    getGitData.value = getGitDetailsData()!;
    getGitRepositories.value =
        GetGitRepositories.fromJson(jsonDecode(getGitData.value));
  }

  // dateformatter
  String dateformaterFuncDate({required String inputString}){
    final DateTime inputDateTime = DateTime.parse(inputString);
    final DateFormat formatter = DateFormat('MMMM dd yyyy hh:mm:ss aaa');
    final String formatted = formatter.format(inputDateTime);
    return formatted;
  }
}
