part of 'network_client.dart';

class NetworkResponse {
  final int statusCode;
  final Map<String, dynamic>? responseData;
  final bool isSuccess;
  final String? errorMessage;

  NetworkResponse({
    required this.statusCode,
    this.responseData,
    required this.isSuccess,
    this.errorMessage,
  });
}
