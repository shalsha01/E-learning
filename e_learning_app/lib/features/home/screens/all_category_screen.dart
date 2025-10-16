import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


@RoutePage()
class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final categories = [
      '3D Design',
      'Graphic Design',
      'Web Development',
      'SEO & Marketing',
      'Finance & Accounting',
      'Personal Development',
      'Office Productivity',
      'HR Management',
    ];
    

    return Scaffold(
      appBar: AppBar(
        title: const Text("All Category"),
        leading: BackButton(color: colorScheme.onSurface),
        backgroundColor: colorScheme.surface,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search for..",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: colorScheme.onPrimary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Column(

                    mainAxisSize: MainAxisSize.min,
                     children: [
                      Container(
                        width: 72,
                        height: 72,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: _getCategoryImage(category),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        category,
                        textAlign: TextAlign.center,
                        style: textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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

  Widget _getCategoryImage(String category) {
    switch (category) {
      case '3D Design':
        return SvgPicture.asset('assets/icons/3d_design.svg');
      case 'Graphic Design':
        return SvgPicture.asset('assets/icons/graphic_design.svg');
      case 'Web Development':
        return SvgPicture.asset('assets/icons/web_dev.svg');
      case 'SEO & Marketing':
        return SvgPicture.asset('assets/icons/seo.svg');
      case 'Finance & Accounting':
        return SvgPicture.asset('assets/icons/finance.svg');
      case 'Personal Development':
        return SvgPicture.asset('assets/icons/personal_dev.svg');
      case 'Office Productivity':
        return SvgPicture.asset('assets/icons/office.svg');
      case 'HR Management':
        return SvgPicture.asset('assets/icons/hr.svg');
      default:
        return Image.asset('assets/icons/app_icon.png');
    }
  }
}
