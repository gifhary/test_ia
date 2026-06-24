import 'package:go_router/go_router.dart';
import 'package:test_ia/features/login/presentation/pages/login_page.dart';

class RouteConfig {
  static GoRouter appRoute = GoRouter(
    initialLocation: login,
    routes: [GoRoute(path: login, builder: (ctx, state) => const LoginPage())],
  );

  static const String login = '/login';
  static const String dashboard = '/dashboard';
}
