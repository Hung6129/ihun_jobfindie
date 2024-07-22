class AppUrls {
  /// this is the base url of the api
  // static const String baseUrl = "https://ihunjobfindebackend-production.up.railway.app";

  /// this is for local host testing
  static const String baseUrl = "http://localhost:3000/api";

  // api for getting list of all jobs
  static const String allJobs = "/job?page=1&limit=10";
  static String jobById(String jobId) => "/job/find/$jobId";
  static const String trendingJobs = "/job/trending";
  static String recruiterInfor(String id) => "/user/recruiter/find/$id";

  static const String allProducts = "/job/";
  static const String searchProduct = "/job/search/";
  static const String productById = "/job/find/";

  static String getJobsByAgentId(String agentId) => "/job/agent/$agentId";

  // for authentication and getting user info
  static const String logIn = "/login";
  static const String register = "/register";
  static String getUserById(String userId) => "/user/find/$userId";
  static const String refreshToken = "/refreshToken";
}
