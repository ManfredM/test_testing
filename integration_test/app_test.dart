import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test_testing/main.dart';

/*
2 commands to run the tests:

(1) Start the chromedriver
./chromedriver --port=4444

(2) Start the actual tests
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/app_test.dart \
  -d web-server --no-headless
*/

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('failing test example', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // The following call never returns...
    await binding.takeScreenshot('initial_screen');

    final button1 = find.byKey(const ValueKey('button1'));
    /*final button2 = find.byKey(const ValueKey('button2'));
    final message = find.byKey(const ValueKey('message'));*/

    await tester.tap(button1);
    await tester.pumpAndSettle();

    expect(find.text('Button 1 pressed'), findsOneWidget);
  });
}
