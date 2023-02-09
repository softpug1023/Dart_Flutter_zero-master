import 'package:advicer/2_application/pages/advice/widgets/advice_field.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:advicer/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end', () {
    testWidgets('tap on custom button, verify advice will be loaded',
        (widgetTester) async {
      app.main();
      await widgetTester.pumpAndSettle();
      //verify that no advice has been loaded
      expect(find.text('Your advice is waiting for you'), findsOneWidget);

      //find custom button
      final customButtonFinder = find.text('get advice');

      //emulate a tap on the custom button
      await widgetTester.tap(customButtonFinder);

      //Trigger a frame and wait until its settled
      await widgetTester.pumpAndSettle();

      //verify the advice is loaded
      expect(find.byType(AdviceField), findsOneWidget);
    });
  });
}
