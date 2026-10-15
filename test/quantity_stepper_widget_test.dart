import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit_dam/ui_kit_dam.dart';

void main() {
  testWidgets('Sumar cambia el valor y emite onChanged', (tester) async {
    int? valorRecibido;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QuantityStepper(
            initialValue: 2,
            onChanged: (valor) {
              valorRecibido = valor;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('3'), findsOneWidget);
    expect(valorRecibido, 3);
  });

  testWidgets('Restar está desactivado en el mínimo', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: QuantityStepper(
            min: 0,
            max: 10,
            initialValue: 0,
          ),
        ),
      ),
    );

    final boton = tester.widget<IconButton>(
      find.widgetWithIcon(IconButton, Icons.remove),
    );

    expect(boton.onPressed, isNull);
  });

  testWidgets('onLimitReached recibe max', (tester) async {
    StepperLimit? limiteRecibido;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QuantityStepper(
            min: 0,
            max: 3,
            initialValue: 2,
            onLimitReached: (limite) {
              limiteRecibido = limite;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(limiteRecibido, StepperLimit.max);
  });
}