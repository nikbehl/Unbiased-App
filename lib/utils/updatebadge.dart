// Badge to show when tech items have recent updates
import 'package:flutter/material.dart';

class UpdateBadge extends StatelessWidget {
  final DateTime lastUpdated;

  const UpdateBadge({Key? key, required this.lastUpdated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final difference = DateTime.now().difference(lastUpdated);
    final isNew = difference.inDays < 7;

    if (!isNew) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text(
        'NEW',
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
