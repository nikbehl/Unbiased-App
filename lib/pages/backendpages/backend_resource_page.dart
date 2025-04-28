// Create a file: backend_resources_page.dart

import 'package:flutter/material.dart';
import 'package:frontend_dev_guide/widgets/resource_item.dart';

class BackendResourcesPage extends StatelessWidget {
  const BackendResourcesPage({Key? key}) : super(key: key);

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
                  Tab(text: 'Communities'),
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
            _buildCommunitiesTab(),
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
          title: 'Node.js Documentation',
          description:
              'Official documentation for Node.js, including API reference and guides.',
          url: 'https://nodejs.org/en/docs/',
          icon: Icons.menu_book,
        ),
        ResourceItem(
          title: 'Django Documentation',
          description:
              'Comprehensive documentation for the Django web framework.',
          url: 'https://docs.djangoproject.com/',
          icon: Icons.menu_book,
        ),
        ResourceItem(
          title: 'Spring Framework Documentation',
          description:
              'Official documentation for the Spring Framework ecosystem.',
          url: 'https://spring.io/docs/reference',
          icon: Icons.menu_book,
        ),
        ResourceItem(
          title: 'PostgreSQL Documentation',
          description: 'Detailed documentation for PostgreSQL database.',
          url: 'https://www.postgresql.org/docs/',
          icon: Icons.menu_book,
        ),
        ResourceItem(
          title: 'MongoDB Manual',
          description: 'Comprehensive documentation for MongoDB database.',
          url: 'https://docs.mongodb.com/manual/',
          icon: Icons.menu_book,
        ),
        ResourceItem(
          title: 'Docker Documentation',
          description:
              'Official documentation for Docker platform and containers.',
          url: 'https://docs.docker.com/',
          icon: Icons.menu_book,
        ),
        ResourceItem(
          title: 'AWS Documentation',
          description:
              'Documentation for Amazon Web Services with guides and API references.',
          url: 'https://docs.aws.amazon.com/',
          icon: Icons.menu_book,
        ),
      ],
    );
  }

  Widget _buildCoursesTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        ResourceItem(
          title: 'Backend Development with Node.js',
          description:
              'Comprehensive course on building scalable backends with Node.js and Express.',
          url: 'https://www.udemy.com/course/nodejs-express-mongodb/',
          icon: Icons.school,
        ),
        ResourceItem(
          title: 'Python Django for Beginners',
          description:
              'Learn Django from scratch and build powerful web applications.',
          url: 'https://www.coursera.org/learn/django',
          icon: Icons.school,
        ),
        ResourceItem(
          title: 'Spring Boot Masterclass',
          description:
              'Master Spring Boot and build enterprise applications with Java.',
          url: 'https://www.udemy.com/course/spring-boot-tutorial/',
          icon: Icons.school,
        ),
        ResourceItem(
          title: 'Microservices Architecture and Implementation',
          description:
              'Design and implement microservices architecture patterns.',
          url: 'https://www.pluralsight.com/courses/microservices-architecture',
          icon: Icons.school,
        ),
        ResourceItem(
          title: 'Database Design and SQL',
          description:
              'Learn database design principles and SQL for backend development.',
          url: 'https://www.edx.org/course/databases-5-sql',
          icon: Icons.school,
        ),
        ResourceItem(
          title: 'Docker and Kubernetes: The Complete Guide',
          description:
              'Learn and master containerization and orchestration technologies.',
          url:
              'https://www.udemy.com/course/docker-and-kubernetes-the-complete-guide/',
          icon: Icons.school,
        ),
        ResourceItem(
          title: 'AWS Certified Developer',
          description:
              'Prepare for AWS certification and learn cloud services for backend development.',
          url:
              'https://aws.amazon.com/certification/certified-developer-associate/',
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
          title: 'Martin Fowler',
          description:
              'Thoughts on software development, architecture, and design patterns.',
          url: 'https://martinfowler.com/',
          icon: Icons.article,
        ),
        ResourceItem(
          title: 'High Scalability',
          description: 'Stories of how popular websites are built and scaled.',
          url: 'http://highscalability.com/',
          icon: Icons.article,
        ),
        ResourceItem(
          title: 'Coding Horror',
          description:
              'Blog by Jeff Atwood, co-founder of Stack Overflow, about programming and software development.',
          url: 'https://blog.codinghorror.com/',
          icon: Icons.article,
        ),
        ResourceItem(
          title: 'Node.js Blog',
          description:
              'Official Node.js blog with updates, releases, and best practices.',
          url: 'https://nodejs.org/en/blog/',
          icon: Icons.article,
        ),
        ResourceItem(
          title: 'The Practical Dev',
          description:
              'Community where programmers share ideas and help each other grow.',
          url: 'https://dev.to/t/backend',
          icon: Icons.article,
        ),
        ResourceItem(
          title: 'InfoQ',
          description:
              'Facilitates the spread of knowledge and innovation in professional software development.',
          url: 'https://www.infoq.com/backend/',
          icon: Icons.article,
        ),
        ResourceItem(
          title: 'AWS Architecture Blog',
          description:
              'Best practices and architectural patterns for building on AWS.',
          url: 'https://aws.amazon.com/blogs/architecture/',
          icon: Icons.article,
        ),
      ],
    );
  }

  Widget _buildCommunitiesTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        ResourceItem(
          title: 'Stack Overflow',
          description:
              'Question and answer community for programmers, with extensive backend development discussions.',
          url: 'https://stackoverflow.com/questions/tagged/backend',
          icon: Icons.people,
        ),
        ResourceItem(
          title: 'Reddit - r/webdev',
          description:
              'Subreddit for web developers, including backend discussions.',
          url: 'https://www.reddit.com/r/webdev/',
          icon: Icons.people,
        ),
        ResourceItem(
          title: 'Reddit - r/node',
          description:
              'Community dedicated to Node.js discussions and resources.',
          url: 'https://www.reddit.com/r/node/',
          icon: Icons.people,
        ),
        ResourceItem(
          title: 'Discord - Python Community',
          description:
              'Discord server for Python developers, including Django and Flask discussions.',
          url: 'https://discord.com/invite/python',
          icon: Icons.people,
        ),
        ResourceItem(
          title: 'Hashnode',
          description:
              'Developer blogging platform and community for backend developers.',
          url: 'https://hashnode.com/',
          icon: Icons.people,
        ),
        ResourceItem(
          title: 'DEV Community',
          description:
              'A constructive and inclusive social network for software developers.',
          url: 'https://dev.to/',
          icon: Icons.people,
        ),
        ResourceItem(
          title: 'GitHub Discussions',
          description:
              'Community forums for various backend frameworks and libraries on GitHub.',
          url: 'https://github.com/features/discussions',
          icon: Icons.people,
        ),
      ],
    );
  }
}
