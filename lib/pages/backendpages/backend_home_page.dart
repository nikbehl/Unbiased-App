import 'package:flutter/material.dart';
import 'package:frontend_dev_guide/pages/backendpages/backend_dashboard_page.dart';
import 'package:frontend_dev_guide/pages/backendpages/backend_resource_page.dart';
import 'package:frontend_dev_guide/pages/backendpages/backend_roadmap_page.dart';
import 'package:frontend_dev_guide/pages/backendpages/backend_tech_page.dart';
import 'package:frontend_dev_guide/pages/backendpages/backend_tool_page.dart';

import 'package:frontend_dev_guide/pages/setting_page.dart';
import 'package:frontend_dev_guide/utils/backend_tech_delegate.dart';
import 'package:frontend_dev_guide/utils/tech_search_delegate.dart';
import 'package:frontend_dev_guide/utils/chatgpt_assistance.dart';

class BackendHomePage extends StatefulWidget {
  const BackendHomePage({Key? key}) : super(key: key);

  @override
  State<BackendHomePage> createState() => _BackendHomePageState();
}

class _BackendHomePageState extends State<BackendHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const BackendDashboardPage(),
    const BackendTechPage(),
    const BackendToolsPage(),
    const BackendResourcesPage(),
    const BackendRoadmapPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Backend Developer Guide'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: BackendTechSearchDelegate(),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.layers),
            label: 'Tech Stack',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: 'Tools',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Roadmap',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open ChatGPT Assistant with backend context
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Chatgpt(
                      context:
                          AssistantContext.backend, // Specify backend context
                    )),
          );
        },
        tooltip: 'AI Assistant',
        child: const Icon(Icons.smart_toy),
      ),
    );
  }
}
