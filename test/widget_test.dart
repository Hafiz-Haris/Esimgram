import 'package:flutter_test/flutter_test.dart';

import 'package:esimgram/main.dart';

void main() {
  testWidgets('app loads home screen content', (WidgetTester tester) async {
    await tester.pumpWidget(const EsimgramApp());

    expect(find.text('Good day, traveller'), findsOneWidget);
    expect(find.text('Stay connected.'), findsOneWidget);
    expect(find.text('Quick actions'), findsOneWidget);
  });
}
