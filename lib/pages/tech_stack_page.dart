// Tech Stack Page
import 'package:flutter/material.dart';
import 'package:frontend_dev_guide/widgets/tech_item.dart';

class TechStackPage extends StatelessWidget {
  const TechStackPage({Key? key}) : super(key: key);

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
                  Tab(text: 'State Management'),
                  Tab(text: 'Styling'),
                  Tab(text: 'APIs'),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildLanguagesTab(),
            _buildFrameworksTab(),
            _buildStateManagementTab(),
            _buildStylingTab(),
            _buildAPIsTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguagesTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        TechItem(
          title: 'HTML5',
          description:
              'The standard markup language for documents designed to be displayed in a web browser.',
          level: 'Fundamental',
        ),
        TechItem(
          title: 'CSS3',
          description:
              'Stylesheet language used for describing the presentation of a document written in HTML.',
          level: 'Fundamental',
        ),
        TechItem(
          title: 'JavaScript',
          description:
              'High-level, interpreted programming language that conforms to the ECMAScript specification.',
          level: 'Fundamental',
        ),
        TechItem(
          title: 'TypeScript',
          description:
              'Strongly typed programming language that builds on JavaScript, adding static type definitions.',
          level: 'Intermediate',
        ),
        TechItem(
          title: 'WebAssembly',
          description:
              'Binary instruction format for a stack-based virtual machine, enabling high-performance applications.',
          level: 'Advanced',
        ),
      ],
    );
  }

  Widget _buildFrameworksTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        TechItem(
          title: 'React',
          description:
              'JavaScript library for building user interfaces based on UI components.',
          level: 'Popular',
        ),
        TechItem(
          title: 'Angular',
          description:
              'Platform and framework for building single-page client applications using HTML and TypeScript.',
          level: 'Enterprise',
        ),
        TechItem(
          title: 'Vue.js',
          description:
              'Progressive JavaScript framework for building user interfaces.',
          level: 'Growing',
        ),
        TechItem(
          title: 'Svelte',
          description:
              'Compiler-based framework that shifts work from runtime to build time.',
          level: 'Trending',
        ),
        TechItem(
          title: 'Next.js',
          description:
              'React framework with server-side rendering and static site generation.',
          level: 'Popular',
        ),
      ],
    );
  }

  Widget _buildStateManagementTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        TechItem(
          title: 'Redux',
          description:
              'Predictable state container for JavaScript apps, often used with React.',
          level: 'Established',
        ),
        TechItem(
          title: 'MobX',
          description:
              'Simple, scalable state management using reactive programming principles.',
          level: 'Alternative',
        ),
        TechItem(
          title: 'Context API',
          description:
              'React\'s built-in state management for sharing state between components.',
          level: 'Built-in',
        ),
        TechItem(
          title: 'Zustand',
          description:
              'Small, fast and scalable bearbones state-management solution for React.',
          level: 'Modern',
        ),
        TechItem(
          title: 'Recoil',
          description:
              'State management library for React with atom-based approach.',
          level: 'Experimental',
        ),
      ],
    );
  }

  Widget _buildStylingTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        TechItem(
          title: 'Tailwind CSS',
          description: 'Utility-first CSS framework for rapid UI development.',
          level: 'Trending',
        ),
        TechItem(
          title: 'Styled Components',
          description: 'CSS-in-JS library that uses tagged template literals.',
          level: 'Established',
        ),
        TechItem(
          title: 'Emotion',
          description:
              'Library designed for writing CSS styles with JavaScript.',
          level: 'Growing',
        ),
        TechItem(
          title: 'CSS Modules',
          description:
              'CSS files in which all class names and animation names are scoped locally by default.',
          level: 'Practical',
        ),
        TechItem(
          title: 'Sass/SCSS',
          description:
              'CSS preprocessor scripting language that is interpreted or compiled into CSS.',
          level: 'Established',
        ),
      ],
    );
  }

  Widget _buildAPIsTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        TechItem(
          title: 'REST',
          description:
              'Architectural style for distributed hypermedia systems.',
          level: 'Standard',
        ),
        TechItem(
          title: 'GraphQL',
          description:
              'Query language for APIs and a runtime for fulfilling those queries with existing data.',
          level: 'Modern',
        ),
        TechItem(
          title: 'WebSockets',
          description:
              'Protocol providing full-duplex communication channels over a single TCP connection.',
          level: 'Real-time',
        ),
        TechItem(
          title: 'Fetch API',
          description:
              'Modern interface for fetching resources across the network.',
          level: 'Standard',
        ),
        TechItem(
          title: 'tRPC',
          description: 'End-to-end typesafe APIs made easy for TypeScript.',
          level: 'Emerging',
        ),
      ],
    );
  }
}



