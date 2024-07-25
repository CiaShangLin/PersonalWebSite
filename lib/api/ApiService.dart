import 'package:dio/dio.dart';

import '../utils/MyLogger.dart';

/// 封裝Dio
class ApiService {
  ApiService._();

  static final ApiService _instance = ApiService._internal();

  static ApiService get instance => _instance;

  late Dio _dio;

  final bool _isRemote = true;

  ApiService._internal() {
    _dio = Dio(BaseOptions(baseUrl: _getBaseUrl()));
    _dio.interceptors.add(HttpLoggerInterceptor());
  }

  String _getBaseUrl() {
    if (_isRemote) {
      return "https://shanglin-personal-website-73b4ea02b09c.herokuapp.com/";
    } else {
      return "http://127.0.0.1:5000/";
    }
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(contentType: Headers.jsonContentType),
      );
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> post(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.post(
        path,
        queryParameters: queryParameters,
        options: Options(contentType: Headers.jsonContentType),
      );
    } catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(error) {
    String errorDescription = "";
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          errorDescription = "連接逾時";
          break;
        case DioExceptionType.sendTimeout:
          errorDescription = "傳送逾時";
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = "接收逾時";
          break;
        case DioExceptionType.badCertificate:
          errorDescription = "無效的憑證";
          break;
        case DioExceptionType.badResponse:
          errorDescription = "伺服器回應錯誤: ${error.response?.statusCode}";
          break;
        case DioExceptionType.cancel:
          errorDescription = "請求取消";
          break;
        case DioExceptionType.connectionError:
          errorDescription = "連接錯誤";
          break;
        case DioExceptionType.unknown:
          errorDescription = "未知錯誤";
          break;
      }
    } else {
      errorDescription = "發生未知錯誤: $error";
    }
    return Exception(errorDescription);
  }
}

class HttpLoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    MyLogger.instance.d(options.uri.toString());
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
