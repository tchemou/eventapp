import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../config/api_config.dart';
import '../config/app_constants.dart';
import '../models/api_response.dart';

class HttpService {
  late Dio _dio;
  String? _authToken;

  HttpService() {
    _initializeDio();
  }

  void _initializeDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: const Duration(
          milliseconds: ApiConfig.connectTimeout,
        ),
        receiveTimeout: const Duration(
          milliseconds: ApiConfig.receiveTimeout,
        ),
        sendTimeout: const Duration(
          milliseconds: ApiConfig.sendTimeout,
        ),
        contentType: ApiConfig.contentTypeJson,
      ),
    );

    // Add logging interceptor
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );

    // Add auth interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (_authToken != null) {
            options.headers[ApiConfig.authorizationHeader] =
                'Bearer $_authToken';
          }
          return handler.next(options);
        },
        onError: (error, handler) {
          // Handle 401 errors (Unauthorized)
          if (error.response?.statusCode == 401) {
            // TODO: Implement token refresh logic
          }
          return handler.next(error);
        },
      ),
    );
  }

  /// Set authentication token
  void setToken(String token) {
    _authToken = token;
  }

  /// Clear authentication token
  void clearToken() {
    _authToken = null;
  }

  /// Get method
  Future<T> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return _handleResponse<T>(response, fromJson);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Post method
  Future<T> post<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return _handleResponse<T>(response, fromJson);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Put method
  Future<T> put<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return _handleResponse<T>(response, fromJson);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Patch method
  Future<T> patch<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.patch(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return _handleResponse<T>(response, fromJson);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Delete method
  Future<T> delete<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return _handleResponse<T>(response, fromJson);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Upload file
  Future<T> uploadFile<T>(
    String endpoint,
    String filePath, {
    Map<String, dynamic>? fields,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final formData = FormData.fromMap({
        if (fields != null) ...fields,
        'file': await MultipartFile.fromFile(filePath),
      });

      final response = await _dio.post(
        endpoint,
        data: formData,
      );
      return _handleResponse<T>(response, fromJson);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Handle response
  T _handleResponse<T>(
    Response response,
    T Function(dynamic)? fromJson,
  ) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      if (fromJson != null) {
        return fromJson(response.data);
      }
      return response.data as T;
    } else {
      throw ApiError(
        statusCode: response.statusCode ?? 500,
        message: response.data['message'] ?? AppConstants.unknownErrorMsg,
      );
    }
  }

  /// Handle errors
  ApiError _handleError(DioException error) {
    int statusCode = error.response?.statusCode ?? 500;
    String message = AppConstants.unknownErrorMsg;

    if (error.type == DioExceptionType.connectionTimeout) {
      message = AppConstants.networkErrorMsg;
    } else if (error.type == DioExceptionType.receiveTimeout) {
      message = AppConstants.networkErrorMsg;
    } else if (error.type == DioExceptionType.sendTimeout) {
      message = AppConstants.networkErrorMsg;
    } else if (statusCode == 401) {
      message = AppConstants.unauthorizedMsg;
    } else if (statusCode == 403) {
      message = AppConstants.forbiddenMsg;
    } else if (statusCode == 404) {
      message = AppConstants.notFoundMsg;
    } else if (statusCode >= 500) {
      message = AppConstants.serverErrorMsg;
    } else if (error.response?.data != null) {
      message = error.response!.data['message'] ?? message;
    }

    return ApiError(
      statusCode: statusCode,
      message: message,
      errors: error.response?.data['errors'],
    );
  }
}