//2
// import 'package:flutter/material.dart';
// import 'package:frontend_dev_guide/widgets/tech_item.dart';

// class TechStackPage extends StatelessWidget {
//   const TechStackPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 5,
//       child: Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           flexibleSpace: const Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               TabBar(
//                 isScrollable: true,
//                 tabs: [
//                   Tab(text: 'Languages'),
//                   Tab(text: 'Frameworks'),
//                   Tab(text: 'State Management'),
//                   Tab(text: 'Styling'),
//                   Tab(text: 'APIs'),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             _buildLanguagesTab(),
//             _buildFrameworksTab(),
//             _buildStateManagementTab(),
//             _buildStylingTab(),
//             _buildAPIsTab(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildLanguagesTab() {
//     return ListView(
//       padding: const EdgeInsets.all(16.0),
//       children: const [
//         TechItem(
//           title: 'HTML5',
//           description:
//               'The standard markup language for documents designed to be displayed in a web browser.',
//           level: 'Fundamental',
//           version: '5.2',
//         ),
//         TechItem(
//           title: 'CSS3',
//           description:
//               'Stylesheet language used for describing the presentation of a document written in HTML.',
//           level: 'Fundamental',
//           version: '3',
//         ),
//         TechItem(
//           title: 'JavaScript',
//           description:
//               'High-level, interpreted programming language that conforms to the ECMAScript specification.',
//           level: 'Fundamental',
//           version: 'ES2025',
//         ),
//         TechItem(
//           title: 'TypeScript',
//           description:
//               'Strongly typed programming language that builds on JavaScript, adding static type definitions.',
//           level: 'Intermediate',
//           version: '5.4',
//         ),
//         TechItem(
//           title: 'WebAssembly',
//           description:
//               'Binary instruction format for a stack-based virtual machine, enabling high-performance applications.',
//           level: 'Advanced',
//           version: '2.0',
//         ),
//       ],
//     );
//   }

//   Widget _buildFrameworksTab() {
//     return ListView(
//       padding: const EdgeInsets.all(16.0),
//       children: const [
//         TechItem(
//           title: 'React',
//           description:
//               'JavaScript library for building user interfaces based on UI components.',
//           level: 'Popular',
//           version: '19.2',
//         ),
//         TechItem(
//           title: 'Angular',
//           description:
//               'Platform and framework for building single-page client applications using HTML and TypeScript.',
//           level: 'Enterprise',
//           version: '17.3',
//         ),
//         TechItem(
//           title: 'Vue.js',
//           description:
//               'Progressive JavaScript framework for building user interfaces.',
//           level: 'Growing',
//           version: '4.1',
//         ),
//         TechItem(
//           title: 'Svelte',
//           description:
//               'Compiler-based framework that shifts work from runtime to build time.',
//           level: 'Trending',
//           version: '5.0',
//         ),
//         TechItem(
//           title: 'Next.js',
//           description:
//               'React framework with server-side rendering and static site generation.',
//           level: 'Popular',
//           version: '14.2',
//         ),
//       ],
//     );
//   }

//   Widget _buildStateManagementTab() {
//     return ListView(
//       padding: const EdgeInsets.all(16.0),
//       children: const [
//         TechItem(
//           title: 'Redux',
//           description:
//               'Predictable state container for JavaScript apps, often used with React.',
//           level: 'Established',
//           version: '5.1',
//         ),
//         TechItem(
//           title: 'MobX',
//           description:
//               'Simple, scalable state management using reactive programming principles.',
//           level: 'Alternative',
//           version: '6.9',
//         ),
//         TechItem(
//           title: 'Context API',
//           description:
//               'React\'s built-in state management for sharing state between components.',
//           level: 'Built-in',
//           version: '19.2', // Same as React version
//         ),
//         TechItem(
//           title: 'Zustand',
//           description:
//               'Small, fast and scalable bearbones state-management solution for React.',
//           level: 'Modern',
//           version: '4.5',
//         ),
//         TechItem(
//           title: 'Recoil',
//           description:
//               'State management library for React with atom-based approach.',
//           level: 'Experimental',
//           version: '0.7',
//         ),
//       ],
//     );
//   }

