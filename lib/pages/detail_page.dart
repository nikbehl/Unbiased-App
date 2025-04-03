import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String category;

  const DetailPage({
    Key? key,
    required this.title,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border),
            onPressed: () {
              // Save to bookmarks
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Share functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                category,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Dynamic content based on the title
            Text(
              _getDescription(title),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              'Code Example',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _getCodeExample(title),
                style: const TextStyle(
                  fontFamily: 'monospace',
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Resources',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildResourceLink(
                'Official Documentation', _getDocumentationUrl(title)),
            _buildResourceLink('Tutorial', _getTutorialUrl(title)),
            _buildResourceLink('GitHub Repository', _getGithubUrl(title)),
            const SizedBox(height: 24),
            const Text(
              'Related Topics',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _getRelatedTopics(title, context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResourceLink(String title, String url) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () async {
          final Uri uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
        child: Row(
          children: [
            const Icon(Icons.link, color: Colors.blue),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(BuildContext context, String tag, String tagCategory) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              title: tag,
              category: tagCategory,
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

  // Helper methods to get dynamic content based on the topic
  String _getDescription(String topic) {
    switch (topic.toLowerCase()) {
      case 'javascript':
        return 'JavaScript is a scripting or programming language that allows you to implement complex features on web pages. It\'s an essential technology for frontend development, enabling interactive web pages and is a core pillar of web applications.';
      case 'web development':
        return 'Web development is the work involved in developing a website for the Internet or an intranet. It can range from developing a simple single static page of plain text to complex web applications, electronic businesses, and social network services.';
      case 'frontend':
        return 'Frontend development focuses on what users see on their screen. It involves implementing visual elements that users can interact with, ensuring a seamless user experience through HTML, CSS, and JavaScript.';
      case 'react':
        return 'React is a free and open-source front-end JavaScript library for building user interfaces based on UI components. It is maintained by Meta and a community of individual developers and companies.';
      default:
        return 'This is a detailed explanation of $topic. It would include comprehensive information about the technology, its features, benefits, and how it fits into the overall frontend development ecosystem.';
    }
  }

  String _getCodeExample(String topic) {
    switch (topic.toLowerCase()) {
      case 'javascript':
        return '// Basic JavaScript example\nfunction greet(name) \n\nconst result = greet(\'Developer\');\nconsole.log(result); // Output: Hello, Developer!';
      case 'react':
        return '// Simple React component\nimport React from \'react\';\n\nfunction Welcome(props) {\n  return <h1>Hello, {props.name}</h1>;\n}\n\nexport default function App() {\n  return (\n    <div>\n      <Welcome name="Developer" />\n    </div>\n  );\n}';
      default:
        return '// Example code would be here\nfunction example() {\n  return "This is a code example for $topic";\n}';
    }
  }

  String _getDocumentationUrl(String topic) {
    switch (topic.toLowerCase()) {
      case 'javascript':
        return 'https://developer.mozilla.org/en-US/docs/Web/JavaScript';
      case 'react':
        return 'https://react.dev/docs';
      default:
        return 'https://example.com/docs';
    }
  }

  String _getTutorialUrl(String topic) {
    switch (topic.toLowerCase()) {
      case 'javascript':
        return 'https://javascript.info/';
      case 'react':
        return 'https://react.dev/learn';
      default:
        return 'https://example.com/tutorial';
    }
  }

  String _getGithubUrl(String topic) {
    switch (topic.toLowerCase()) {
      case 'react':
        return 'https://github.com/facebook/react';
      default:
        return 'https://github.com/topics/$topic';
    }
  }

  List<Widget> _getRelatedTopics(String topic, BuildContext context) {
    switch (topic.toLowerCase()) {
      case 'javascript':
        return [
          _buildTag(context, 'TypeScript', 'Language'),
          _buildTag(context, 'Node.js', 'Runtime'),
          _buildTag(context, 'ES6', 'Standard'),
          _buildTag(context, 'DOM', 'API'),
        ];
      case 'react':
        return [
          _buildTag(context, 'JavaScript', 'Language'),
          _buildTag(context, 'JSX', 'Syntax'),
          _buildTag(context, 'Redux', 'State Management'),
          _buildTag(context, 'Hooks', 'Feature'),
        ];
      case 'frontend':
        return [
          _buildTag(context, 'HTML', 'Language'),
          _buildTag(context, 'CSS', 'Language'),
          _buildTag(context, 'JavaScript', 'Language'),
          _buildTag(context, 'Responsive Design', 'Concept'),
        ];
      default:
        return [
          _buildTag(context, 'JavaScript', 'Language'),
          _buildTag(context, 'Web Development', 'Concept'),
          _buildTag(context, 'Frontend', 'Category'),
          _buildTag(context, 'React', 'Framework'),
        ];
    }
  }
}
