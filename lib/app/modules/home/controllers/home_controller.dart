import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/services/cache_manager.dart';
import '../../splash/get_git_repositories_model.dart';

class HomeController extends GetxController with CacheManager {
  var getGitData = "".obs;
  var getGitDataSortByDate = "".obs;
  var IsgetGitDataSortBy = "".obs;
  var getGitDataSortByStar = "".obs;
  var getGitRepositories = GetGitRepositories().obs;
  var itemsList =<Items>[].obs;

  loadGitDetailsData() {
    getGitData.value = getGitDetailsData()!;
    getGitDataSortByStar.value = getGitSortByStar()??"";
    getGitDataSortByDate.value = getGitSortByDate()??"";

    IsgetGitDataSortBy.value = IsgetGitSortBy()??"";
    if(IsgetGitDataSortBy.value=="IsGitDetailsSortByStar"){
      itemsList.value =  parseItems(getGitDataSortByStar.value);
    }else if(IsgetGitDataSortBy.value=="IsGitDetailsSortByDate"){
      itemsList.value =  parseItems(getGitDataSortByDate.value);
    }else{
      getGitRepositories.value = GetGitRepositories.fromJson(jsonDecode(getGitData.value));
      itemsList.value= getGitRepositories.value.items!;
    }



  }
  sortByDate(){
    itemsList.sort((a, b){
      return DateTime.parse(b.updatedAt!).compareTo(DateTime.parse(a.updatedAt!));
    });
    String jsonItemList = jsonEncode(itemsList);
    saveGitDataSortByDate(GitDetails: jsonItemList);
  }
  sortByStar(){
    itemsList.sort((a, b){
      return b.stargazersCount!.compareTo(a.stargazersCount!);
    });
    String jsonItemList = jsonEncode(itemsList);
    saveGitDataSortByStar(GitDetails: jsonItemList);
  }
  
  // dateformatter
  String dateformaterFuncDate({required String inputString}){
    final DateTime inputDateTime = DateTime.parse(inputString);
    final DateFormat formatter = DateFormat('MMMM dd yyyy hh:mm:ss aaa');
    final String formatted = formatter.format(inputDateTime);
    return formatted;
  }

  List<Items> parseItems(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Items>((json) => Items.fromJson(json)).toList();
  }
}
