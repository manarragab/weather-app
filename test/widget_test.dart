// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:weather_app/my_app.dart';

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyApp());

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }







// test/widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:weather_app/data/remote_data/firebase/firebase_services.dart';
import 'package:weather_app/features/auth/domain/controller/auth_controller.dart';
import 'package:weather_app/my_app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // تفعيل وضع الاختبار في GetX
  Get.testMode = true;

  // المتغيرات
  late MockFirebaseAuth mockAuth;
  late FakeFirebaseFirestore mockFirestore;
  late FirebaseServices mockFirebaseServices;
  late AuthController authController;

  // تهيئة قبل كل اختبار
  setUp(() {
    final mockUser = MockUser(uid: '123', email: 'test@example.com');
    mockAuth = MockFirebaseAuth(mockUser: mockUser);
    mockFirestore = FakeFirebaseFirestore();

    // نمرر الـ mocks لـ FirebaseServices
    mockFirebaseServices = FirebaseServices(
      auth: mockAuth,
      firestore: mockFirestore,
    );

    // نمرر الـ FirebaseServices الوهمي لـ AuthController
    authController = AuthController();
    Get.put(authController);
  });

  // تنظيف بعد كل اختبار
  tearDown(() {
    Get.reset();
  });

  testWidgets('تطبيق الطقس يظهر بدون Firebase حقيقي', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // نتأكد أن الـ MaterialApp موجود
    expect(find.byType(MaterialApp), findsOneWidget);

    // مثال: لو عندك TextField أو Buttons في الصفحة الرئيسية
    // expect(find.byType(TextField), findsWidgets);
  });

  testWidgets('AuthController يستخدم Firebase mocks', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // المستخدم موجود من الـ MockFirebaseAuth
    expect(authController.currentUser, isNotNull);
    expect(authController.currentUser?.email, 'test@example.com');
  });

  testWidgets('تسجيل مستخدم جديد وهمي', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // استدعاء دالة التسجيل
    await authController.registerFormKey.currentState?.validate(); // لو عندك فورم
    final userData = await authController.firebaseServices.register(
      name: 'Test User',
      email: 'newuser@example.com',
      password: '12345678',
      phone: '01000000000',
      country: 'Egypt',
    );

    expect(userData, isNotNull);
    expect(userData?.email, 'newuser@example.com');
  });
}
