import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unguided_tp04/main.dart';

void main() {
  testWidgets('Check if Wisata Banyumas Page loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify if the app bar title is present.
    expect(find.text('Rekomendasi Wisata Banyumas'), findsOneWidget);

    // Verify if at least one wisata card is present.
    expect(find.byType(Card), findsWidgets);

    // Check if the first wisata title is present in the list.
    expect(find.text('Pantai Nusakambangan'), findsOneWidget);
  });
}
