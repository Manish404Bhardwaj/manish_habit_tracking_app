import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:manish_habit_tracking_app/presentation/router/routes_name.dart';
import 'package:manish_habit_tracking_app/presentation/screens/home_screen.dart';
import 'package:manish_habit_tracking_app/presentation/screens/create_habit_screen.dart';
import 'package:manish_habit_tracking_app/presentation/screens/splash_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(initialLocation: RoutesName.splash.path(), routes: [
    GoRoute(
        path: RoutesName.splash.path(),
        name: RoutesName.splash,
        builder: (context, state) {
          return const SplashScreen();
        }),
    GoRoute(
        path: '${RoutesName.home.path()}/:userName',
        name: RoutesName.home,
        builder: (context, state) {
          final data = state.pathParameters["userName"];
          return HomeScreen(
            userName: data!,
          );
        }),
    GoRoute(
        path: RoutesName.create.path(),
        name: RoutesName.create,
        builder: (context, state) {
          return CreateHabitScreen();
        }),
  ]);
});
