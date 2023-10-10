import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:travelapp/presentation/NavigationBar.dart';

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('test Botton navigationbar', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(const MaterialApp(
      home: NavigationBarScreen(),
    ));

  

    var navigationbar = find.text('Home');
    expect(navigationbar, findsOneWidget);
    
  });

}
