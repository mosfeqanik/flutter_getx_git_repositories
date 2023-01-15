

class APIs {
  APIs._();
  // https://api.github.com/search/repositories?q={Flutter}{&page,per_page,sort,order}
  static const String baseUrl = "https://api.github.com/search/repositories";
  static const String getFlutterRepoUrl = "$baseUrl?q={Flutter}{&page,per_page,sort,order}";
}
