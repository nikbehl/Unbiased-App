import 'package:flutter/material.dart';

class TechStackDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String level;
  final List<String> resources;
  final List<String> tutorials;
  final List<String> libraries;

  const TechStackDetailPage({
    Key? key,
    required this.title,
    required this.description,
    required this.level,
    this.resources = const [],
    this.tutorials = const [],
    this.libraries = const [],
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
              // Implement bookmark functionality
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$title added to bookmarks')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Implement share functionality
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Sharing $title information')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Chip(
                          label: Text(
                            level,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: _getLevelColor(level),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Resources Section
            if (resources.isNotEmpty) ...[
              _buildSectionTitle('Resources'),
              _buildListItems(resources, Icons.link),
              const SizedBox(height: 16),
            ],

            // Tutorials Section
            if (tutorials.isNotEmpty) ...[
              _buildSectionTitle('Tutorials'),
              _buildListItems(tutorials, Icons.play_circle_outline),
              const SizedBox(height: 16),
            ],

            // Libraries/Tools Section
            if (libraries.isNotEmpty) ...[
              _buildSectionTitle('Libraries & Tools'),
              _buildListItems(libraries, Icons.code),
              const SizedBox(height: 16),
            ],

            // Community Section
            _buildSectionTitle('Community'),
            _buildCommunitySection(),

            const SizedBox(height: 24),

            // Related Technologies
            _buildSectionTitle('Related Technologies'),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _buildRelatedTechnologies(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildListItems(List<String> items, IconData icon) {
    return Column(
      children: items.map((item) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          child: ListTile(
            leading: Icon(icon),
            title: Text(item),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle item tap if needed
            },
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCommunitySection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Join the discussion with other developers!',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCommunityButton(Icons.forum, 'Forums'),
                _buildCommunityButton(Icons.discord, 'Discord'),
                _buildCommunityButton(Icons.reddit, 'Reddit'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommunityButton(IconData icon, String label) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: () {
            // Handle community button press
          },
          iconSize: 30,
        ),
        Text(label),
      ],
    );
  }

  List<Widget> _buildRelatedTechnologies() {
    // This would ideally be dynamic based on the selected technology
    List<Map<String, String>> relatedTech = [];

    if (title == 'React') {
      relatedTech = [
        {'name': 'Next.js', 'category': 'Framework'},
        {'name': 'Redux', 'category': 'State Management'},
        {'name': 'React Router', 'category': 'Routing'},
        {'name': 'React Query', 'category': 'Data Fetching'},
      ];
    } else if (title == 'TypeScript') {
      relatedTech = [
        {'name': 'JavaScript', 'category': 'Language'},
        {'name': 'Angular', 'category': 'Framework'},
        {'name': 'NestJS', 'category': 'Backend'},
        {'name': 'Deno', 'category': 'Runtime'},
      ];
    } else {
      // Default related technologies
      relatedTech = [
        {'name': 'JavaScript', 'category': 'Language'},
        {'name': 'React', 'category': 'Framework'},
        {'name': 'Vue.js', 'category': 'Framework'},
        {'name': 'Angular', 'category': 'Framework'},
      ];
    }

    return relatedTech.map((tech) {
      return Container(
        width: 120,
        margin: const EdgeInsets.only(right: 8.0),
        child: Card(
          child: InkWell(
            onTap: () {
              // Navigation to related technology detail page would go here
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tech['name']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    tech['category']!,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  Color _getLevelColor(String level) {
    switch (level.toLowerCase()) {
      case 'fundamental':
      case 'beginner':
        return Colors.green;
      case 'intermediate':
      case 'growing':
        return Colors.blue;
      case 'advanced':
      case 'trending':
        return Colors.purple;
      case 'popular':
      case 'established':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}

// Updated TechItem widget with navigation
class TechItem extends StatelessWidget {
  final String title;
  final String description;
  final String level;

  const TechItem({
    Key? key,
    required this.title,
    required this.description,
    required this.level,
    required String version,
    required DateTime lastUpdated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          // Navigate to detail page when clicked
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TechStackDetailPage(
                title: title,
                description: description,
                level: level,
                resources: _getResourcesForTech(title),
                tutorials: _getTutorialsForTech(title),
                libraries: _getLibrariesForTech(title),
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Chip(
                    label: Text(
                      level,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: _getLevelColor(level),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(description),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    'Learn more',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.blue,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getLevelColor(String level) {
    switch (level.toLowerCase()) {
      case 'fundamental':
      case 'beginner':
        return Colors.green;
      case 'intermediate':
      case 'growing':
        return Colors.blue;
      case 'advanced':
      case 'trending':
        return Colors.purple;
      case 'popular':
      case 'established':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  // Sample data generator functions - in a real app, this would come from a database or API
  List<String> _getResourcesForTech(String tech) {
    switch (tech) {
      case 'HTML5':
        return [
          'MDN HTML Guide',
          'W3Schools HTML Tutorial',
          'HTML5 Rocks',
          'HTML Living Standard',
        ];
      case 'CSS3':
        return [
          'MDN CSS Guide',
          'CSS-Tricks',
          'W3Schools CSS Tutorial',
          'CSS Reference',
        ];
      case 'JavaScript':
        return [
          'MDN JavaScript Guide',
          'JavaScript.info',
          'Eloquent JavaScript',
          'You Don\'t Know JS',
        ];
      case 'TypeScript':
        return [
          'TypeScript Handbook',
          'TypeScript Deep Dive',
          'Official TypeScript Documentation',
          'TypeScript Playground',
        ];
      case 'React':
        return [
          'React Documentation',
          'React Patterns',
          'React GitHub Repository',
          'React Dev Tools',
        ];
      default:
        return [
          'Official Documentation',
          'GitHub Repository',
          'Community Forums',
          'Online Tutorials',
        ];
    }
  }

  List<String> _getTutorialsForTech(String tech) {
    switch (tech) {
      case 'HTML5':
        return [
          'Build Your First Web Page',
          'HTML5 Semantic Elements',
          'Forms and Validation',
          'HTML5 APIs and Features',
        ];
      case 'CSS3':
        return [
          'CSS Layouts Masterclass',
          'Flexbox Complete Guide',
          'CSS Grid Tutorial',
          'CSS Animations and Transitions',
        ];
      case 'JavaScript':
        return [
          'JavaScript Fundamentals',
          'Asynchronous JavaScript',
          'Object-Oriented JavaScript',
          'ES6 and Beyond',
        ];
      case 'TypeScript':
        return [
          'TypeScript for Beginners',
          'Converting JavaScript to TypeScript',
          'Advanced Types in TypeScript',
          'TypeScript with React',
        ];
      case 'React':
        return [
          'React Hooks Tutorial',
          'Building a React App from Scratch',
          'State Management in React',
          'Testing React Applications',
        ];
      default:
        return [
          'Getting Started',
          'Intermediate Concepts',
          'Advanced Techniques',
          'Real-world Applications',
        ];
    }
  }

  List<String> _getLibrariesForTech(String tech) {
    switch (tech) {
      case 'HTML5':
        return [
          'Bootstrap',
          'Foundation',
          'HTML5 Boilerplate',
          'Modernizr',
        ];
      case 'CSS3':
        return [
          'Tailwind CSS',
          'Sass/SCSS',
          'PostCSS',
          'Styled Components',
        ];
      case 'JavaScript':
        return [
          'jQuery',
          'Lodash',
          'Moment.js',
          'Axios',
        ];
      case 'TypeScript':
        return [
          'TSLint',
          'ts-node',
          'TypeORM',
          'TypeDI',
        ];
      case 'React':
        return [
          'Redux',
          'React Router',
          'React Query',
          'Material-UI',
        ];
      default:
        return [
          'Popular Library 1',
          'Popular Library 2',
          'Popular Library 3',
          'Popular Library 4',
        ];
    }
  }
}
