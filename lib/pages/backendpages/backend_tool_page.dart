// Create a file: backend_tools_page.dart

import 'package:flutter/material.dart';
import 'package:frontend_dev_guide/widgets/tool_item.dart';

class BackendToolsPage extends StatelessWidget {
  const BackendToolsPage({Key? key}) : super(key: key);

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
                  Tab(text: 'IDEs & Editors'),
                  Tab(text: 'DevOps Tools'),
                  Tab(text: 'Monitoring'),
                  Tab(text: 'Testing'),
                  Tab(text: 'Database Tools'),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildIDEsEditorsTab(),
            _buildDevOpsToolsTab(),
            _buildMonitoringTab(),
            _buildTestingTab(),
            _buildDatabaseToolsTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildIDEsEditorsTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        ToolItem(
          title: 'Visual Studio Code',
          description:
              'Lightweight, powerful source-code editor with extensive plugin support for backend development.',
          icon: Icons.code,
          isPopular: true,
        ),
        ToolItem(
          title: 'IntelliJ IDEA',
          description:
              'Integrated development environment for Java, with support for many other languages through plugins.',
          icon: Icons.device_hub,
          isPopular: true,
        ),
        ToolItem(
          title: 'PyCharm',
          description:
              'IDE specialized for Python development with support for many web frameworks.',
          icon: Icons.code,
          isPopular: true,
        ),
        ToolItem(
          title: 'Eclipse',
          description:
              'Extensible IDE that supports multiple programming languages, especially popular for Java development.',
          icon: Icons.code,
          isPopular: false,
        ),
        ToolItem(
          title: 'WebStorm',
          description:
              'IDE for JavaScript and Node.js development with intelligent code completion.',
          icon: Icons.web,
          isPopular: false,
        ),
        ToolItem(
          title: 'Vim',
          description:
              'Highly configurable text editor built to make editing code efficiently.',
          icon: Icons.text_format,
          isPopular: false,
        ),
      ],
    );
  }

  Widget _buildDevOpsToolsTab() {
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
          title: 'Kubernetes',
          description:
              'Container orchestration system for automating application deployment and scaling.',
          icon: Icons.view_comfy,
          isPopular: true,
        ),
        ToolItem(
          title: 'GitHub Actions',
          description:
              'CI/CD tool integrated with GitHub that automates workflows based on GitHub events.',
          icon: Icons.play_arrow,
          isPopular: true,
        ),
        ToolItem(
          title: 'Jenkins',
          description:
              'Open-source automation server that enables developers to build, test, and deploy software.',
          icon: Icons.build,
          isPopular: false,
        ),
        ToolItem(
          title: 'Terraform',
          description:
              'Infrastructure as Code tool for building, changing, and versioning infrastructure.',
          icon: Icons.developer_board,
          isPopular: true,
        ),
        ToolItem(
          title: 'Ansible',
          description:
              'Automation tool for software provisioning, configuration management, and application deployment.',
          icon: Icons.settings,
          isPopular: false,
        ),
      ],
    );
  }

  Widget _buildMonitoringTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        ToolItem(
          title: 'Prometheus',
          description:
              'Open-source monitoring and alerting toolkit designed for reliability and scalability.',
          icon: Icons.monitor,
          isPopular: true,
        ),
        ToolItem(
          title: 'Grafana',
          description:
              'Multi-platform analytics and interactive visualization web application for metrics and logs.',
          icon: Icons.bar_chart,
          isPopular: true,
        ),
        ToolItem(
          title: 'New Relic',
          description:
              'Observability platform that helps identify and solve software performance issues.',
          icon: Icons.timeline,
          isPopular: false,
        ),
        ToolItem(
          title: 'Datadog',
          description:
              'Monitoring and analytics platform for large-scale applications.',
          icon: Icons.pets,
          isPopular: false,
        ),
        ToolItem(
          title: 'ELK Stack',
          description:
              'Combination of Elasticsearch, Logstash, and Kibana for log analysis and visualization.',
          icon: Icons.stacked_line_chart,
          isPopular: true,
        ),
        ToolItem(
          title: 'Jaeger',
          description:
              'Open-source distributed tracing system for monitoring and troubleshooting microservices.',
          icon: Icons.bug_report,
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
          title: 'JUnit',
          description:
              'Unit testing framework for Java, widely used for test-driven development.',
          icon: Icons.check_circle,
          isPopular: true,
        ),
        ToolItem(
          title: 'pytest',
          description:
              'Testing framework for Python that makes it easy to write small, readable tests.',
          icon: Icons.check_box,
          isPopular: true,
        ),
        ToolItem(
          title: 'Mocha',
          description:
              'JavaScript test framework running on Node.js, making asynchronous testing simple.',
          icon: Icons.coffee,
          isPopular: false,
        ),
        ToolItem(
          title: 'Postman',
          description:
              'API platform for building and using APIs, including automated testing.',
          icon: Icons.send,
          isPopular: true,
        ),
        ToolItem(
          title: 'Apache JMeter',
          description:
              'Load testing tool for analyzing and measuring the performance of web applications.',
          icon: Icons.speed,
          isPopular: false,
        ),
        ToolItem(
          title: 'Selenium',
          description:
              'Portable framework for testing web applications that supports various programming languages.',
          icon: Icons.web_asset,
          isPopular: false,
        ),
      ],
    );
  }

  Widget _buildDatabaseToolsTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        ToolItem(
          title: 'DBeaver',
          description:
              'Free multi-platform database tool for developers, SQL programmers, and database administrators.',
          icon: Icons.storage,
          isPopular: true,
        ),
        ToolItem(
          title: 'MongoDB Compass',
          description:
              'GUI for MongoDB that allows you to explore your data visually.',
          icon: Icons.explore,
          isPopular: true,
        ),
        ToolItem(
          title: 'pgAdmin',
          description:
              'Open-source administration and management tool for PostgreSQL database.',
          icon: Icons.table_chart,
          isPopular: false,
        ),
        ToolItem(
          title: 'MySQL Workbench',
          description:
              'Visual database design tool that integrates SQL development, administration, and more.',
          icon: Icons.dns,
          isPopular: true,
        ),
        ToolItem(
          title: 'Liquibase',
          description:
              'Open-source database-independent library for tracking, managing, and applying database schema changes.',
          icon: Icons.compare_arrows,
          isPopular: false,
        ),
        ToolItem(
          title: 'Redis Desktop Manager',
          description:
              'Cross-platform desktop GUI for Redis, enabling key-value browsing and management.',
          icon: Icons.memory,
          isPopular: false,
        ),
      ],
    );
  }
}
