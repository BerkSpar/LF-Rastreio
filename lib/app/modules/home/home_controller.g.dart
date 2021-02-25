// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$vehiclesAtom = Atom(name: '_HomeControllerBase.vehicles');

  @override
  List<Vehicle> get vehicles {
    _$vehiclesAtom.reportRead();
    return super.vehicles;
  }

  @override
  set vehicles(List<Vehicle> value) {
    _$vehiclesAtom.reportWrite(value, super.vehicles, () {
      super.vehicles = value;
    });
  }

  @override
  String toString() {
    return '''
vehicles: ${vehicles}
    ''';
  }
}
