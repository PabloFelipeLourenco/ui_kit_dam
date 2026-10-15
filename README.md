<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.

## QuantityStepper

`QuantityStepper` es un componente que permite aumentar o disminuir una cantidad dentro de un rango.

### Ejemplo de uso

```dart
QuantityStepper(
  min: 1,
  max: 8,
  initialValue: 1,
  step: 1,
  onChanged: (valor) {
    print(valor);
  },
)
```

### Propiedades principales

- `min`: cantidad mínima permitida.
- `max`: cantidad máxima permitida.
- `step`: incremento o decremento.
- `initialValue`: cantidad inicial.
- `semanticLabel`: etiqueta accesible.
- `decrementTooltip`: texto de ayuda del botón de restar.
- `incrementTooltip`: texto de ayuda del botón de sumar.
- `onChanged`: evento que comunica el nuevo valor.
- `onLimitReached`: evento que informa de la llegada a un límite.