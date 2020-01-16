// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_app_bar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CustomAppBarController on _CustomAppBarBase, Store {
  final _$selectedIdAtom = Atom(name: '_CustomAppBarBase.selectedId');

  @override
  int get selectedId {
    _$selectedIdAtom.context.enforceReadPolicy(_$selectedIdAtom);
    _$selectedIdAtom.reportObserved();
    return super.selectedId;
  }

  @override
  set selectedId(int value) {
    _$selectedIdAtom.context.conditionallyRunInAction(() {
      super.selectedId = value;
      _$selectedIdAtom.reportChanged();
    }, _$selectedIdAtom, name: '${_$selectedIdAtom.name}_set');
  }

  final _$_CustomAppBarBaseActionController =
      ActionController(name: '_CustomAppBarBase');

  @override
  void setSelectedId(int newId) {
    final _$actionInfo = _$_CustomAppBarBaseActionController.startAction();
    try {
      return super.setSelectedId(newId);
    } finally {
      _$_CustomAppBarBaseActionController.endAction(_$actionInfo);
    }
  }
}
