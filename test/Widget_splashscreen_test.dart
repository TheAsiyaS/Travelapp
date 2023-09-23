import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:travelapp/main.dart';

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('Splash screen test', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(const MyApp());

    // Let the timers run for the specified duration (3 seconds in this case)
    await tester.pump(const Duration(seconds: 3));

    var splashscreen = find.byType(SplashScreen);
    expect(splashscreen, findsOneWidget);
    var container = find.byType(Container);
    expect(container, findsWidgets);
  });

}
