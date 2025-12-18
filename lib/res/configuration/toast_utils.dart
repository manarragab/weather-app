import 'package:flutter/material.dart';
import 'package:get/get.dart';


enum MessageErrorType { success, error }

/*void showToast(String msg, MessageErrorType errorType) {
  Get.showSnackbar(GetSnackBar(
    backgroundColor: errorType == MessageErrorType.error ? Colors.red : Colors.green,
    icon: Icon(
      errorType == MessageErrorType.error ? Icons.error : Icons.check_circle,
      color: Colors.white,
    ),
    messageText: Text(
      msg,
      style: const TextStyle(fontSize: 15, color: Colors.white),
    ),
    isDismissible: true,
    duration: const Duration(seconds: 3),
  ));
}*/
void showToast(String msg, MessageErrorType errorType) {
  Get.showSnackbar(GetSnackBar(
    backgroundColor: errorType == MessageErrorType.error ? Colors.red : Colors.green,
    icon: Icon(
      errorType == MessageErrorType.error ? Icons.error : Icons.check_circle,
      color: Colors.white,
    ),
    snackPosition: SnackPosition.TOP,
    snackStyle: SnackStyle.FLOATING,
    title: errorType.name,
    message: msg,
    borderRadius: 10,
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    duration: const Duration(seconds: 3),
  ));
}




