
// lib/services/supabase_service.dart

// import 'dart:io';
// import 'dart:math';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:path/path.dart' as path;
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart'; // للـ Timestamp فقط
// import 'package:weather_app/data/remote_data/firebase/firebase_data.dart';

// class SupabaseService {
//   final SupabaseClient _client = Supabase.instance.client;

//   // ======================== رفع الصورة مع ضغط وحجم محدد ========================
//   Future<String?> uploadProfileImage({
//     required File imageFile,
//     String bucket = 'profile_photos',
//     required String userId,
//     int maxSizeInMB = 5,        // الحد الأقصى: 5 ميجا
//     int quality = 85,           // جودة الضغط
//   }) async {
//     try {
//       // 1. التحقق من حجم الملف
//       final fileSizeInBytes = await imageFile.length();
//       final fileSizeInMB = fileSizeInBytes / (1024 * 1024);

//       if (fileSizeInMB > maxSizeInMB) {
//         Get.snackbar("خطأ", "حجم الصورة كبير جدًا (الحد الأقصى: ${maxSizeInMB}MB)");
//         return null;
//       }

//       // 2. ضغط الصورة
//       final compressedFile = await FlutterImageCompress.compressAndGetFile(
//         imageFile.absolute.path,
//         '${imageFile.parent.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.jpg',
//         quality: quality,
//         minWidth: 1080,
//         minHeight: 1080,
//       );

//       if (compressedFile == null) {
//         Get.snackbar("خطأ", "فشل ضغط الصورة");
//         return null;
//       }

//       final extension = path.extension(compressedFile.path).toLowerCase();
//       final fileName = "$userId/profile_$userId${extension == '.jpg' || extension == '.jpeg' ? '' : extension}";

//       final bytes = await compressedFile.readAsBytes();

//       // حذف الصورة القديمة إذا كانت موجودة
//       try {
//         final oldFiles = await _client.storage.from(bucket).list(path: userId);
//         for (var file in oldFiles) {
//           await _client.storage.from(bucket).remove(['${file.name}']);
//         }
//       } catch (_) {}

//       // رفع الصورة الجديدة
//       await _client.storage.from(bucket).uploadBinary(
//         fileName,
//         bytes,
//         fileOptions: FileOptions(
//           contentType: extension == '.png' ? 'image/png' : 'image/jpeg',
//           upsert: true,
//         ),
//       );

//       final url = _client.storage.from(bucket).getPublicUrl(fileName);
//       print("تم رفع الصورة بنجاح: $url");
//       return url;
//     } catch (e) {
//       print("فشل رفع الصورة: $e");
//       Get.snackbar("خطأ", "فشل رفع الصورة");
//       return null;
//     }
//   }

//   // ======================== التسجيل (يعيد FirebaseData) ========================
//   Future<FirebaseData?> register({
//     required String name,
//     required String email,
//     required String password,
//     required String phone,
//     required String? country,
//     File? profileImageFile,
//   }) async {
//     try {
//       final response = await _client.auth.signUp(
//         email: email.trim(),
//         password: password.trim(),
//         data: {
//           'name': name.trim(),
//           'phone': phone.trim(),
//           'country': country ?? '',
//         },
//       );

//       final user = response.user;
//       if (user == null) throw "فشل إنشاء المستخدم";

//       String profileImageUrl = "";

//       if (profileImageFile != null) {
//         final url = await uploadProfileImage(
//           imageFile: profileImageFile,
//           userId: user.id,
//         );
//         if (url != null) profileImageUrl = url;
//       }

//       final userData = {
//         'id': user.id,
//         'name': name.trim(),
//         'email': email.trim(),
//         'phone': phone.trim(),
//         'country': country ?? '',
//         'profile_image': profileImageUrl,
//         'created_at': DateTime.now(),
//       };

//       await _client.from('users').insert(userData,);

//       return FirebaseData(
//         name: name.trim(),
//         email: email.trim(),
//         phone: phone.trim(),
//         country: country ?? "",
//         uid: user.id,
//         createdAt: Timestamp.fromDate(DateTime.now()),
//         profileImageFile: profileImageUrl,
//       );
//     } catch (e) {
//       String msg = e.toString();
//       if (msg.contains("duplicate") || msg.contains("email")) {
//         msg = "الإيميل مستخدم بالفعل";
//       }
//       Get.snackbar("فشل التسجيل", msg,
//           backgroundColor: Colors.redAccent, colorText: Colors.white);
//       return null;
//     }
//   }

//   // ======================== تسجيل الدخول (يعيد FirebaseData) ========================
//   Future<FirebaseData?> login({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final response = await _client.auth.signInWithPassword(
//         email: email.trim(),
//         password: password.trim(),
//       );

