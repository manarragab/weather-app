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

  // Create a fake user
  final mockUser = MockUser(
    uid: '123',
    email: 'test@example.com',
  );

  // Mock Firebase Auth
  final mockAuth = MockFirebaseAuth(mockUser: mockUser);

  // Fake Firestore
  final mockFirestore = FakeFirebaseFirestore();

  // FirebaseServices with mock dependencies
  final mockFirebaseServices = FirebaseServices(
    auth: mockAuth,
    firestore: mockFirestore,
  );

  // AuthController using the mocked FirebaseServices
  final authController = AuthController(firebaseServices: mockFirebaseServices);
  Get.put(authController);

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Replace these with actual widgets/texts in your app
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
