import 'package:get/get.dart';

import '../../../utils/API_Endpoints.dart';
//api HIT
class GetGitRepositoriesProvider extends GetConnect {
  Future<String> getGitRepositories() async {
    final response = await get(APIs.getFlutterRepoUrl);
    if (response.status.hasError) {
      return Future.error(response.bodyString!);
    } else {
      return response.bodyString!;
    }
  }
}
