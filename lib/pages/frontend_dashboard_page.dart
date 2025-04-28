// Dashboard Page
import 'package:flutter/material.dart';
import 'package:frontend_dev_guide/pages/detail_page.dart';
import 'package:frontend_dev_guide/widgets/state_item.dart';
import 'package:frontend_dev_guide/widgets/trending_tech_card.dart';
import 'package:frontend_dev_guide/widgets/update_card.dart';

class FrontendDashboardPage extends StatelessWidget {
  const FrontendDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome to Frontend Developer Guide',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'Your comprehensive companion for frontend development technologies and tools.',
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
                      StatItem(title: 'Technologies', count: '50+'),
                      StatItem(title: 'Tools', count: '30+'),
                      StatItem(title: 'Resources', count: '100+'),
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
            title: 'React 19 Overview',
            description: 'Learn about the latest features in React 19',
            date: 'March 22, 2025',
            icon: Icons.code,
            color: Colors.blue,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailPage(
                    title: 'React 19 Overview',
                    category: 'Framework',
                  ),
                ),
              );
            },
          ),

          UpdateCard(
            title: 'CSS-in-JS Comparison',
            description: 'Compare the top CSS-in-JS libraries',
            date: 'March 18, 2025',
            icon: Icons.style,
            color: Colors.purple,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailPage(
                    title: 'CSS-in-JS Comparison',
                    category: 'Styling',
                  ),
                ),
              );
            },
          ),

          UpdateCard(
            title: 'WebAssembly for Frontend Devs',
            description: 'Getting started with WebAssembly',
            date: 'March 15, 2025',
            icon: Icons.speed,
            color: Colors.orange,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailPage(
                    title: 'WebAssembly for Frontend Devs',
                    category: 'Performance',
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
                TrendingTechCard(
                  title: 'Svelte',
                  description: 'Compile-time framework',
                  iconPath: 'assets/svelte.png',
                ),
                TrendingTechCard(
                  title: 'Next.js',
                  description: 'React framework',
                  iconPath: 'assets/nextjs.png',
                ),
                TrendingTechCard(
                  title: 'Astro',
                  description: 'Static site builder',
                  iconPath: 'assets/astro.png',
                ),
                TrendingTechCard(
                  title: 'Tailwind CSS',
                  description: 'Utility-first CSS',
                  iconPath: 'assets/tailwind.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
