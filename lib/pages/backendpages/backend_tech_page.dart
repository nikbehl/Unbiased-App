// Create a file: backend_tech_page.dart

import 'package:flutter/material.dart';
import 'package:frontend_dev_guide/widgets/tech_item.dart';
import 'package:frontend_dev_guide/pages/detail_page.dart';

class BackendTechPage extends StatelessWidget {
  const BackendTechPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                isScrollable: true,
                tabs: [
                  Tab(text: 'Languages'),
                  Tab(text: 'Frameworks'),
                  Tab(text: 'Databases'),
                  Tab(text: 'APIs'),
                  Tab(text: 'Cloud & DevOps'),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildLanguagesTab(context),
            _buildFrameworksTab(context),
            _buildDatabasesTab(context),
            _buildApisTab(context),
            _buildCloudDevOpsTab(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTechItemWithNavigation(
    BuildContext context,
    String title,
    String description,
    String level,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              title: title,
              category: _getCategoryForTech(title),
              loadFromAi: true, // Load details from AI
            ),
          ),
        );
      },
      child: TechItem(
        title: title,
        description: description,
        level: level,
      ),
    );
  }

  Widget _buildLanguagesTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildTechItemWithNavigation(
          context,
          'JavaScript (Node.js)',
          'Server-side JavaScript runtime built on Chrome\'s V8 JavaScript engine.',
          'Fundamental',
        ),
        _buildTechItemWithNavigation(
          context,
          'Python',
          'Interpreted, high-level, general-purpose programming language with simple, readable syntax.',
          'Popular',
        ),
        _buildTechItemWithNavigation(
          context,
          'Java',
          'Object-oriented programming language used for enterprise-grade applications.',
          'Enterprise',
        ),
        _buildTechItemWithNavigation(
          context,
          'C#',
          'Multi-paradigm programming language developed by Microsoft for the .NET platform.',
          'Enterprise',
        ),
        _buildTechItemWithNavigation(
          context,
          'Go',
          'Statically typed, compiled language designed for simplicity, reliability, and efficiency.',
          'Growing',
        ),
        _buildTechItemWithNavigation(
          context,
          'Rust',
          'Systems programming language focused on safety, speed, and concurrency.',
          'Trending',
        ),
        _buildTechItemWithNavigation(
          context,
          'PHP',
          'Server-side scripting language designed for web development.',
          'Widespread',
        ),
        _buildTechItemWithNavigation(
          context,
          'Ruby',
          'Dynamic, open source programming language focused on simplicity and productivity.',
          'Established',
        ),
      ],
    );
  }

  Widget _buildFrameworksTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildTechItemWithNavigation(
          context,
          'Express.js',
          'Fast, unopinionated, minimalist web framework for Node.js.',
          'Popular',
        ),
        _buildTechItemWithNavigation(
          context,
          'Django',
          'High-level Python web framework that encourages rapid development and clean, pragmatic design.',
          'Established',
        ),
        _buildTechItemWithNavigation(
          context,
          'Spring Boot',
          'Java-based framework used to create microservices and stand-alone applications.',
          'Enterprise',
        ),
        _buildTechItemWithNavigation(
          context,
          'ASP.NET Core',
          'Cross-platform, high-performance framework for building modern, cloud-based, Internet-connected applications.',
          'Enterprise',
        ),
        _buildTechItemWithNavigation(
          context,
          'Laravel',
          'PHP web application framework with expressive, elegant syntax.',
          'Popular',
        ),
        _buildTechItemWithNavigation(
          context,
          'Flask',
          'Lightweight WSGI web application framework in Python designed to make getting started quick and easy.',
          'Flexible',
        ),
        _buildTechItemWithNavigation(
          context,
          'NestJS',
          'Progressive Node.js framework for building efficient, reliable, and scalable server-side applications.',
          'Growing',
        ),
        _buildTechItemWithNavigation(
          context,
          'Ruby on Rails',
          'Server-side web application framework written in Ruby, following the MVC pattern.',
          'Established',
        ),
      ],
    );
  }

  Widget _buildDatabasesTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildTechItemWithNavigation(
          context,
          'PostgreSQL',
          'Powerful, open source object-relational database system with strong reputation for reliability and data integrity.',
          'Enterprise',
        ),
        _buildTechItemWithNavigation(
          context,
          'MySQL',
          'Open-source relational database management system widely used for web applications.',
          'Widespread',
        ),
        _buildTechItemWithNavigation(
          context,
          'MongoDB',
          'Document-oriented NoSQL database used for high volume data storage and complex applications.',
          'Popular',
        ),
        _buildTechItemWithNavigation(
          context,
          'Redis',
          'In-memory data structure store, used as a database, cache, and message broker.',
          'Performance',
        ),
        _buildTechItemWithNavigation(
          context,
          'SQLite',
          'Self-contained, serverless, zero-configuration SQL database engine.',
          'Embedded',
        ),
        _buildTechItemWithNavigation(
          context,
          'Cassandra',
          'Distributed NoSQL database designed for handling large amounts of data across multiple servers.',
          'Scalable',
        ),
        _buildTechItemWithNavigation(
          context,
          'DynamoDB',
          'Fully managed proprietary NoSQL database service by Amazon Web Services.',
          'Cloud-native',
        ),
        _buildTechItemWithNavigation(
          context,
          'Elasticsearch',
          'Distributed, RESTful search and analytics engine capable of solving a growing number of use cases.',
          'Search-oriented',
        ),
      ],
    );
  }

  Widget _buildApisTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildTechItemWithNavigation(
          context,
          'REST API',
          'Architectural style for designing networked applications, emphasizing simple, standard operations.',
          'Standard',
        ),
        _buildTechItemWithNavigation(
          context,
          'GraphQL',
          'Query language and runtime for APIs, enabling clients to request exactly the data they need.',
          'Modern',
        ),
        _buildTechItemWithNavigation(
          context,
          'gRPC',
          'High-performance, open-source universal RPC framework developed by Google.',
          'Performance',
        ),
        _buildTechItemWithNavigation(
          context,
          'WebSockets',
          'Protocol providing full-duplex communication channels over a single TCP connection.',
          'Real-time',
        ),
        _buildTechItemWithNavigation(
          context,
          'JSON Web Tokens',
          'Open standard for securely transmitting information between parties as a JSON object.',
          'Authentication',
        ),
        _buildTechItemWithNavigation(
          context,
          'OAuth 2.0',
          'Industry-standard protocol for authorization, focusing on client developer simplicity.',
          'Authorization',
        ),
        _buildTechItemWithNavigation(
          context,
          'Swagger/OpenAPI',
          'Specification for machine-readable interface files for describing, producing, and consuming RESTful APIs.',
          'Documentation',
        ),
        _buildTechItemWithNavigation(
          context,
          'WebHooks',
          'User-defined HTTP callbacks that are triggered by specific events.',
          'Integration',
        ),
      ],
    );
  }

  Widget _buildCloudDevOpsTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildTechItemWithNavigation(
          context,
          'Docker',
          'Platform for developing, shipping, and running applications in containers.',
          'Containerization',
        ),
        _buildTechItemWithNavigation(
          context,
          'Kubernetes',
          'Open-source container orchestration system for automating application deployment and scaling.',
          'Orchestration',
        ),
        _buildTechItemWithNavigation(
          context,
          'AWS',
          'Comprehensive cloud computing platform offered by Amazon, including various services for backend development.',
          'Cloud Provider',
        ),
        _buildTechItemWithNavigation(
          context,
          'Azure',
          'Microsoft\'s cloud computing service for building, testing, deploying, and managing applications.',
          'Cloud Provider',
        ),
        _buildTechItemWithNavigation(
          context,
          'Google Cloud',
          'Suite of cloud computing services offered by Google, including hosting and computing resources.',
          'Cloud Provider',
        ),
        _buildTechItemWithNavigation(
          context,
          'CI/CD',
          'Continuous Integration and Continuous Deployment practices for automating testing and deployment.',
          'Development Practice',
        ),
        _buildTechItemWithNavigation(
          context,
          'Terraform',
          'Infrastructure as Code tool for building, changing, and versioning infrastructure safely and efficiently.',
          'IaC',
        ),
        _buildTechItemWithNavigation(
          context,
          'Serverless',
          'Cloud computing execution model where cloud providers manage server allocation and scaling.',
          'Architecture',
        ),
      ],
    );
  }

  String _getCategoryForTech(String tech) {
    final techLower = tech.toLowerCase();

    // Languages
    if (techLower.contains('javascript') ||
        techLower.contains('python') ||
        techLower.contains('java') ||
        techLower.contains('c#') ||
        techLower.contains('go') ||
        techLower.contains('rust') ||
        techLower.contains('php') ||
        techLower.contains('ruby')) {
      return 'Language';
    }
    // Frameworks
    else if (techLower.contains('express') ||
        techLower.contains('django') ||
        techLower.contains('spring') ||
        techLower.contains('asp.net') ||
        techLower.contains('laravel') ||
        techLower.contains('flask') ||
        techLower.contains('nestjs') ||
        techLower.contains('rails')) {
      return 'Framework';
    }
    // Databases
    else if (techLower.contains('sql') ||
        techLower.contains('mongo') ||
        techLower.contains('redis') ||
        techLower.contains('cassandra') ||
        techLower.contains('dynamo') ||
        techLower.contains('elastic')) {
      return 'Database';
    }
    // Cloud & DevOps
    else if (techLower.contains('docker') ||
        techLower.contains('kubernetes') ||
        techLower.contains('aws') ||
        techLower.contains('azure') ||
        techLower.contains('cloud') ||
        techLower.contains('ci/cd') ||
        techLower.contains('terraform') ||
        techLower.contains('serverless')) {
      return 'Cloud & DevOps';
    }
    // APIs
    else if (techLower.contains('rest') ||
        techLower.contains('graphql') ||
        techLower.contains('grpc') ||
        techLower.contains('websocket') ||
        techLower.contains('jwt') ||
        techLower.contains('oauth') ||
        techLower.contains('swagger') ||
        techLower.contains('openapi') ||
        techLower.contains('webhook')) {
      return 'API';
    }

    return 'Backend Technology';
  }
}
