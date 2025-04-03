import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfessionSelectionPage extends StatelessWidget {
  const ProfessionSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.shade800,
                Colors.blue.shade600,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Tech Career Guide',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Choose your profession to get started',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 60),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                      // Frontend Developer - Available
                      ProfessionCard(
                        title: 'Frontend Developer',
                        icon: Icons.desktop_mac_outlined,
                        isAvailable: true,
                        onTap: () {
                          Navigator.pushNamed(context, '/frontend_guide');
                        },
                      ),

                      // Backend Developer - Coming Soon
                      ProfessionCard(
                        title: 'Backend Developer',
                        icon: Icons.storage_outlined,
                        isAvailable: false,
                        onTap: () {},
                      ),

                      // UI/UX Designer - Coming Soon
                      ProfessionCard(
                        title: 'UI/UX Designer',
                        icon: Icons.design_services_outlined,
                        isAvailable: false,
                        onTap: () {},
                      ),

                      // Data Scientist - Coming Soon
                      ProfessionCard(
                        title: 'Data Scientist',
                        icon: Icons.analytics_outlined,
                        isAvailable: false,
                        onTap: () {},
                      ),

                      // Mobile Developer - Coming Soon
                      ProfessionCard(
                        title: 'Mobile Developer',
                        icon: Icons.smartphone_outlined,
                        isAvailable: false,
                        onTap: () {},
                      ),

                      // DevOps Engineer - Coming Soon
                      ProfessionCard(
                        title: 'DevOps Engineer',
                        icon: Icons.integration_instructions_outlined,
                        isAvailable: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'More professions coming soon!',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfessionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isAvailable;
  final VoidCallback onTap;

  const ProfessionCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.isAvailable,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isAvailable
          ? onTap
          : () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$title coming soon!'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 48,
                    color: isAvailable
                        ? Colors.blue.shade700
                        : Colors.grey.shade400,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color:
                          isAvailable ? Colors.black87 : Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (!isAvailable)
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Coming Soon',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          if (isAvailable)
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Available',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
