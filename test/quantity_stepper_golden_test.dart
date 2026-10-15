import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit_dam/ui_kit_dam.dart';

void main() {
  testWidgets('QuantityStepper con valor 5', (tester) async {
    await tester.binding.setSurfaceSize(const Size(300, 100));

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: QuantityStepper(
              min: 0,
              max: 10,
              initialValue: 5,
            ),
          ),
        ),
      ),
    );

    await expectLater(
      find.byType(QuantityStepper),
      matchesGoldenFile('goldens/quantity_stepper.png'),
    );

    await tester.binding.setSurfaceSize(null);
  });
}