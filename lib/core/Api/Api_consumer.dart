abstract class ApiConsumer {
  Future<dynamic> get({required String url, Map<String, dynamic>? headers});
  Future<dynamic> post({required String url, Map<String, dynamic>? headers});
  Future<dynamic> put({required String url, Map<String, dynamic>? headers});
}
