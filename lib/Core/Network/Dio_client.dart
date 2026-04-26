import 'package:dio/dio.dart';
import 'package:testing_hub/Core/Utils/Pref_helper.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://api.escuelajs.co/api",
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  DioClient() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await PrefHelper.getToken();
          // ignore: unnecessary_null_comparison
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );
  }
// for encapsulation and to prevent direct access to the Dio instance from outside the class
  Dio get dio => _dio;
}
