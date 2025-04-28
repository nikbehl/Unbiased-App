import 'package:flutter/material.dart';
import 'package:frontend_dev_guide/pages/detail_page.dart';

class BackendTechSearchDelegate extends SearchDelegate<String> {
  final List<String> _backendTechItems = [
    'Node.js',
    'Express',
    'Django',
    'Flask',
    'Spring Boot',
    'ASP.NET Core',
    'Laravel',
    'Ruby on Rails',
    'NestJS',
    'PostgreSQL',
    'MongoDB',
    'MySQL',
    'Redis',
    'GraphQL',
    'REST API',
    'gRPC',
    'Microservices',
    'Docker',
    'Kubernetes',
    'AWS',
    'Azure',
    'Google Cloud',
    'JSON Web Tokens',
    'OAuth',
    'WebSockets',
    'Message Queues',
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
    final results = _backendTechItems
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
                  loadFromAi: true, // Load details from AI
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
        ? _backendTechItems.sublist(
            0, 5) // Show top 5 items when query is empty
        : _backendTechItems
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
    final techLower = tech.toLowerCase();

    if (techLower.contains('node') ||
        techLower.contains('express') ||
        techLower.contains('django') ||
        techLower.contains('flask') ||
        techLower.contains('spring') ||
        techLower.contains('asp.net') ||
        techLower.contains('rails') ||
        techLower.contains('laravel') ||
        techLower.contains('nestjs')) {
      return 'Framework';
    } else if (techLower.contains('sql') ||
        techLower.contains('mongo') ||
        techLower.contains('redis')) {
      return 'Database';
    } else if (techLower.contains('docker') ||
        techLower.contains('kubernetes')) {
      return 'Containerization';
    } else if (techLower.contains('aws') ||
        techLower.contains('azure') ||
        techLower.contains('cloud')) {
      return 'Cloud Service';
    } else if (techLower.contains('api') ||
        techLower.contains('graphql') ||
        techLower.contains('grpc') ||
        techLower.contains('rest')) {
      return 'API';
    } else if (techLower.contains('jwt') || techLower.contains('oauth')) {
      return 'Authentication';
    }

    return 'Backend Technology';
  }
}
