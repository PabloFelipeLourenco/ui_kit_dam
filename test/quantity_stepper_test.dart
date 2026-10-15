import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit_dam/ui_kit_dam.dart';

void main() {
  test('Suma una unidad', () {
    expect(
      nextStepperValue(
        current: 2,
        delta: 1,
        min: 0,
        max: 10,
      ),
      3,
    );
  });

  test('Resta una unidad', () {
    expect(
      nextStepperValue(
        current: 2,
        delta: -1,
        min: 0,
        max: 10,
      ),
      1,
    );
  });

  test('No baja del mínimo', () {
    expect(
      nextStepperValue(
        current: 0,
        delta: -1,
        min: 0,
        max: 10,
      ),
      0,
    );
  });

  test('No supera el máximo', () {
    expect(
      nextStepperValue(
        current: 10,
        delta: 1,
        min: 0,
        max: 10,
      ),
      10,
    );
  });
}