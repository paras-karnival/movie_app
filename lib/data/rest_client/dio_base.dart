
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:movie_app/core/utils/debug_logger.dart';


class DioClient {
  // final String baseUrl;

  //Info Approach 1
  late final  Dio _dio;

  // final List<Interceptor> interceptors;

/*  DioClient(
      this.baseUrl,
      Dio dio,) {
    _dio = dio ?? Dio();
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};

  }*/

  DioClient(this._dio) {
    debuggerAdvance(tag: "Dio info", value: ' ${_dio.options.baseUrl}');
    addRetryInterceptors();
  }

  addRetryInterceptors() {
    debuggerAdvance(tag: "Retry interceptor ", value: "working");
    _dio.interceptors.add(RetryInterceptor(
      dio: _dio,
      // logPrint: print, // specify log function
      retries: 1, // retry count
      retryDelays: const [
        Duration(seconds: 3), // wait 1 sec before first retry
        // Duration(seconds: 2), // wait 2 sec before second retry
        // Duration(seconds: 3), // wait 3 sec before third retry
      ],
    ));
  }

  // Get:-----------------------------------------------------------------------
  Future<Response> get({
    required String url,
    required String uniqueKey,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      // _dio = Dio();
      // _dio.options = BaseOptions(
      //     baseUrl: "https://jsonplaceholder.typicode.com"
      // );
      debuggerAdvance(tag: uniqueKey, value: url, type: DebugType.url);
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      printAPIRes(
        url: response.realUri,
        response: response.data,
        statusCode: response.statusCode ?? -1,
        tag: uniqueKey,
      );
      return response;
    } on DioException catch (e) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> post({
    required String url,
    required String uniqueKey,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      debuggerAdvance(tag: uniqueKey, value: url, type: DebugType.url);
      printRequestModel(

        tag: uniqueKey, requestModel: data,
      );
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      printAPIRes(
        url: response.realUri,
        response: response.data,
        statusCode: response.statusCode ?? -1,
        tag: uniqueKey,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<Response> put({
    required String url,
    required String uniqueKey,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      debuggerAdvance(tag: uniqueKey, value: url, type: DebugType.url);
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      printAPIRes(
        url: response.realUri,
        response: response.data,
        statusCode: response.statusCode ?? -1,
        tag: uniqueKey,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<dynamic> delete({
    required String url,
    required String uniqueKey,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      debuggerAdvance(tag: uniqueKey, value: url, type: DebugType.url);
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      printAPIRes(
        url: response.realUri,
        response: response.data,
        statusCode: response.statusCode ?? -1,
        tag: uniqueKey,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
