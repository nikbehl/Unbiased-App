// Roadmap Page
import 'package:flutter/material.dart';
import 'package:frontend_dev_guide/widgets/road_map_item.dart';
import 'package:frontend_dev_guide/widgets/road_map_section.dart';

class RoadmapPage extends StatelessWidget {
  const RoadmapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Frontend Development Roadmap',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'A step-by-step guide to becoming a modern frontend developer.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 24),

          // Beginner Level
          RoadmapSection(
            title: 'Level 1: Fundamentals',
            items: [
              RoadmapItem(
                title: 'HTML Basics',
                description:
                    'Learn the structure of web pages, common elements, semantic HTML.',
                isCompleted: false,
                resources: ['MDN Web Docs', 'freeCodeCamp - HTML Section'],
              ),
              RoadmapItem(
                title: 'CSS Basics',
                description:
                    'Learn selectors, properties, box model, layouts, responsive design.',
                isCompleted: false,
                resources: ['CSS-Tricks', 'MDN CSS Docs'],
              ),
              RoadmapItem(
                title: 'JavaScript Basics',
                description:
                    'Variables, data types, functions, objects, arrays, DOM manipulation.',
                isCompleted: false,
                resources: ['JavaScript.info', 'Eloquent JavaScript'],
              ),
              RoadmapItem(
                title: 'Version Control',
                description:
                    'Learn Git basics: commit, push, pull, branches, merge.',
                isCompleted: false,
                resources: ['Git Documentation', 'GitHub Learning Lab'],
              ),
            ],
          ),

          SizedBox(height: 24),

          // Intermediate Level
          RoadmapSection(
            title: 'Level 2: Intermediate Skills',
            items: [
              RoadmapItem(
                title: 'CSS Frameworks',
                description:
                    'Learn Bootstrap, Tailwind CSS, or other CSS frameworks.',
                isCompleted: false,
                resources: [
                  'Tailwind Documentation',
                  'Bootstrap Documentation'
                ],
              ),
              RoadmapItem(
                title: 'JavaScript Advanced',
                description:
                    'Closures, prototypes, async/await, ES6+ features.',
                isCompleted: false,
                resources: ['You Don\'t Know JS', 'JavaScript30'],
              ),
              RoadmapItem(
                title: 'JavaScript Framework',
                description: 'Choose and learn one: React, Vue, or Angular.',
                isCompleted: false,
                resources: [
                  'React Documentation',
                  'Vue Documentation',
                  'Angular Documentation'
                ],
              ),
              RoadmapItem(
                title: 'Package Managers',
                description:
                    'Learn npm or yarn for managing JavaScript packages.',
                isCompleted: false,
                resources: ['npm Documentation', 'Yarn Documentation'],
              ),
            ],
          ),

          SizedBox(height: 24),

          // Advanced Level
          RoadmapSection(
            title: 'Level 3: Advanced Topics',
            items: [
              RoadmapItem(
                title: 'TypeScript',
                description:
                    'Add static typing to JavaScript for better developer experience.',
                isCompleted: false,
                resources: ['TypeScript Documentation', 'TypeScript Deep Dive'],
              ),
              RoadmapItem(
                title: 'State Management',
                description:
                    'Learn Redux, MobX, Zustand, or context API for state management.',
                isCompleted: false,
                resources: ['Redux Documentation', 'MobX Documentation'],
              ),
              RoadmapItem(
                title: 'Testing',
                description:
                    'Unit testing, integration testing, and end-to-end testing.',
                isCompleted: false,
                resources: ['Jest Documentation', 'Testing Library'],
              ),
              RoadmapItem(
                title: 'Performance Optimization',
                description:
                    'Code splitting, lazy loading, memoization, optimizing renders.',
                isCompleted: false,
                resources: ['Web.dev Performance', 'Chrome DevTools'],
              ),
            ],
          ),

          SizedBox(height: 24),

          // Expert Level
          RoadmapSection(
            title: 'Level 4: Expert Skills',
            items: [
              RoadmapItem(
                title: 'Server-Side Rendering',
                description: 'Learn Next.js, Nuxt.js, or Angular Universal.',
                isCompleted: false,
                resources: ['Next.js Documentation', 'Nuxt.js Documentation'],
              ),
              RoadmapItem(
                title: 'GraphQL',
                description:
                    'Learn GraphQL for querying APIs more efficiently.',
                isCompleted: false,
                resources: ['GraphQL Documentation', 'Apollo Client'],
              ),
              RoadmapItem(
                title: 'Web Assembly',
                description:
                    'Learn to use WebAssembly for high-performance code.',
                isCompleted: false,
                resources: ['WebAssembly.org', 'MDN WebAssembly Docs'],
              ),
              RoadmapItem(
                title: 'Progressive Web Apps',
                description:
                    'Build offline-capable, installable web applications.',
                isCompleted: false,
                resources: ['web.dev PWA', 'PWA Workshop'],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
