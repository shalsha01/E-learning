import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;

  const CategoriesWidget({
    super.key,
    required this.categories,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final selected = index == selectedIndex;
          return ChoiceChip(
            label: Text(categories[index]),
            selected: selected,
            onSelected: (_) {},
            selectedColor: Colors.blue,
            labelStyle: TextStyle(
              color: selected ? Colors.white : Colors.black,
            ),
            backgroundColor: Colors.grey.shade200,
          );
        },
      ),
    );
  }
}
