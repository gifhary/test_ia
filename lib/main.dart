import 'package:test_ia/app.dart';
import 'package:test_ia/core/di/injector.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();
  runApp(const App());
}
