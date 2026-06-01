import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:panuncialman_todo/config/routes/route_location.dart';
import 'package:panuncialman_todo/providers/task/task.dart';
import 'package:panuncialman_todo/widgets/widgets.dart';
import '../data/data.dart';
import '../utils/extensions.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final taskState = ref.watch(taskProvider);
    final completedTasks = _completedTasks(taskState.tasks);
    final incompletedTasks = _incompletedTasks(taskState.tasks);

    final DateTime now = DateTime.now();
    final String date = DateFormat('EEEE: MMMM d, y').format(now);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DisplayWhiteText(
                      text: date,
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                    Gap(10),
                    DisplayWhiteText(
                      text: 'My Task List',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DisplayListOfTasks(tasks: incompletedTasks),
                  const Gap(20),
                  Text(
                    'Completed Tasks',
                    style: context.textTheme.headlineMedium,
                  ),
                  const Gap(20),
                  DisplayListOfTasks(
                    tasks: completedTasks,
                    isCompletedTasks: true,
                  ),
                  const Gap(20),
                  ElevatedButton(
                    // 🎯 FORCE the button background color to match your scheme
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colorScheme.primary,
                      foregroundColor: context
                          .colorScheme
                          .surface, // Changes text overlay color to clear white/contrast
                    ),
                    onPressed: () => context.push(RouteLocation.createTask),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: DisplayWhiteText(text: 'Add New Task'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Task> _completedTasks(List<Task> tasks) {
    final List<Task> filteredTask = [];

    for (var task in tasks) {
      if (task.isCompleted) {
        filteredTask.add(task);
      }
    }

    return filteredTask;
  }

  List<Task> _incompletedTasks(List<Task> tasks) {
    final List<Task> filteredTask = [];

    for (var task in tasks) {
      if (!task.isCompleted) {
        filteredTask.add(task);
      }
    }

    return filteredTask;
  }
}
