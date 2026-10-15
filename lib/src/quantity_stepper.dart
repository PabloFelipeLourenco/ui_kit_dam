import 'package:flutter/material.dart';
/// Muestra una cantidad que se puede aumentar o disminuir mediante botones
class QuantityStepper extends StatefulWidget {
  /// Crea un selector de cantidad con los límites y el valor inicial indicados
  const QuantityStepper({
    super.key,
    this.min = 0,
    this.max = 10,
    this.step = 1,
    int? initialValue,
    this.semanticLabel = 'Cantidad',
    this.decrementTooltip = 'Restar',
    this.incrementTooltip = 'Sumar',
    this.onChanged,
    this.onLimitReached,
  }) : initialValue = initialValue ?? min,
       assert(min < max),
       assert(step > 0),
       assert(initialValue == null ||
           (initialValue >= min && initialValue <= max));

  /// Valor mínimo permitido.
  final int min;

  /// Valor máximo permitido.
  final int max;

  /// Cantidad que se suma o se resta en cada pulsación.
  final int step;

  /// Valor inicial del componente.
  final int initialValue;

  /// Etiqueta accesible del componente.
  final String semanticLabel;

  /// Texto de ayuda del botón para restar.
  final String decrementTooltip;

  /// Texto de ayuda del botón para sumar.
  final String incrementTooltip;

  /// Función que se ejecuta cuando cambia el valor.
  final ValueChanged<int>? onChanged;

  /// Función que se ejecuta al alcanzar un límite.
  final LimitReached? onLimitReached;

  @override
  State<QuantityStepper> createState() => _QuantityStepperState();
}

/// Límite que se ha alcanzado al cambiar la cantidad
enum StepperLimit {
  /// Indica que se ha alcanzado el límite mínimo
  min,

  /// Indica que se ha alcanzado el límite máximo
  max,
}

/// Función que se ejecuta cuando el selector alcanza un límite
typedef LimitReached = void Function(StepperLimit limit);

/// Calcula el siguiente valor paso a paso, fijado entre [min] y [max]
int nextStepperValue({
  required int current,
  required int delta,
  required int min,
  required int max,
}) {
  final nuevoValor = current + delta;

  if (nuevoValor < min) {
    return min;
  }

  if (nuevoValor > max) {
    return max;
  }

  return nuevoValor;
}

class _QuantityStepperState extends State<QuantityStepper> {
  late int cantidad;

  @override
  void initState() {
    super.initState();
    cantidad = widget.initialValue;
  }

  @override
  void didUpdateWidget(covariant QuantityStepper oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initialValue != oldWidget.initialValue) {
      cantidad = widget.initialValue;
    } else {
      cantidad = cantidad.clamp(widget.min, widget.max);
    }
  }

  void cambiarCantidad(int delta) {
    final nuevoValor = nextStepperValue(
      current: cantidad,
      delta: delta,
      min: widget.min,
      max: widget.max,
    );

    if (nuevoValor == cantidad) {
      return;
    }

    setState(() {
      cantidad = nuevoValor;
    });

    widget.onChanged?.call(cantidad);

    if (cantidad == widget.min) {
      widget.onLimitReached?.call(StepperLimit.min);
    } else if (cantidad == widget.max) {
      widget.onLimitReached?.call(StepperLimit.max);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticLabel,
      value: '$cantidad',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            tooltip: widget.decrementTooltip,
            icon: const Icon(Icons.remove),
            onPressed: cantidad <= widget.min
                ? null
                : () => cambiarCantidad(-widget.step),
          ),
          Text('$cantidad'),
          IconButton(
            tooltip: widget.incrementTooltip,
            icon: const Icon(Icons.add),
            onPressed: cantidad >= widget.max
                ? null
                : () => cambiarCantidad(widget.step),
          ),
        ],
      ),
    );
  }
}