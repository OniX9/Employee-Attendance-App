import 'package:dio/dio.dart';

class APINetwork {
  final Dio _dio;
  final String baseUrl;

  APINetwork(this.baseUrl, {
    dio,
  }) : _dio = dio ?? Dio();

  dynamic getData({Map<String, dynamic>? queryParameters}) async {
    Response response = await _dio.get(
      baseUrl,
      queryParameters: queryParameters,
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      return NetworkFailedError('Failed to get Data: ${response.statusCode}');
    }
  }
}

class NetworkFailedError {
  final String message;

  NetworkFailedError(this.message);

  @override
  String toString() {
    return 'NetworkFailedError: $message';
  }
}
