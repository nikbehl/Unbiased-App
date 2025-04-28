import 'package:flutter/material.dart';
import 'package:frontend_dev_guide/pages/detail_page.dart';
import 'package:frontend_dev_guide/widgets/state_item.dart';
import 'package:frontend_dev_guide/widgets/trending_tech_card.dart';
import 'package:frontend_dev_guide/widgets/update_card.dart';

class BackendDashboardPage extends StatelessWidget {
  const BackendDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome to Backend Developer Guide',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'Your comprehensive companion for backend development technologies and tools.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),

          // Quick Stats Section
          const Card(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Stats',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      StatItem(title: 'Languages', count: '20+'),
                      StatItem(title: 'Frameworks', count: '15+'),
                      StatItem(title: 'Databases', count: '12+'),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Recent Updates
          const Text(
            'Recent Updates',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          UpdateCard(
            title: 'Node.js 24 Features',
            description: 'Explore the latest features in Node.js 24',
            date: 'April 23, 2025',
            icon: Icons.code,
            color: Colors.green,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    title: 'Node.js',
                    category: 'Runtime Environment',
                    loadFromAi: true,
                  ),
                ),
              );
            },
          ),

          UpdateCard(
            title: 'PostgreSQL 17 Enhancements',
            description: 'What\'s new in PostgreSQL 17',
            date: 'April 15, 2025',
            icon: Icons.storage,
            color: Colors.blue,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    title: 'PostgreSQL',
                    category: 'Database',
                    loadFromAi: true,
                  ),
                ),
              );
            },
          ),

          UpdateCard(
            title: 'Microservices Architecture Patterns',
            description: 'Best practices and design patterns for microservices',
            date: 'April 5, 2025',
            icon: Icons.apps,
            color: Colors.purple,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    title: 'Microservices',
                    category: 'Architecture',
                    loadFromAi: true,
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 24),

          // Trending Technologies
          const Text(
            'Trending Technologies',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          title: 'GraphQL',
                          category: 'API',
                          loadFromAi: true,
                        ),
                      ),
                    );
                  },
                  child: TrendingTechCard(
                    title: 'GraphQL',
                    description: 'Query language for APIs',
                    iconPath: 'assets/graphql.png',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          title: 'Docker',
                          category: 'Containerization',
                          loadFromAi: true,
                        ),
                      ),
                    );
                  },
                  child: TrendingTechCard(
                    title: 'Docker',
                    description: 'Containerization platform',
                    iconPath: 'assets/docker.png',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          title: 'NestJS',
                          category: 'Framework',
                          loadFromAi: true,
                        ),
                      ),
                    );
                  },
                  child: TrendingTechCard(
                    title: 'NestJS',
                    description: 'Progressive Node.js framework',
                    iconPath: 'assets/nestjs.png',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailPage(
                          title: 'MongoDB',
                          category: 'Database',
                          loadFromAi: true,
                        ),
                      ),
                    );
                  },
                  child: const TrendingTechCard(
                    title: 'MongoDB',
                    description: 'NoSQL database',
                    iconPath: 'assets/mongodb.png',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
