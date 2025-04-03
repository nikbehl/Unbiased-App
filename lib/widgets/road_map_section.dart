import 'package:flutter/material.dart';
import 'package:frontend_dev_guide/widgets/road_map_item.dart';

class RoadmapSection extends StatelessWidget {
  final String title;
  final List<RoadmapItem> items;

  const RoadmapSection({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ...items, // Spread the items list into the column children
      ],
    );
  }
}
