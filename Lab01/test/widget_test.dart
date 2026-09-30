import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab01_vogialuong/main.dart';

void main() {
  testWidgets('I Am Rich screen displays its title and diamond',
      (WidgetTester tester) async {
    await tester.pumpWidget(const IamRich());

    expect(find.text("I'm Rich"), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}
