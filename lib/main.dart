import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:manish_habit_tracking_app/data/habit_hive_repo.dart';
import 'package:manish_habit_tracking_app/presentation/router/router_provider.dart';

Future main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  HiveRepo().registerAdaptor();
  runApp(const ProviderScope(child: RoutesHandler()));
}

class RoutesHandler extends ConsumerWidget {
  const RoutesHandler({super.key});

  @override
  Widget build(Object context, WidgetRef ref) {
    final routesConfig = ref.watch(goRouterProvider);

    return MaterialApp.router(
      routerConfig: routesConfig,
    );
  }
}
