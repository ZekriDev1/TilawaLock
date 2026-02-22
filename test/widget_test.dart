import 'package:flutter_test/flutter_test.dart';
import 'package:tilawalock/main.dart';

void main() {
  testWidgets('Splash screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TilawaLockApp());

    // Verify that splash screen text is present.
    expect(find.text('TilawaLock'), findsOneWidget);
  });
}
