import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:skill/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    // ✅ Initialize Firebase before tests
    await Firebase.initializeApp();
  });

  testWidgets('App starts and shows loading indicator', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app starts with a loading indicator
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
