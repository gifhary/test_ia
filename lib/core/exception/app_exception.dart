import 'package:test_ia/core/exception/exception_code.dart';

/// Base exception class for the application.
abstract class AppException implements Exception {
  final ExceptionCode code;
  final String message;
  final dynamic data;
  AppException({required this.code, required this.message, required this.data});

  @override
  String toString() =>
      'AppException(code: $code, message: $message, data: $data)';

  @override
  bool operator ==(covariant AppException other) {
    if (identical(this, other)) return true;

    return other.code == code && other.message == message && other.data == data;
  }

  @override
  int get hashCode => code.hashCode ^ message.hashCode ^ data.hashCode;
}

/// Exception representing a generic application error.
class DefaultAppException extends AppException {
  DefaultAppException({
    super.message = 'An error occurred',
    super.code = ExceptionCode.defaultException,
    super.data,
  });
}

/// Exception representing an internet connection error.
class InternetConnectionException extends AppException {
  InternetConnectionException({
    super.message = 'No internet connection',
    super.code = ExceptionCode.internetConnectionException,
    super.data,
  });
}

/// Exception representing a server error.
class ServerException extends AppException {
  ServerException({
    super.message = 'Server error occurred',
    super.code = ExceptionCode.serverException,
    super.data,
  });
}
