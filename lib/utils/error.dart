import 'dart:io';

import 'package:grpc/grpc.dart';

class ErrorUtils {
  static bool isDeadlineExceeded(Object? error) {
    if (error is GrpcError) {
      return error.code == StatusCode.deadlineExceeded;
    }

    return false;
  }

  static bool isUnavailable(Object? error) {
    if (error is GrpcError) {
      return error.code == StatusCode.unavailable;
    }

    return false;
  }

  static bool isNotConnected(Object? error) {
    return isUnavailable(error) || isDeadlineExceeded(error);
  }

  static String toText(Object? error) {
    if (error is SocketException) {
      return error.message;
    }

    if (error is GrpcError) {
      return "${error.codeName}: ${error.message}";
    }

    return "${error ?? "Unknown Error"}";
  }
}