//       final user = response.user;
//       if (user == null) throw "المستخدم غير موجود";

//       final data = await _client
//           .from('users')
//           .select()
//           .eq('id', user.id)
//           .single();

//       return FirebaseData(
//         name: data['name'],
//         email: data['email'],
//         phone: data['phone'] ?? "",
//         country: data['country'] ?? "",
//         uid: user.id,
//         createdAt: data['created_at'] != null
//             ? Timestamp.fromDate(DateTime.parse(data['created_at']))
//             : Timestamp.now(),
//         profileImageFile: data['profile_image'],
//       );
//     } catch (e) {
//       Get.snackbar("فشل تسجيل الدخول", "إيميل أو كلمة مرور خاطئة",
//           backgroundColor: Colors.redAccent, colorText: Colors.white);
//       return null;
//     }
//   }

//   // ======================== تسجيل الخروج ========================
//   Future<void> logout() async => await _client.auth.signOut();

//   // ======================== المستخدم الحالي ========================
//   String? get currentUserId => _client.auth.currentUser?.id;
// }

















  // ======================== رفع الصور فقط ========================
//   Future<String?> uploadProfileImageToSupabase({
//   required File imageFile,
//   required String userUid, // إضافة UID
//   String bucket = 'profile_photos',
//   String? customFileName,
// }) async {
//   final extension = path.extension(imageFile.path).toLowerCase();
//   const allowed = ['.jpg', '.jpeg', '.png', '.gif', '.webp', '.heic'];

//   if (!allowed.contains(extension)) {
//     Get.snackbar("خطأ", "يرجى اختيار صورة فقط (JPG, PNG, ...)");
//     return null;
//   }

//   try {
//     // اسم الملف
//     final fileName = customFileName ?? "img_${DateTime.now().millisecondsSinceEpoch}$extension";

//     // مسار الرفع مع فولدر باسم UID
//     final pathToUpload = "$userUid/$fileName";

//     final bytes = await imageFile.readAsBytes();

//     await Supabase.instance.client.storage.from(bucket).uploadBinary(
//           pathToUpload,
//           bytes,
//           fileOptions: FileOptions(
//             contentType: _getImageMimeType(extension),
//             upsert: false,
//           ),
//         );

//     final url = Supabase.instance.client.storage
//         .from(bucket)
//         .getPublicUrl(pathToUpload);

//     print("تم رفع الصورة: $url");
//     return url;
//   } catch (e) {
//     print("فشل رفع الصورة: $e");
//     Get.snackbar("خطأ", "فشل رفع الصورة");
//     return null;
//   }
// }



  // ======================== رفع الفيديو فقط ========================
  // Future<String?> uploadVideoToSupabase({
  //   required File videoFile,
  //   String bucket = 'videos',
  //   String? customFileName,
  // }) async {
  //   final extension = path.extension(videoFile.path).toLowerCase();
  //   const allowed = ['.mp4', '.mov', '.avi', '.mkv', '.webm', '.3gp'];

  //   if (!allowed.contains(extension)) {
  //     Get.snackbar("خطأ", "يرجى اختيار فيديو فقط (MP4, MOV, ...)");
  //     return null;
  //   }

  //   try {
  //     final fileName = customFileName ??
  //         "vid_${DateTime.now().millisecondsSinceEpoch}$extension";
  //     final bytes = await videoFile.readAsBytes();

  //     await Supabase.instance.client.storage.from(bucket).uploadBinary(
  //           fileName,
  //           bytes,
  //           fileOptions: FileOptions(
  //             contentType: _getVideoMimeType(extension),
  //             upsert: false,
  //           ),
  //         );

  //     final url = Supabase.instance.client.storage
  //         .from(bucket)
  //         .getPublicUrl(fileName);

  //     print("تم رفع الفيديو: $url");
  //     return url;
  //   } catch (e) {
  //     print("فشل رفع الفيديو: $e");
  //     Get.snackbar("خطأ", "فشل رفع الفيديو");
  //     return null;
  //   }
  // }

  // // ======================== MIME Types ========================
  // String _getImageMimeType(String ext) {
  //   return {
  //     '.png': 'image/png',
  //     '.gif': 'image/gif',
  //     '.webp': 'image/webp',
  //     '.heic': 'image/heic',
  //   }[ext] ??
  //       'image/jpeg';
  // }

  // String _getVideoMimeType(String ext) {
  //   return {
  //     '.mp4': 'video/mp4',
  //     '.mov': 'video/quicktime',
  //     '.avi': 'video/x-msvideo',
  //     '.webm': 'video/webm',
  //     '.mkv': 'video/x-matroska',
  //   }[ext] ??
  //       'video/mp4';
  // }
