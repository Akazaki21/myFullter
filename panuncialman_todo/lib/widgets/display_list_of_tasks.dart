import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:panuncialman_todo/providers/providers.dart';
import 'package:panuncialman_todo/utils/extensions.dart';
import 'package:panuncialman_todo/data/data.dart';
import 'package:panuncialman_todo/utils/utils.dart';
import 'package:panuncialman_todo/widgets/task_details.dart';

import 'common_container.dart';
import 'task_tile.dart';

class DisplayListOfTasks extends ConsumerWidget {
  const DisplayListOfTasks({
    super.key,
    required this.tasks,
    this.isCompletedTasks = false,
  });
  final List<Task> tasks;
  final bool isCompletedTasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height = isCompletedTasks
        ? deviceSize.height * 0.25
        : deviceSize.height * 0.3;
    final emptyTasksMessage = isCompletedTasks
        ? 'No completed tasks yet!'
        : 'No pending tasks yet!';
    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emptyTasksMessage,
                style: context.textTheme.headlineSmall,
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return InkWell(
                  onLongPress: () {
                    AppAlerts.showDeleteAlertDialog(context, ref, task);
                  },
                  onTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return TaskDetails(task: task);
                      },
                    );
                  },
                  child: TaskTile(
                    task: task,
                    onCompleted: (value) async {
                      await ref
                          .read(taskProvider.notifier)
                          .updateTask(task)
                          .then((value) {
                            AppAlerts.displaySnackBar(
                              context,
                              task.isCompleted
                                  ? 'Task removed from being completed'
                                  : 'Task Completed',
                            );
                          });
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(thickness: 1.5);
              },
            ),
    );
  }
}
