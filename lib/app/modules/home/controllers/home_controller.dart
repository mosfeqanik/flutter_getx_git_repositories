import 'dart:convert';

import 'package:flutter/cupertino.dart';
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
  var itemsList = <Items>[].obs;
  var ExampleitemsListsLength = 10.obs;
  var isLoading = false.obs;

  final scrollController = ScrollController();

  @override
  void onInit() async {
    loadGitDetailsData();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        if (ExampleitemsListsLength.value < itemsList.length) {
          isLoading.value = true;
          Future.delayed(const Duration(seconds: 3), fetchdataBypagination);
          isLoading.value = false;
        }
      }
    });
    super.onInit();
  }

  fetchdataBypagination() {
    ExampleitemsListsLength.value = ExampleitemsListsLength.value + 10;
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.dispose();
  }

  //Load data from Cache get storage
  loadGitDetailsData() {
    getGitData.value = getGitDetailsData()!;
    getGitDataSortByStar.value = getGitSortByStar() ?? "";
    getGitDataSortByDate.value = getGitSortByDate() ?? "";
    IsgetGitDataSortBy.value = IsgetGitSortBy() ?? "";
    if (IsgetGitDataSortBy.value == "IsGitDetailsSortByStar") {
      itemsList.value = parseItems(getGitDataSortByStar.value);
    } else if (IsgetGitDataSortBy.value == "IsGitDetailsSortByDate") {
      itemsList.value = parseItems(getGitDataSortByDate.value);
    } else {
      getGitRepositories.value =
          GetGitRepositories.fromJson(jsonDecode(getGitData.value));
      itemsList.value = getGitRepositories.value.items!;
    }
  }

  //sort by date
  sortByDate() {
    itemsList.sort((a, b) {
      return DateTime.parse(b.updatedAt!)
          .compareTo(DateTime.parse(a.updatedAt!));
    });
    String jsonItemList = jsonEncode(itemsList);
    saveGitDataSortByDate(GitDetails: jsonItemList);
  }

  // sort by star
  sortByStar() {
    itemsList.sort((a, b) {
      return b.stargazersCount!.compareTo(a.stargazersCount!);
    });
    String jsonItemList = jsonEncode(itemsList);
    saveGitDataSortByStar(GitDetails: jsonItemList);
  }

  // dateformatter
  String dateformaterFuncDate({required String inputString}) {
    final DateTime inputDateTime = DateTime.parse(inputString);
    final DateFormat formatter = DateFormat('MMMM dd yyyy hh:mm:ss aaa');
    final String formatted = formatter.format(inputDateTime);
    return formatted;
  }

  //convert json string to List of Items
  List<Items> parseItems(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Items>((json) => Items.fromJson(json)).toList();
  }
}
