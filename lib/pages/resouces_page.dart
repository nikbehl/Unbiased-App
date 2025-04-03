// Resources Page
import 'package:flutter/material.dart';
import 'package:frontend_dev_guide/widgets/resource_item.dart';

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                isScrollable: true,
                tabs: [
                  Tab(text: 'Documentation'),
                  Tab(text: 'Courses'),
                  Tab(text: 'Blogs'),
                  Tab(text: 'YouTube Channels'),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildDocumentationTab(),
            _buildCoursesTab(),
            _buildBlogsTab(),
            _buildYouTubeChannelsTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentationTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        ResourceItem(
          title: 'MDN Web Docs',
          description:
              'Comprehensive documentation for web technologies including HTML, CSS, and JavaScript.',
          url: 'https://developer.mozilla.org',
          icon: Icons.menu_book,
        ),
        ResourceItem(
          title: 'React Documentation',
          description:
              'Official documentation for the React JavaScript library.',
          url: 'https://react.dev',
          icon: Icons.menu_book,
        ),
        ResourceItem(
          title: 'TypeScript Documentation',
          description:
              'Official documentation for the TypeScript programming language.',
          url: 'https://www.typescriptlang.org/docs',
          icon: Icons.menu_book,
        ),
        ResourceItem(
          title: 'Web.dev',
          description:
              'Guidance and analysis from Google experts on web development.',
          url: 'https://web.dev',
          icon: Icons.menu_book,
        ),
        ResourceItem(
          title: 'Can I Use',
          description: 'Browser support tables for modern web technologies.',
          url: 'https://caniuse.com',
          icon: Icons.help,
        ),
      ],
    );
  }

  Widget _buildCoursesTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        ResourceItem(
          title: 'Frontend Masters',
          description:
              'Advanced JavaScript, CSS, and Frontend framework courses from experts.',
          url: 'https://frontendmasters.com',
          icon: Icons.school,
        ),
        ResourceItem(
          title: 'Udemy',
          description:
              'Platform with thousands of courses on web development and programming.',
          url: 'https://www.udemy.com',
          icon: Icons.school,
        ),
        ResourceItem(
          title: 'Coursera',
          description: 'Online courses from top universities and companies.',
          url: 'https://www.coursera.org',
          icon: Icons.school,
        ),
        ResourceItem(
          title: 'freeCodeCamp',
          description: 'Free coding curriculum and certification program.',
          url: 'https://www.freecodecamp.org',
          icon: Icons.school,
        ),
        ResourceItem(
          title: 'Scrimba',
          description:
              'Interactive coding screencasts where you can edit the code.',
          url: 'https://scrimba.com',
          icon: Icons.school,
        ),
      ],
    );
  }

  Widget _buildBlogsTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        ResourceItem(
          title: 'CSS-Tricks',
          description:
              'Daily articles about CSS, HTML, JavaScript, and all things related to web design and development.',
          url: 'https://css-tricks.com',
          icon: Icons.article,
        ),
        ResourceItem(
          title: 'Smashing Magazine',
          description: 'Articles for web designers and developers.',
          url: 'https://www.smashingmagazine.com',
          icon: Icons.article,
        ),
        ResourceItem(
          title: 'Dev.to',
          description:
              'Community of software developers getting together to help one another.',
          url: 'https://dev.to',
          icon: Icons.article,
        ),
        ResourceItem(
          title: 'Kent C. Dodds Blog',
          description: 'Articles on React, testing, and JavaScript.',
          url: 'https://kentcdodds.com/blog',
          icon: Icons.article,
        ),
        ResourceItem(
          title: 'Josh W Comeau',
          description: 'Blog focused on creative, interactive web development.',
          url: 'https://www.joshwcomeau.com',
          icon: Icons.article,
        ),
      ],
    );
  }

  Widget _buildYouTubeChannelsTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        ResourceItem(
          title: 'Traversy Media',
          description:
              'Web development and programming tutorials for all levels.',
          url: 'https://www.youtube.com/c/TraversyMedia',
          icon: Icons.play_circle_filled,
        ),
        ResourceItem(
          title: 'Fireship',
          description: 'Rapid-fire tutorials and tech news.',
          url: 'https://www.youtube.com/c/Fireship',
          icon: Icons.play_circle_filled,
        ),
        ResourceItem(
          title: 'The Net Ninja',
          description:
              'Tutorials on modern JavaScript, Node.js, React, Vue.js, and more.',
          url: 'https://www.youtube.com/c/TheNetNinja',
          icon: Icons.play_circle_filled,
        ),
        ResourceItem(
          title: 'Web Dev Simplified',
          description: 'Tutorials to make web development more understandable.',
          url: 'https://www.youtube.com/c/WebDevSimplified',
          icon: Icons.play_circle_filled,
        ),
        ResourceItem(
          title: 'Academind',
          description: 'Tutorials on all web development topics.',
          url: 'https://www.youtube.com/c/Academind',
          icon: Icons.play_circle_filled,
        ),
      ],
    );
  }
}
