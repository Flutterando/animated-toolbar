import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.macOS;

  runApp(ModularApp(module: AppModule()));
}
