import 'package:get/get.dart';

import '../../../utils/API_Endpoints.dart';

class GetGitRepositoriesProvider extends GetConnect {
  Future<String> getGetGitRepositories() async {
    final response = await get(APIs.getFlutterRepoUrl);
    if (response.status.hasError) {
      return Future.error(response.bodyString!);
    } else {
      return response.bodyString!;
    }
  }
}
