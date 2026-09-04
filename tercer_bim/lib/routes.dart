import 'package:go_router/go_router.dart';
import 'entities/player.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/player_screen.dart';
import 'screens/player_detail_screen.dart';
import 'screens/add_player_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/players',
      builder: (context, state) => const PlayerScreen(),
    ),
    GoRoute(
      path: '/detail',
      builder: (context, state) {
        final player = state.extra as Player;
        return PlayerDetailScreen(player: player);
      },
    ),
    GoRoute(
      path: '/add',
      builder: (context, state) {
        final player = state.extra as Player?;
        return AddPlayerScreen(player: player);
      },
    ),
  ],
);