import 'package:flutter/material.dart';
import 'package:e_learning_app/features/home/models/mentor_model.dart';

class TopMentorsWidget extends StatelessWidget {
  final List<Mentor> mentors;

  const TopMentorsWidget({
    super.key,
    required this.mentors,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: mentors.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final mentor = mentors[index];
          return Column(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(mentor.imageUrl),
              ),
              const SizedBox(height: 6),
              Text(
                mentor.name,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          );
        },
      ),
    );
  }
}
