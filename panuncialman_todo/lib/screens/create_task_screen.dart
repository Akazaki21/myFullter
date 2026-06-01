import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:panuncialman_todo/widgets/widgets.dart';
import 'package:panuncialman_todo/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/routes/route.dart';
import '../data/data.dart';
import '../providers/providers.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();
  const CreateTaskScreen({super.key});

  @override
  ConsumerState<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const DisplayWhiteText(text: 'Add New Task')),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(
                title: 'Task Title',
                hintText: 'TaskTitle',
                controller: _titleController,
              ),
              const Gap(16),
              const SelectCategory(),
              const Gap(16),
              const SelectDateTime(),
              const Gap(16),
              CommonTextField(
                title: 'Note',
                hintText: 'Task Note',
                maxLines: 6,
                controller: _noteController,
              ),
              const Gap(40),
              ElevatedButton(
                onPressed: _createTask,
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colorScheme.primary,
                  foregroundColor: context.colorScheme.surface, // Changes text overlay color to clear white/contrast
                ),
                child: const DisplayWhiteText(text: 'Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createTask() async {
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final category = ref.watch(categoryProvider);

    if (title.isNotEmpty) {
      final task = Task(
        title: title,
        note: note,
        date: DateFormat.yMMMd().format(date),
        time: Helpers.timeToString(time),
        category: category,
      );

      await ref.read(taskProvider.notifier).createTask(task).then((value) {
        AppAlerts.displaySnackBar(context, 'Task created Successfully');
        context.go(RouteLocation.home);
      });
    }else{
      AppAlerts.displaySnackBar(context, 'Task title cannot be empty');
    }
  }
}
