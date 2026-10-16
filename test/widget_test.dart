import 'package:flutter_test/flutter_test.dart';

import 'package:la_famiglia_app/main.dart';

void main() {
  testWidgets('App shows the home screen title', (WidgetTester tester) async {
    await tester.pumpWidget(const LaFamigliaApp());

    expect(find.text('La Famiglia se sienta a la mesa'), findsOneWidget);
  });
}
