import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(obfuscate: false, varName: 'SHOW_DEBUG_INFO')
  static bool showDebugInfo = _Env.showDebugInfo;
  @EnviedField(obfuscate: true, varName: 'API_ENDPOINT')
  static String apiEndpoint = _Env.apiEndpoint;
}
