import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wisata_app/main.dart';

void main() {
  testWidgets('Wisata app displays correct information', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the title in the AppBar is correct.
    expect(find.text('Rekomendasi Wisata'), findsOneWidget);

    // Verify that the initial text (Nama Tempat Wisata) is displayed.
    expect(find.text('Nama Tempat Wisata'), findsOneWidget);

    // Verify that the button 'Kunjungi Tempat' is displayed.
    expect(find.text('Kunjungi Tempat'), findsOneWidget);
  });
}
