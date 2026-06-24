import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class LocaleBase {
  late Map<String, dynamic> _data;
  late String _path;
  Future<void> load(String path) async {
    _path = path;
    final strJson = await rootBundle.loadString(path);
    _data = jsonDecode(strJson);
    initAll();
  }
  
  Map<String, String> getData(String group) {
    return Map<String, String>.from(_data[group]);
  }

  String getPath() => _path;

  late Localemain _main;
  Localemain get main => _main;
  late LocaleappException _appException;
  LocaleappException get appException => _appException;

  void initAll() {
    _main = Localemain(Map<String, String>.from(_data['main']));
    _appException = LocaleappException(Map<String, String>.from(_data['appException']));
  }
}

class Localemain {
  late final Map<String, String> _data;
  Localemain(this._data);

  String getByKey(String key) {
    return _data[key]!;
  }

  String get example => _data["example"]!;
}

class LocaleappException {
  late final Map<String, String> _data;
  LocaleappException(this._data);

  String getByKey(String key) {
    return _data[key]!;
  }

  String get defaultException => _data["defaultException"]!;
  String get internetConnectionException => _data["internetConnectionException"]!;
  String get serverException => _data["serverException"]!;
}

