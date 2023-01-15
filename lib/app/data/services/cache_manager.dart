import 'package:get_storage/get_storage.dart';

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
}

enum CacheManagerKey {
  GitDetails,
}
