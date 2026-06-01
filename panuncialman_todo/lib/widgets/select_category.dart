import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:panuncialman_todo/providers/providers.dart';
import 'package:panuncialman_todo/utils/extensions.dart';
import 'package:panuncialman_todo/utils/utils.dart';
import 'package:panuncialman_todo/widgets/widgets.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(categoryProvider);
    final categories = TaskCategories.values.toList();

    final colors = context.colorScheme;

    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text('Category', style: context.textTheme.titleLarge),
          const Gap(10),
          Expanded(
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = category == selectedCategory;
                print(category.color);
                return InkWell(
                  onTap: () {
                    ref.read(categoryProvider.notifier).state = category;
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: CircleContainer(
                    color: isSelected 
                        ? category.color.withOpacity(0.2) // Soft colorful ring tint
                        : colors.surfaceContainerHighest.withOpacity(0.5),
                    child: Icon(
                      category.icon,
                      color: isSelected 
                          ? category.color // Vibrant color when selected
                          : colors.onSurfaceVariant.withOpacity(0.6),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Gap(8),
            ),
          ),
        ],
      ),
    );
  }
}
