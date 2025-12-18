class ErrorModel {
  ErrorModel({
      this.status, 
      this.success, 
      this.error, 
      this.data, 
      this.message,});

  ErrorModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    error = json['error'];
    data = json['data'];
    message = json['message'];
  }
  num? status;
  bool? success;
  String? error;
  dynamic data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['error'] = error;
    map['data'] = data;
    map['message'] = message;
    return map;
  }

}