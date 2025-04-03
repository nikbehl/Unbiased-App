import 'package:flutter/material.dart';
import 'package:frontend_dev_guide/pages/dashboard_page.dart';
import 'package:frontend_dev_guide/pages/resouces_page.dart';
import 'package:frontend_dev_guide/pages/road_map_page.dart';
import 'package:frontend_dev_guide/pages/setting_page.dart';
import 'package:frontend_dev_guide/pages/tech_stack_page.dart';
import 'package:frontend_dev_guide/pages/tools_page.dart';
import 'package:frontend_dev_guide/utils/chatgpt_assistance.dart';
import 'package:frontend_dev_guide/utils/tech_search_delegate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const TechStackPage(),
    const ToolsPage(),
    const ResourcesPage(),
    const RoadmapPage(),
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
        title: const Text('Frontend Developer Guide'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: TechSearchDelegate(),
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
          // Open ChatGPT Assistant
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Chatgpt()),
          );
        },
        tooltip: 'AI Assistant',
        child: const Icon(Icons.smart_toy),
      ),
    );
  }
}
