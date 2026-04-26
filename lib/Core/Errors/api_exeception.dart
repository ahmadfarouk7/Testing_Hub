import 'package:dio/dio.dart';
import 'package:testing_hub/Core/Errors/api_error.dart';

class ApiExeception {
  static ApiError handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError(message: 'Bad connection');
      case DioExceptionType.connectionError:
        return ApiError(message: 'No Internet Connection');
      case DioExceptionType.badResponse:
      default:
        return ApiError(
            message: 'Oops! Something went wrong, please try again');
    }
  }
}
