import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:panuncialman_todo/providers/providers.dart';
import '../../data/data.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(taskRepositoryProvider);

  return TaskNotifier(repository);
});
