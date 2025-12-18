import 'dart:convert';

import 'package:weather_app/data/const/export.dart';
import 'package:weather_app/data/remote_data/response_model.dart';
import 'package:weather_app/domain_data/custom_mixin/mixen_widgets/status_error.dart';
import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioException dioError) {
    sPrint.warning(dioError.toString());
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message.message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message.message = "Connection timeout with API server";
        break;
      case DioExceptionType.unknown:
        message.message =
            "Connection to API server failed due to internet connection";
        break;
      case DioExceptionType.receiveTimeout:
        message.message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message.message = _handleError(
            dioError.response!.statusCode, dioError.response?.data ?? {});
        break;
      case DioExceptionType.sendTimeout:
        message.message = "Send timeout in connection with API server";
        break;
      default:
        message.message = "Something went wrong";
        break;
    }
  }

  late ResponseModel message = ResponseModel(message: '', status: 0);

//   String _handleError(int? statusCode, dynamic error) {
//     sPrint.error("error:$statusCode: $error ", StackTrace.current);
//     switch (statusCode) {
//       case 401:
//         message.status = StatusType.authError.index;
//         sPrint.warning('401 authenticated');
//         return error["message"] ?? error['error'] ?? 'يجب تسجيل الدخول اولأ';
//       case 400:
//         message.status = StatusType.apiError.index;
//         return 'Bad request';
//       case 404:
//         message.status = message.status = StatusType.apiError.index;
//         return error['error']?.toString() ?? "";
//       case 405:
//         message.status = message.status = StatusType.apiError.index;
//         return error["message"] ?? error['error'] ?? "method not allowed";
//       case 422:
//         message.status = message.status = StatusType.apiError.index;
//         try {
//           sPrint.warning('status code :: 422 ${error['error']}');
//           if ((error as Map).containsKey("message")) {
//             return error['message'];
//           }
//           if (error is Map<String, dynamic>) {
//             if (error['error'] != null) {
//               Map<String, dynamic> errors = error['error'];
//               String value = errors.values.map((e) {
//                 if (e is List) {
//                   return e.map((b) => "error: $b").join(" \n ");
//                 } else {
//                   return "error: $e";
//                 }
//               }).join(" \n ");
//               message.message = value;
//             }
//           }
//         } catch (e, s) {
//           sPrint.error(e.toString(), s);
//         }
//         return '${error["error"]}';
//       case 500:
//         message.status = message.status = StatusType.apiError.index;
//         return CustomTrans.internalServerError.tr;
//       default:
//         return CustomTrans.somethingWentWrong.tr;
//     }
//   }

//   @override
//   String toString() => message.data!.msg.toString();
// }



String _handleError(int? statusCode, dynamic error) {
  sPrint.error("error:$statusCode: $error ", StackTrace.current);

  // نحاول نحول الـ error لـ Map لو ممكن
  Map<String, dynamic>? mapError;
  if (error is Map<String, dynamic>) {
    mapError = error;
  } else if (error is String) {
    try {
      mapError = jsonDecode(error);
    } catch (_) {
      mapError = null;
    }
  }

  switch (statusCode) {
    case 401:
      message.status = StatusType.authError.index;
      sPrint.warning('401 authenticated');
      return mapError?["message"] ??
          mapError?['error'] ??
          (error is String ? error : 'يجب تسجيل الدخول أولاً');

    case 400:
      message.status = StatusType.apiError.index;
      return mapError?['message'] ?? 'Bad request';

    case 404:
      message.status = StatusType.apiError.index;
      return mapError?['error']?.toString() ?? 'Not found';

    case 405:
      message.status = StatusType.apiError.index;
      return mapError?["message"] ?? mapError?['error'] ?? "method not allowed";

    case 422:
      message.status = StatusType.apiError.index;
      try {
        sPrint.warning('status code :: 422 ${mapError?['error']}');
        if (mapError != null) {
          if (mapError.containsKey("message")) {
            return mapError['message'];
          }
          if (mapError['error'] != null && mapError['error'] is Map) {
            Map<String, dynamic> errors = Map<String, dynamic>.from(mapError['error']);
            String value = errors.values.map((e) {
              if (e is List) {
                return e.map((b) => "error: $b").join(" \n ");
              } else {
                return "error: $e";
              }
            }).join(" \n ");
            message.message = value;
            return value;
          }
        }
      } catch (e, s) {
        sPrint.error(e.toString(), s);
      }
      return mapError?["error"]?.toString() ?? "Unprocessable Entity";

    case 500:
      message.status = StatusType.apiError.index;
      return CustomTrans.internalServerError.tr;

    default:
      message.status = StatusType.apiError.index;
      return CustomTrans.somethingWentWrong.tr;
  }
}
}