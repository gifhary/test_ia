import 'package:test_ia/app.dart';
import 'package:test_ia/core/di/injector.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  runApp(const App());
}
