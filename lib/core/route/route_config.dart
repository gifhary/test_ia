import 'package:go_router/go_router.dart';
import 'package:test_ia/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:test_ia/features/login/presentation/pages/login_page.dart';
import 'package:test_ia/features/splash/presentation/pages/splash_page.dart';

class RouteConfig {
  static GoRouter appRoute = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(path: splash, builder: (ctx, state) => const SplashPage()),
      GoRoute(path: login, builder: (ctx, state) => const LoginPage()),
      GoRoute(path: dashboard, builder: (ctx, state) => const DashboardPage()),
    ],
  );

  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String splash = '/splash';
}
