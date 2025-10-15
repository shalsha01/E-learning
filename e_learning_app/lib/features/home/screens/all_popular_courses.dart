import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:e_learning_app/features/home/widgets/popular_courses_widget.dart';
import 'package:e_learning_app/features/home/widgets/popular_courses_categories.dart';


@RoutePage()
class AllCoursesPage extends StatelessWidget {
  const AllCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
 
    

    return Scaffold(
      appBar: AppBar(
        title: const Text("All Popular Courses"),
        leading: BackButton(color: colorScheme.onSurface),
        backgroundColor: colorScheme.surface,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                 
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     
                      const SizedBox(height: 8),
                      
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}