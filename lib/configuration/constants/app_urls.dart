class AppUrls {
  /// this is the base url of the api
  static const String baseUrl =
      "https://ihunjobfindebackend-production.up.railway.app/api";

  // api for getting list of all jobs
  static const String allProducts = "/job/";
  static const String searchProduct = "/job/search/";
  static const String productById = "/job/find/";

  // for authentication and getting user info
  static const String logIn = "/login";
  static const String register = "/register";
  static const String getUserById = "/user/find/";
}
