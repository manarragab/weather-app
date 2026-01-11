import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_app/data/const/export.dart';
import 'package:weather_app/data/remote_data/firebase/firebase_data.dart';


class FirebaseServices {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  FirebaseServices({
    FirebaseAuth? auth,
    FirebaseFirestore? firestore,
  })  : _auth = auth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

//1 - sign in cloudinary website
//2- create upload presset

Future<String> uploadProfileImage(File? pickedFile) async {
  if (pickedFile == null) {
    return "";
  }
  final cloudinary = CloudinaryPublic(
    'drgip1agc',   
    'profile_photo',  
    cache: false,
  );

  try {
    CloudinaryResponse res = await cloudinary.uploadFile(
      CloudinaryFile.fromFile(pickedFile.path, resourceType: CloudinaryResourceType.Image),
    );
    String imageUrl = res.secureUrl;
    print('Uploaded image URL: $imageUrl');
    return imageUrl;
  } on CloudinaryException catch (e) {
    print("0000 ${e.message} ");
    print(e.request);
    return "";
  } catch (e) {
    print(e.toString());
    return "";
  }
}


Future<String> changeProfileImagey(File? picked) async {
  
  if (picked == null) {
    print("No image selected");
    return "";
  }
  // File imageFile = File(picked.path);

  String uploadedUrl = await uploadProfileImage(picked);

  if (uploadedUrl.isNotEmpty) {
    print("Profile image updated: $uploadedUrl");
return uploadedUrl;
  } else {
    print("Image upload failed.");
    return "";
  }
}

Future<String> changeProfileImage(File picked) async {
  try {

    // 1. Upload to Cloudinary
    String uploadedUrl = await uploadProfileImage(picked);

    if (uploadedUrl.isNotEmpty) {
      // 2. Update Firestore
      String uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .update({"profileImage": uploadedUrl});

      print("Profile image updated: $uploadedUrl");
      return uploadedUrl;
    } else {
      print("Image upload failed.");
    }

    return uploadedUrl;
  } 
  catch (e) {
    print("Error changing profile image: $e");
    Get.snackbar("خطأ", "حدث خطأ أثناء تغيير صورة الملف الشخصي");
    return "";
  }
}


  // ======================== التسجيل ========================
  Future<FirebaseData?> register({
  required String name,
  required String email,
  required String password,
  required String phone,
  required String? country,
  File? profileImageFile,
}) async {
  try {
    // 1. إنشاء حساب Firebase Auth
    UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );

    // 2. رفع الصورة إلى Cloudinary
    String profileImageUrl = "";
    if (profileImageFile != null) {
      profileImageUrl = await uploadProfileImage(profileImageFile);
    } else {
    }

    final userMap = {
      "name": name.trim(),
      "email": email.trim(),
      "phone": phone.trim(),
      "country": country ?? "",
      "uid": userCredential.user!.uid,
      "createdAt": FieldValue.serverTimestamp(),
      "profileImage": profileImageUrl,
    };

    await _firestore
        .collection("users")
        .doc(userCredential.user!.uid)
        .set(userMap);

    final firebaseData = FirebaseData.fromJson(userMap);
    print("FirebaseData object created. Profile image: ${firebaseData.profileImage}");

    Get.snackbar("نجح", "تم إنشاء الحساب بنجاح",
        backgroundColor: Colors.green, colorText: Colors.white);

    return firebaseData;
    
  } on FirebaseAuthException catch (e) {
    String msg = e.message ?? "فشل التسجيل";
    if (e.code == 'email-already-in-use') msg = "الإيميل مستخدم بالفعل";
    if (e.code == 'weak-password') msg = "كلمة المرور ضعيفة جدًا";

    Get.snackbar("فشل التسجيل", msg,
        backgroundColor: Colors.redAccent, colorText: Colors.white);
    
    return null;
  } catch (e) {
    print("Unexpected error: $e");
    Get.snackbar("خطأ", "حدث خطأ غير متوقع: $e");
    return null;
  }
}
  // ======================== تسجيل الدخول ========================
  Future<FirebaseData?> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      final doc = await _firestore
          .collection("users")
          .doc(userCredential.user!.uid)
          .get();

      if (!doc.exists || doc.data() == null) {
        Get.snackbar("خطأ", "بيانات المستخدم غير موجودة");
        return null;
      }

      Get.snackbar("نجح", "تم تسجيل الدخول بنجاح",
          backgroundColor: Colors.green, colorText: Colors.white);

      return FirebaseData.fromJson(doc.data()!);
    } on FirebaseAuthException catch (e) {
      String msg = "إيميل أو كلمة مرور خاطئة";
      if (e.code == 'user-not-found') msg = "هذا الإيميل غير مسجل";
      if (e.code == 'wrong-password') msg = "كلمة المرور خاطئة";

      Get.snackbar("فشل تسجيل الدخول", msg,
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      return null;
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ غير متوقع");
      return null;
    }
  }


  // ======================== جلب المستخدم الحالي ========================//

Future<FirebaseData?> getCurrentUser() async {
  
  User? firebaseUser = _auth.currentUser;
  if (firebaseUser == null) return null;

  try {
    final doc = await _firestore.collection("users").doc(firebaseUser.uid).get();
    if (!doc.exists || doc.data() == null) return null;

    final firebaseData = FirebaseData.fromJson(doc.data()!);
    print("Current user loaded: ${firebaseData.uid}");
    return firebaseData;
  } catch (e) {
    print("Failed to load current user: $e");
    return null;
  }
}


  // ======================== تسجيل الخروج ========================
  Future<void> logout() async => await _auth.signOut();
}

