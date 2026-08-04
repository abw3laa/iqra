import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iqra/main.dart';

void main() {
  testWidgets('IqraApp builds and shows splash without crashing', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: IqraApp()));

    // إطار واحد فقط (بدون pumpAndSettle) لأن SplashPage يحتوي على مؤقّت
    // تنقل تلقائي؛ الهدف هنا فقط التأكد من نجاح البناء الأولي بلا استثناءات.
    await tester.pump();

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
