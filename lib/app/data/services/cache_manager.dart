import 'package:get_storage/get_storage.dart';
//Getstorage
mixin CacheManager {
  final box = GetStorage();

  Future<bool> saveGitDetailsData({
    String? GitDetails,
  }) async {
    await box.write(
        CacheManagerKey.GitDetails.toString(), GitDetails);
    return true;
  }
  String? getGitDetailsData() {
    return box.read(CacheManagerKey.GitDetails.toString());
  }
  Future<bool> saveGitDataSortByDate({
    String? GitDetails,
  }) async {
    await box.write(
        CacheManagerKey.IsGitDetailsSortBy.toString(), "IsGitDetailsSortByDate");
    await box.write(
        CacheManagerKey.GitDetailsSortByDate.toString(), GitDetails);
    return true;
  }
  String? getGitSortByDate() {
    return box.read(CacheManagerKey.GitDetailsSortByDate.toString());
  }
  String? IsgetGitSortBy() {
    return box.read(CacheManagerKey.IsGitDetailsSortBy.toString());
  }
  Future<bool> saveGitDataSortByStar({
    String? GitDetails,
  }) async {
    await box.write(
        CacheManagerKey.IsGitDetailsSortBy.toString(), "IsGitDetailsSortByStar");
    await box.write(
        CacheManagerKey.GitDetailsSortByStar.toString(), GitDetails);
    return true;
  }
  String? getGitSortByStar() {
    return box.read(CacheManagerKey.GitDetailsSortByStar.toString());
  }
}

enum CacheManagerKey {
  GitDetails,
  IsGitDetailsSortBy,
  GitDetailsSortByDate,
  GitDetailsSortByStar,
}
