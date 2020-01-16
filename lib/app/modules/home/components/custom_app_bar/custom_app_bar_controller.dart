import 'package:desafio_options/app/shared/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'custom_app_bar_controller.g.dart';

class CustomAppBarController = _CustomAppBarBase with _$CustomAppBarController;

abstract class _CustomAppBarBase with Store {
  @observable
  int selectedId = 0;

  @action
  void setSelectedId(int newId) {
    selectedId = newId;
  }
}
