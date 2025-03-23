import 'dart:io';

import 'package:grpc/grpc.dart';

class ErrorUtils {
  static String toText(Object? error) {
    if (error is SocketException) {
      return error.message;
    }

    if (error is GrpcError && error.code == StatusCode.unavailable) {
      return 'No connection';
    }
    
    if (error is GrpcError && error.code == StatusCode.deadlineExceeded) {
      return 'Door system connection timeout: Request to doorman service exceeded time limit';
    }
    
    // Handle expired challenge error based on the exact message from doorman service
    if (error is GrpcError && error.message?.contains('invalid challenge') == true) {
      return 'Challenge expired: Please try again to get a new challenge (valid for ~30 seconds)';
    }

    if (error is GrpcError) {
      return '${error.codeName}: ${error.message}';
    }

    return '${error ?? 'Unknown Error'}';
  }
}
