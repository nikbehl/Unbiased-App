// Create a file: backend_roadmap_page.dart

import 'package:flutter/material.dart';
import 'package:frontend_dev_guide/widgets/road_map_item.dart';
import 'package:frontend_dev_guide/widgets/road_map_section.dart';

class BackendRoadmapPage extends StatelessWidget {
  const BackendRoadmapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Backend Development Roadmap',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'A step-by-step guide to becoming a modern backend developer.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 24),

          // Beginner Level
          RoadmapSection(
            title: 'Level 1: Fundamentals',
            items: [
              RoadmapItem(
                title: 'Programming Language',
                description:
                    'Choose and learn a backend language such as JavaScript (Node.js), Python, Java, or C#.',
                isCompleted: false,
                resources: [
                  'freeCodeCamp - JavaScript',
                  'Python.org Documentation',
                  'Java Documentation',
                  'C# Documentation'
                ],
              ),
              RoadmapItem(
                title: 'Internet Basics',
                description:
                    'Understand how the internet works: HTTP, DNS, domain names, hosting.',
                isCompleted: false,
                resources: [
                  'Mozilla Developer Network (MDN)',
                  'How DNS Works',
                  'HTTP Documentation'
                ],
              ),
              RoadmapItem(
                title: 'Basic Web Server',
                description:
                    'Create a simple web server with routes and understand request/response.',
                isCompleted: false,
                resources: [
                  'Express.js Documentation',
                  'Flask Documentation',
                  'Spring Boot Documentation'
                ],
              ),
              RoadmapItem(
                title: 'API Development',
                description:
                    'Learn to create RESTful APIs with proper structure and response formats.',
                isCompleted: false,
                resources: [
                  'RESTful API Design',
                  'JSON Format',
                  'Postman for API Testing'
                ],
              ),
            ],
          ),

          SizedBox(height: 24),

          // Intermediate Level
          RoadmapSection(
            title: 'Level 2: Intermediate Skills',
            items: [
              RoadmapItem(
                title: 'Databases',
                description:
                    'Learn SQL and NoSQL databases: PostgreSQL, MySQL, MongoDB, etc.',
                isCompleted: false,
                resources: [
                  'SQL Course',
                  'PostgreSQL Documentation',
                  'MongoDB Documentation'
                ],
              ),
              RoadmapItem(
                title: 'Authentication & Authorization',
                description:
                    'Implement user authentication, JWT, OAuth, role-based access control.',
                isCompleted: false,
                resources: [
                  'JWT.io',
                  'OAuth Documentation',
                  'Auth0 Documentation'
                ],
              ),
              RoadmapItem(
                title: 'Data Validation',
                description:
                    'Input validation, sanitization, error handling, and data integrity.',
                isCompleted: false,
                resources: [
                  'Data Validation Best Practices',
                  'Joi Documentation',
                  'Error Handling Patterns'
                ],
              ),
              RoadmapItem(
                title: 'Testing',
                description:
                    'Write unit tests, integration tests, and learn test-driven development.',
                isCompleted: false,
                resources: [
                  'Jest Documentation',
                  'pytest Documentation',
                  'JUnit Documentation'
                ],
              ),
            ],
          ),

          SizedBox(height: 24),

          // Advanced Level
          RoadmapSection(
            title: 'Level 3: Advanced Topics',
            items: [
              RoadmapItem(
                title: 'Database Design',
                description:
                    'Advanced database design, optimization, indexing, and query performance.',
                isCompleted: false,
                resources: [
                  'Database Design Patterns',
                  'Index Optimization',
                  'SQL Performance Tuning'
                ],
              ),
              RoadmapItem(
                title: 'Caching',
                description:
                    'Implement caching with Redis, Memcached, CDN for performance improvement.',
                isCompleted: false,
                resources: [
                  'Redis Documentation',
                  'Caching Strategies',
                  'CDN Implementation'
                ],
              ),
              RoadmapItem(
                title: 'Containerization',
                description:
                    'Learn Docker and container orchestration tools like Kubernetes.',
                isCompleted: false,
                resources: [
                  'Docker Documentation',
                  'Kubernetes Basics',
                  'Container Best Practices'
                ],
              ),
              RoadmapItem(
                title: 'Message Queues',
                description:
                    'Implement asynchronous processing with RabbitMQ, Kafka, or SQS.',
                isCompleted: false,
                resources: [
                  'RabbitMQ Tutorials',
                  'Apache Kafka Documentation',
                  'AWS SQS Guide'
                ],
              ),
            ],
          ),

          SizedBox(height: 24),

          // Expert Level
          RoadmapSection(
            title: 'Level 4: Expert Skills',
            items: [
              RoadmapItem(
                title: 'Microservices',
                description:
                    'Microservices architecture, service discovery, API gateways.',
                isCompleted: false,
                resources: [
                  'Microservices Patterns',
                  'Service Mesh',
                  'API Gateway Implementation'
                ],
              ),
              RoadmapItem(
                title: 'Security',
                description:
                    'Advanced security practices: OWASP, penetration testing, encryption.',
                isCompleted: false,
                resources: [
                  'OWASP Top 10',
                  'Web Security Academy',
                  'Security Best Practices'
                ],
              ),
              RoadmapItem(
                title: 'Monitoring & Logging',
                description:
                    'Implement system monitoring, logging, tracing, and alerting.',
                isCompleted: false,
                resources: [
                  'Prometheus Documentation',
                  'ELK Stack Guide',
                  'Grafana Dashboard Creation'
                ],
              ),
              RoadmapItem(
                title: 'CI/CD Pipelines',
                description:
                    'Continuous integration and deployment pipelines for automated testing and deployment.',
                isCompleted: false,
                resources: [
                  'GitHub Actions Documentation',
                  'Jenkins Pipeline',
                  'CI/CD Best Practices'
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
