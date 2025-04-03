import 'package:flutter/material.dart';
import '../pages/detail_page.dart'; // Import the DetailPage

class TechSearchDelegate extends SearchDelegate<String> {
  final List<String> _techItems = [
    'HTML5',
    'CSS3',
    'JavaScript',
    'TypeScript',
    'React',
    'Angular',
    'Vue.js',
    'Svelte',
    'Next.js',
    'Redux',
    'MobX',
    'GraphQL',
    'REST API',
    'Tailwind CSS',
    'Styled Components',
    'Webpack',
    'Vite',
    'Jest',
    'Cypress',
    'Git',
    'GitHub',
    'Node.js',
    'Express',
    'PWA',
    'Web Components',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _techItems
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            close(context, results[index]);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  title: results[index],
                  category: _getCategoryForTech(results[index]),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? _techItems.sublist(0, 5) // Show top 5 items when query is empty
        : _techItems
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.search),
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }

  String _getCategoryForTech(String tech) {
    // Simple mapping logic - in a real app this would be more sophisticated
    if (['HTML5', 'CSS3', 'JavaScript', 'TypeScript'].contains(tech)) {
      return 'Language';
    } else if (['React', 'Angular', 'Vue.js', 'Svelte', 'Next.js']
        .contains(tech)) {
      return 'Framework';
    } else if (['Redux', 'MobX'].contains(tech)) {
      return 'State Management';
    } else if (['Tailwind CSS', 'Styled Components'].contains(tech)) {
      return 'Styling';
    } else if (['Webpack', 'Vite'].contains(tech)) {
      return 'Build Tool';
    } else if (['Jest', 'Cypress'].contains(tech)) {
      return 'Testing';
    } else if (['Git', 'GitHub'].contains(tech)) {
      return 'Version Control';
    } else if (['GraphQL', 'REST API'].contains(tech)) {
      return 'API';
    }
    return 'Other';
  }
}
