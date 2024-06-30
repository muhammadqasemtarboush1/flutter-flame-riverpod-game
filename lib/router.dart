import 'package:go_game/game/screen/game_screen.dart';
import 'package:go_game/game/screen/menu_screen.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  menu,
  game,
}

GoRouter goRouter() {
  return GoRouter(initialLocation: '/menu', routes: <RouteBase>[
    GoRoute(
      path: '/game',
      name: AppRoute.game.name,
      builder: (context, state) {
        return const GameScreen();
      },
    ),
    GoRoute(
      path: '/menu',
      name: AppRoute.menu.name,
      builder: (context, state) {
        return const MenuScreen();
      },
    ),
  ]);
}