//   Widget _buildStylingTab() {
//     return ListView(
//       padding: const EdgeInsets.all(16.0),
//       children: const [
//         TechItem(
//           title: 'Tailwind CSS',
//           description: 'Utility-first CSS framework for rapid UI development.',
//           level: 'Trending',
//           version: '4.2',
//         ),
//         TechItem(
//           title: 'Styled Components',
//           description: 'CSS-in-JS library that uses tagged template literals.',
//           level: 'Established',
//           version: '6.1',
//         ),
//         TechItem(
//           title: 'Emotion',
//           description:
//               'Library designed for writing CSS styles with JavaScript.',
//           level: 'Growing',
//           version: '11.11',
//         ),
//         TechItem(
//           title: 'CSS Modules',
//           description:
//               'CSS files in which all class names and animation names are scoped locally by default.',
//           level: 'Practical',
//           version: '3.0',
//         ),
//         TechItem(
//           title: 'Sass/SCSS',
//           description:
//               'CSS preprocessor scripting language that is interpreted or compiled into CSS.',
//           level: 'Established',
//           version: '1.71',
//         ),
//       ],
//     );
//   }

//   Widget _buildAPIsTab() {
//     return ListView(
//       padding: const EdgeInsets.all(16.0),
//       children: const [
//         TechItem(
//           title: 'REST',
//           description:
//               'Architectural style for distributed hypermedia systems.',
//           level: 'Standard',
//           version: 'N/A', // REST is a style, not a versioned technology
//         ),
//         TechItem(
//           title: 'GraphQL',
//           description:
//               'Query language for APIs and a runtime for fulfilling those queries with existing data.',
//           level: 'Modern',
//           version: '16.8',
//         ),
//         TechItem(
//           title: 'WebSockets',
//           description:
//               'Protocol providing full-duplex communication channels over a single TCP connection.',
//           level: 'Real-time',
//           version: 'RFC 6455',
//         ),
//         TechItem(
//           title: 'Fetch API',
//           description:
//               'Modern interface for fetching resources across the network.',
//           level: 'Standard',
//           version: '3.0',
//         ),
//         TechItem(
//           title: 'tRPC',
//           description: 'End-to-end typesafe APIs made easy for TypeScript.',
//           level: 'Emerging',
//           version: '10.45',
//         ),
//       ],
//     );
//   }
// }


//3

// Main TechStackPage with real-time data using Grok Cloud
// import 'package:flutter/material.dart';
// import 'package:frontend_dev_guide/models/tech_data.dart';
// import 'package:frontend_dev_guide/pages/techstackdetailpage.dart';
// import 'package:frontend_dev_guide/utils/techstackgrokservice.dart';

// class TechStackPage extends StatefulWidget {
//   const TechStackPage({Key? key}) : super(key: key);

//   @override
//   State<TechStackPage> createState() => _TechStackPageState();
// }

// class _TechStackPageState extends State<TechStackPage>
//     with SingleTickerProviderStateMixin {
//   late Future<List<String>> categoriesFuture;
//   late TabController tabController;
//   List<String> categories = [];
//   int _selectedIndex = 0;

//   // Store last check time to highlight new updates
//   final Map<String, DateTime> _lastCheckedTimes = {};
//   final Map<String, bool> _hasNewUpdates = {};

//   @override
//   void initState() {
//     super.initState();
//     categoriesFuture = TechStackGrokService.getCategories();
//     _loadCategories();
//   }

//   Future<void> _loadCategories() async {
//     try {
//       categories = await TechStackGrokService.getCategories();

//       // Initialize tab controller after getting categories
//       tabController = TabController(
//         length: categories.length,
//         vsync: this,
//       );

