import 'package:auto_route/auto_route.dart';
import 'package:movie_app/shared/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SignInRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
      ];
}
