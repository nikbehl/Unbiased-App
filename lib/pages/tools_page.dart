// Tools Page
import 'package:flutter/material.dart';
import 'package:frontend_dev_guide/widgets/tool_item.dart';

class ToolsPage extends StatelessWidget {
  const ToolsPage({Key? key}) : super(key: key);

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
                  Tab(text: 'Code Editors'),
                  Tab(text: 'Build Tools'),
                  Tab(text: 'Testing'),
                  Tab(text: 'Version Control'),
                  Tab(text: 'DevOps'),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildCodeEditorsTab(),
            _buildBuildToolsTab(),
            _buildTestingTab(),
            _buildVersionControlTab(),
            _buildDevOpsTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeEditorsTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        ToolItem(
          title: 'Visual Studio Code',
          description:
              'Free source-code editor made by Microsoft for Windows, Linux and macOS.',
          icon: Icons.code,
          isPopular: true,
        ),
        ToolItem(
          title: 'WebStorm',
          description:
              'Integrated development environment for JavaScript and related technologies.',
          icon: Icons.web,
          isPopular: false,
        ),
        ToolItem(
          title: 'Sublime Text',
          description: 'Sophisticated text editor for code, markup, and prose.',
          icon: Icons.text_fields,
          isPopular: false,
        ),
        ToolItem(
          title: 'Vim',
          description:
              'Highly configurable text editor built to make creating and changing any kind of text very efficient.',
          icon: Icons.text_format,
          isPopular: false,
        ),
        ToolItem(
          title: 'Atom',
          description:
              'Free and open-source text and source code editor developed by GitHub.',
          icon: Icons.code,
          isPopular: false,
        ),
      ],
    );
  }

  Widget _buildBuildToolsTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        ToolItem(
          title: 'Webpack',
          description: 'Static module bundler for JavaScript applications.',
          icon: Icons.build,
          isPopular: true,
        ),
        ToolItem(
          title: 'Vite',
          description:
              'Next generation frontend build tool that significantly improves the frontend development experience.',
          icon: Icons.speed,
          isPopular: true,
        ),
        ToolItem(
          title: 'Rollup',
          description:
              'Module bundler for JavaScript which compiles small pieces of code into something larger.',
          icon: Icons.merge_type,
          isPopular: false,
        ),
        ToolItem(
          title: 'Parcel',
          description:
              'Zero configuration web application bundler that is fast and developer-friendly.',
          icon: Icons.inventory_2,
          isPopular: false,
        ),
        ToolItem(
          title: 'esbuild',
          description:
              'An extremely fast JavaScript bundler and minifier written in Go.',
          icon: Icons.flash_on,
          isPopular: false,
        ),
      ],
    );
  }

  Widget _buildTestingTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        ToolItem(
          title: 'Jest',
          description:
              'Delightful JavaScript Testing Framework with a focus on simplicity.',
          icon: Icons.check_circle,
          isPopular: true,
        ),
        ToolItem(
          title: 'Cypress',
          description: 'End-to-end testing framework for web applications.',
          icon: Icons.check_box,
          isPopular: true,
        ),
        ToolItem(
          title: 'Playwright',
          description:
              'Browser automation library to automate Chromium, Firefox, and WebKit browsers.',
          icon: Icons.play_circle_fill,
          isPopular: false,
        ),
        ToolItem(
          title: 'Vitest',
          description: 'Blazing fast unit test framework powered by Vite.',
          icon: Icons.speed,
          isPopular: false,
        ),
        ToolItem(
          title: 'Testing Library',
          description:
              'Simple and complete testing utilities that encourage good testing practices.',
          icon: Icons.library_books,
          isPopular: true,
        ),
      ],
    );
  }

  Widget _buildVersionControlTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        ToolItem(
          title: 'Git',
          description:
              'Free and open source distributed version control system.',
          icon: Icons.merge,
          isPopular: true,
        ),
        ToolItem(
          title: 'GitHub',
          description:
              'Platform for hosting and collaborating on Git repositories.',
          icon: Icons.hub,
          isPopular: true,
        ),
        ToolItem(
          title: 'GitLab',
          description:
              'Web-based DevOps lifecycle tool that provides a Git repository manager.',
          icon: Icons.source,
          isPopular: false,
        ),
        ToolItem(
          title: 'Bitbucket',
          description:
              'Git repository management solution designed for professional teams.',
          icon: Icons.integration_instructions,
          isPopular: false,
        ),
        ToolItem(
          title: 'Conventional Commits',
          description:
              'Specification for adding human and machine readable meaning to commit messages.',
          icon: Icons.commit,
          isPopular: false,
        ),
      ],
    );
  }

  Widget _buildDevOpsTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        ToolItem(
          title: 'Docker',
          description:
              'Platform for developing, shipping, and running applications in containers.',
          icon: Icons.inventory,
          isPopular: true,
        ),
        ToolItem(
          title: 'GitHub Actions',
          description:
              'Automate software workflows directly from your GitHub repository.',
          icon: Icons.play_arrow,
          isPopular: true,
        ),
        ToolItem(
          title: 'Netlify',
          description:
              'Platform that offers hosting and serverless backend services for web applications.',
          icon: Icons.cloud_upload,
          isPopular: true,
        ),
        ToolItem(
          title: 'Vercel',
          description:
              'Platform for frontend frameworks and static sites, built to integrate with headless content.',
          icon: Icons.bolt,
          isPopular: true,
        ),
        ToolItem(
          title: 'AWS Amplify',
          description:
              'Set of tools and services for building full-stack applications, powered by Amazon Web Services.',
          icon: Icons.cloud,
          isPopular: false,
        ),
      ],
    );
  }
}
