import 'package:dio/dio.dart';
import 'package:testing_hub/Core/Errors/api_exeception.dart';
import 'package:testing_hub/Core/Network/Dio_client.dart';

class ApiService {
  final DioClient _dioClient = DioClient();

  // CRUD Methods

  Future<dynamic> get(String endpoint) async {
    try {
      final response = await _dioClient.dio.get(endpoint);
      return response.data;
    } on DioException catch (e) {
      return ApiExeception.handleError(e);
    }
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await _dioClient.dio.post(endpoint, data: body);
      return response.data;
    } on DioException catch (e) {
      return ApiExeception.handleError(e);
    }
  }

  Future<dynamic> put(String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await _dioClient.dio.put(endpoint, data: body);
      return response.data;
    } on DioException catch (e) {
      return ApiExeception.handleError(e);
    }
  }

  Future<dynamic> delete(String endpoint) async {
    try {
      final response = await _dioClient.dio.delete(endpoint);
      return response.data;
    } on DioException catch (e) {
      return ApiExeception.handleError(e);
    }
  }
}
