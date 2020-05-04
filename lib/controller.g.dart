// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerStore on Controller, Store {
  Computed<int> _$sizeComputed;

  @override
  int get size => (_$sizeComputed ??= Computed<int>(() => super.size)).value;

  final _$labelSelectedAtom = Atom(name: 'Controller.labelSelected');

  @override
  int get labelSelected {
    _$labelSelectedAtom.context.enforceReadPolicy(_$labelSelectedAtom);
    _$labelSelectedAtom.reportObserved();
    return super.labelSelected;
  }

  @override
  set labelSelected(int value) {
    _$labelSelectedAtom.context.conditionallyRunInAction(() {
      super.labelSelected = value;
      _$labelSelectedAtom.reportChanged();
    }, _$labelSelectedAtom, name: '${_$labelSelectedAtom.name}_set');
  }

  final _$pageSelectedAtom = Atom(name: 'Controller.pageSelected');

  @override
  int get pageSelected {
    _$pageSelectedAtom.context.enforceReadPolicy(_$pageSelectedAtom);
    _$pageSelectedAtom.reportObserved();
    return super.pageSelected;
  }

  @override
  set pageSelected(int value) {
    _$pageSelectedAtom.context.conditionallyRunInAction(() {
      super.pageSelected = value;
      _$pageSelectedAtom.reportChanged();
    }, _$pageSelectedAtom, name: '${_$pageSelectedAtom.name}_set');
  }

  final _$pagesAtom = Atom(name: 'Controller.pages');

  @override
  List<PageData> get pages {
    _$pagesAtom.context.enforceReadPolicy(_$pagesAtom);
    _$pagesAtom.reportObserved();
    return super.pages;
  }

  @override
  set pages(List<PageData> value) {
    _$pagesAtom.context.conditionallyRunInAction(() {
      super.pages = value;
      _$pagesAtom.reportChanged();
    }, _$pagesAtom, name: '${_$pagesAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'labelSelected: ${labelSelected.toString()},pageSelected: ${pageSelected.toString()},pages: ${pages.toString()},size: ${size.toString()}';
    return '{$string}';
  }
}
