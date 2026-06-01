import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:panuncialman_todo/config/config.dart';
import 'package:panuncialman_todo/config/routes/route.dart';


class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref ) {
    final routerConfig = ref.watch(routesProvider);
    
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Task It Easy',
      theme: AppTheme.lightTheme,
      routerConfig: routerConfig,
    );
  }
}