//       tabController.addListener(() {
//         if (tabController.indexIsChanging) {
//           setState(() {
//             _selectedIndex = tabController.index;
//           });
//         }
//       });

//       // Initialize last checked times
//       for (final category in categories) {
//         _lastCheckedTimes[category] =
//             DateTime.now().subtract(const Duration(days: 30));
//         _checkForUpdates(category);
//       }

//       if (mounted) setState(() {});
//     } catch (e) {
//       print('Error loading categories: $e');
//     }
//   }

//   Future<void> _checkForUpdates(String category) async {
//     final lastCheck = _lastCheckedTimes[category] ??
//         DateTime.now().subtract(const Duration(days: 30));
//     final hasUpdates =
//         await TechStackGrokService.hasUpdates(category, lastCheck);

//     if (mounted) {
//       setState(() {
//         _hasNewUpdates[category] = hasUpdates;
//       });
//     }
//   }

//   void _markCategoryAsChecked(String category) {
//     setState(() {
//       _lastCheckedTimes[category] = DateTime.now();
//       _hasNewUpdates[category] = false;
//     });
//   }

//   @override
//   void dispose() {
//     if (categories.isNotEmpty) {
//       tabController.dispose();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<String>>(
//       future: categoriesFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text('Error loading tech categories'),
//                 const SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       categoriesFuture = TechStackGrokService.getCategories();
//                     });
//                   },
//                   child: const Text('Retry'),
//                 ),
//               ],
//             ),
//           );
//         }

//         // Only build the TabController UI if categories are loaded
//         if (categories.isEmpty) {
//           categories = snapshot.data!;
//           return const Center(child: CircularProgressIndicator());
//         }

//         return DefaultTabController(
//           length: categories.length,
//           child: Scaffold(
//             appBar: AppBar(
//               automaticallyImplyLeading: false,
//               title: const Text('Tech Stack'),
//               actions: [
//                 IconButton(
//                   icon: const Icon(Icons.notifications),
//                   onPressed: () {},
//                   // onPressed: () => showUpdatesDialog(context),
//                   color: _hasNewUpdates.values.contains(true)
//                       ? Colors.amber
//                       : null,
//                 ),
//               ],
//               bottom: TabBar(
//                 controller: tabController,
//                 isScrollable: true,
//                 tabs: categories.map((category) {
//                   final hasNewUpdate = _hasNewUpdates[category] ?? false;

//                   return Tab(
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(category),
//                         if (hasNewUpdate) ...[
//                           const SizedBox(width: 4),
//                           Container(
//                             width: 8,
//                             height: 8,
//                             decoration: const BoxDecoration(
//                               color: Colors.red,
//                               shape: BoxShape.circle,
//                             ),
//                           ),
//                         ],
//                       ],
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//             body: TabBarView(
//               controller: tabController,
//               children: categories.map((category) {
//                 // Mark category as checked when viewed
//                 if (categories[_selectedIndex] == category) {
//                   _markCategoryAsChecked(category);
//                 }

//                 return StreamBuilder<List<TechData>>(
//                   stream: TechStackGrokService.streamTechCategory(category),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(child: CircularProgressIndicator());
//                     }

//                     if (snapshot.hasError) {
//                       return Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text('Error loading $category data'),
//                             const SizedBox(height: 16),
//                             ElevatedButton(
//                               onPressed: () {
//                                 setState(() {});
//                               },
//                               child: const Text('Retry'),
//                             ),
//                           ],
//                         ),
//                       );
//                     }

//                     final techItems = snapshot.data ?? [];

//                     if (techItems.isEmpty) {
//                       return const Center(child: Text('No data available'));
//                     }

//                     return RefreshIndicator(
//                       onRefresh: () async {
//                         setState(() {});
//                       },
//                       child: ListView.builder(
//                         padding: const EdgeInsets.all(16.0),
//                         itemCount: techItems.length,
//                         itemBuilder: (context, index) {
//                           final item = techItems[index];
//                           return TechItem(
//                             title: item.title,
//                             description: item.description,
//                             level: item.level,
//                             version: item.version,
//                             lastUpdated: item.lastUpdated,
//                           );
//                         },
//                       ),
//                     );
//                   },
//                 );
//               }).toList(),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
  