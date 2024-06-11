abstract class ApiClient {
  Future get({
    required String path,
    Map<String, dynamic>? query,
  });
}