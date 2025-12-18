// // import 'package:weather_app/res/configuration/print_types.dart';

// // class ResponseModel<T> {
// //   num? status;
// //   String? message;
// //   bool more = true;
// //   T? data;

// //   ResponseModel({this.status = 1, this.message = '', this.data});

// //   ResponseModel.fromJson(json) {
// //     status = json['status'];
// //     message = "${json['message'] ?? json['msg']}";
// //     status = json['status'];
// //     sPrint.info('status:: $status  ,, msg:$message');
// //   }

// //   toJson() {
// //     Map<String, dynamic> json = {};
// //     json['status'] = status;
// //     json['message'] = message;
// //     return json;
// //   }
// // }


// import 'package:weather_app/res/configuration/print_types.dart';

// class ResponseModel<T> {
//   num? status;
//   String? message;
//   bool more = true;
//   T? data;
//   Map<String, dynamic>? errors;

//   ResponseModel({
//     this.status = 1,
//     this.message = '',
//     this.data,
//     this.errors,
//   });

//   ResponseModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = "${json['message'] ?? json['msg'] ?? ''}";
//     errors = json['errors'];
//     sPrint.info('status:: $status  ,, msg:$message ,, errors::$errors');
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'message': message,
//       'errors': errors,
//     };
//   }
// }







import 'package:weather_app/res/configuration/print_types.dart';

class ResponseModel<T> {
  num? status;
  String? message;
  bool more = true;
  T? data;
  Map<String, dynamic>? errors;

  ResponseModel({
    this.status = 1,
    this.message = '',
    this.data,
    this.errors,
  });

  factory ResponseModel.fromJson(
    Map<String, dynamic> json, {
    T Function(Map<String, dynamic>)? fromJsonT,
  }) {
    sPrint.info(
        'status:: ${json['status']}  ,, msg:${json['message'] ?? json['msg']} ,, errors::${json['errors']}');

    return ResponseModel<T>(
      status: json['status'],
      message: "${json['message'] ?? json['msg'] ?? ''}",
      errors: json['errors'],
      // ✅ Add data mapping here
      data: (json['data'] != null && fromJsonT != null)
          ? fromJsonT(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'errors': errors,
      'data': data is Map ? data : (data?.toString()),
    };
  }

  @override
  String toString() {
    return 'ResponseModel(status: $status, message: $message, data: $data, errors: $errors)';
  }
}
