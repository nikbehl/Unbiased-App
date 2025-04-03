import 'package:flutter/material.dart';
import 'package:frontend_dev_guide/pages/detail_page.dart';

class TagSection extends StatelessWidget {
  const TagSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _buildTag(context, 'JavaScript', 'Language'),
        _buildTag(context, 'Web Development', 'Concept'),
        _buildTag(context, 'Frontend', 'Category'),
        _buildTag(context, 'React', 'Framework'),
      ],
    );
  }

  Widget _buildTag(BuildContext context, String tag, String category) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              title: tag,
              category: category,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          tag,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
