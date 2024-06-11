class AppConstant {
  static const String apiKey = String.fromEnvironment('API_KEY', defaultValue: '');
  static const String apiURL = String.fromEnvironment('API_URL', defaultValue: '');
}