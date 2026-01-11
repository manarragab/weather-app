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






import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:weather_app/data/remote_data/firebase/firebase_services.dart';
import 'package:weather_app/features/auth/domain/controller/auth_controller.dart';
import 'package:weather_app/my_app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // تفعيل وضع الاختبار في GetX
  Get.testMode = true;

  // إعداد المتغيرات
  late MockFirebaseAuth mockAuth;
  late FakeFirebaseFirestore mockFirestore;
  late FirebaseServices mockFirebaseServices;
  late AuthController authController;

  setUp(() {
    // إنشاء mocks قبل كل اختبار
    final mockUser = MockUser(uid: '123', email: 'test@example.com');
    mockAuth = MockFirebaseAuth(mockUser: mockUser);
    mockFirestore = FakeFirebaseFirestore();

    mockFirebaseServices = FirebaseServices(
      auth: mockAuth,
      firestore: mockFirestore,
    );

    authController = AuthController(firebaseServices: mockFirebaseServices);
    Get.put(authController);
  });

  tearDown(() {
    // تنظيف بعد كل اختبار
    Get.reset();
  });

  testWidgets('اختبار تطبيق الطقس', (WidgetTester tester) async {
    // بناء التطبيق
    await tester.pumpWidget(const MyApp());
    
    await tester.pumpAndSettle();

    // هنا ضع اختباراتك الفعلية بناءً على ما يحتويه تطبيقك
    // مثال:
    // expect(find.text('Weather App'), findsOneWidget);
    // expect(find.byType(TextField), findsWidgets);
  });

  testWidgets('اختبار تسجيل الدخول', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // تحقق من حالة المستخدم
    expect(authController.currentUser, isNotNull);
    expect(authController.currentUser?.email, 'test@example.com');
  });
}