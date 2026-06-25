import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_ia/core/exception/app_exception.dart';
import 'package:test_ia/core/services/internet_connection_service.dart';

abstract class HttpClientService {
  Future<Response> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
  Future<Response> post({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
  Future<Response> put({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
  Future<Response> patch({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
  Future<Response> delete({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}

@LazySingleton(as: HttpClientService)
class HttpClientServiceImpl implements HttpClientService {
  final Dio dio;
  final InternetConnectionService internetConnectionService;

  HttpClientServiceImpl(this.dio, this.internetConnectionService);

  @override
  Future<Response> delete({
    required String path,
    required data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      await internetConnectionService.checkConnectivityState();

      final response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return response;
    } on InternetConnectionException {
      rethrow;
    } on DioException catch (e) {
      throw ServerException(data: e);
    } catch (e) {
      throw DefaultAppException();
    }
  }

  @override
  Future<Response> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      await internetConnectionService.checkConnectivityState();

      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );

      return response;
    } on InternetConnectionException {
      rethrow;
    } on DioException catch (e) {
      throw ServerException(data: e);
    } catch (e) {
      throw DefaultAppException();
    }
  }

  @override
  Future<Response> patch({
    required String path,
    required data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      await internetConnectionService.checkConnectivityState();

      final response = await dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return response;
    } on InternetConnectionException {
      rethrow;
    } on DioException catch (e) {
      throw ServerException(data: e);
    } catch (e) {
      throw DefaultAppException();
    }
  }

  @override
  Future<Response> post({
    required String path,
    required data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      await internetConnectionService.checkConnectivityState();

      final response = await dio.post<String>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return response;
    } on InternetConnectionException {
      rethrow;
    } on DioException catch (e) {
      throw ServerException(data: e);
    } catch (e) {
      throw DefaultAppException();
    }
  }

  @override
  Future<Response> put({
    required String path,
    required data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      await internetConnectionService.checkConnectivityState();

      final response = await dio.put<String>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return response;
    } on InternetConnectionException {
      rethrow;
    } on DioException catch (e) {
      throw ServerException(data: e);
    } catch (e) {
      throw DefaultAppException();
    }
  }
}
