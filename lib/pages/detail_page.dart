import 'package:flutter/material.dart';
import 'package:frontend_dev_guide/utils/resource_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:frontend_dev_guide/utils/ai_detail_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final String category;

  // Optional parameters for AI-generated content
  final String? aiDescription;
  final String? aiCodeExample;
  final List<String>? aiResources;
  final bool loadFromAi; // Flag to load content from AI if not provided

  const DetailPage({
    Key? key,
    required this.title,
    required this.category,
    this.aiDescription,
    this.aiCodeExample,
    this.aiResources,
    this.loadFromAi = false,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  bool _isBookmarked = false;
  int _likes = 0;
  bool _userLiked = false;
  late TabController _tabController;
  final TextEditingController _reviewController = TextEditingController();

  // Content variables
  String? _description;
  String? _codeExample;
  List<String>? _resources;

  // Technology stats
  String _latestVersion = "N/A";
  double _downloadPercentage = 0.0;
  int _weeklyDownloads = 0;
  double _rating = 0.0;

  // Reviews
  final List<Review> _reviews = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // Initialize with provided AI content if available
    _description = widget.aiDescription;
    _codeExample = widget.aiCodeExample;
    _resources = widget.aiResources;

    // If content should be loaded from AI and is not provided, load it
    if (widget.loadFromAi &&
        (widget.aiDescription == null ||
            widget.aiCodeExample == null ||
            widget.aiResources == null)) {
      _loadAiContent();
    }

    // Load mock stats and reviews
    _loadMockData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _reviewController.dispose();
    super.dispose();
  }

  void _loadMockData() {
    // Different stats based on technology to make it more realistic
    switch (widget.title.toLowerCase()) {
      case 'react':
        _latestVersion = '19.0.2';
        _downloadPercentage = 0.85;
        _weeklyDownloads = 1250000;
        _rating = 4.8;
        _likes = 2836;
        break;
      case 'angular':
        _latestVersion = '17.3.1';
        _downloadPercentage = 0.65;
        _weeklyDownloads = 820000;
        _rating = 4.3;
        _likes = 1742;
        break;
      case 'vue.js':
        _latestVersion = '4.0.0';
        _downloadPercentage = 0.72;
        _weeklyDownloads = 950000;
        _rating = 4.6;
        _likes = 2105;
        break;
      case 'javascript':
        _latestVersion = 'ES2025';
        _downloadPercentage = 0.95;
        _weeklyDownloads = 2100000;
        _rating = 4.5;
        _likes = 3215;
        break;
      case 'typescript':
        _latestVersion = '5.4.2';
        _downloadPercentage = 0.78;
        _weeklyDownloads = 1450000;
        _rating = 4.7;
        _likes = 2568;
        break;
      case 'redux':
        _latestVersion = '5.0.1';
        _downloadPercentage = 0.62;
        _weeklyDownloads = 580000;
        _rating = 4.2;
        _likes = 1356;
        break;
      case 'tailwind css':
        _latestVersion = '3.4.1';
        _downloadPercentage = 0.75;
        _weeklyDownloads = 1050000;
        _rating = 4.9;
        _likes = 2749;
        break;
      default:
        _latestVersion = '1.0.0';
        _downloadPercentage = 0.5;
        _weeklyDownloads = 500000;
        _rating = 4.0;
        _likes = 1200;
        break;
    }

    // Add mock reviews
    _reviews.addAll([
      Review(
        author: 'Sarah Johnson',
        rating: 5.0,
        comment:
            'This technology has completely changed my development workflow. Highly recommended!',
        date: DateTime.now().subtract(const Duration(days: 5)),
        likes: 42,
      ),
      Review(
        author: 'Michael Chen',
        rating: 4.5,
        comment:
            'Very solid technology with great community support. Documentation could be improved a bit.',
        date: DateTime.now().subtract(const Duration(days: 12)),
        likes: 28,
      ),
      Review(
        author: 'James Wilson',
        rating: 4.0,
        comment:
            'Good overall, but there is a learning curve that beginners should be aware of.',
        date: DateTime.now().subtract(const Duration(days: 20)),
        likes: 15,
      ),
    ]);
  }

  Future<void> _loadAiContent() async {
    // Skip if we already have content
    if (_description != null && _codeExample != null && _resources != null) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final content = await AiDetailProvider.getTechnologyDetails(widget.title);

      setState(() {
        _description = content['description'] as String;
        _codeExample = content['codeExample'] as String;
        _resources = content['resources'] as List<String>;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load content: $e')),
        );
      }
    }
  }

  void _toggleBookmark() {
    setState(() {
      _isBookmarked = !_isBookmarked;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isBookmarked
            ? '${widget.title} added to bookmarks'
            : '${widget.title} removed from bookmarks'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _toggleLike() {
    setState(() {
      if (_userLiked) {
        _likes--;
        _userLiked = false;
      } else {
        _likes++;
        _userLiked = true;
      }
    });
  }

  void _submitReview(double rating) {
    if (_reviewController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please write a comment for your review')),
      );
      return;
    }

    setState(() {
      _reviews.insert(
          0,
          Review(
            author: 'You',
            rating: rating,
            comment: _reviewController.text,
            date: DateTime.now(),
            likes: 0,
          ));
      _reviewController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Review submitted. Thank you!')),
    );

    // Recalculate average rating
    double sum = 0;
    for (var review in _reviews) {
      sum += review.rating;
    }
    setState(() {
      _rating = sum / _reviews.length;
    });
  }

  void _shareContent() {
    final text = '''
Check out ${widget.title} - ${_description?.substring(0, min(100, _description?.length ?? 0))}...

Learn more in the Tech Career Guide app!
''';

    Share.share(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(_isBookmarked ? Icons.bookmark : Icons.bookmark_border),
            onPressed: _toggleBookmark,
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: _shareContent,
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _isLoading ? null : _loadAiContent,
          ),
        ],
      ),
      body: _isLoading ? _buildLoadingView() : _buildContentView(),
    );
  }

  Widget _buildLoadingView() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Loading technology details...'),
        ],
      ),
    );
  }

  Widget _buildContentView() {
    return Column(
      children: [
        _buildHeader(),
        Expanded(
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Overview'),
                    Tab(text: 'Stats & Usage'),
                    Tab(text: 'Reviews'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(16.0),
                        child: _buildOverviewTab(),
                      ),
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(16.0),
                        child: _buildStatsTab(),
                      ),
                      _buildReviewsTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        widget.category,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'v$_latestVersion',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    RatingBarIndicator(
                      rating: _rating,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _rating.toStringAsFixed(1),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      ' (${_reviews.length} reviews)',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: _toggleLike,
            child: Column(
              children: [
                Icon(
                  _userLiked ? Icons.favorite : Icons.favorite_border,
                  color: _userLiked ? Colors.red : Colors.grey,
                  size: 28,
                ),
                const SizedBox(height: 4),
                Text(
                  _likes.toString(),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDescriptionSection(),
        const SizedBox(height: 24),
        _buildCodeExampleSection(),
        const SizedBox(height: 24),
        _buildResourcesSection(),
        const SizedBox(height: 24),
        _buildRelatedTopicsSection(),
      ],
    );
  }

  Widget _buildStatsTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Popularity',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Adoption Rate among Developers',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                LinearPercentIndicator(
                  lineHeight: 20.0,
                  percent: _downloadPercentage,
                  center: Text('${(_downloadPercentage * 100).toInt()}%'),
                  progressColor: Colors.blue,
                  backgroundColor: Colors.blue.withOpacity(0.2),
                  animation: true,
                  animationDuration: 1000,
                  barRadius: const Radius.circular(8),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.download, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(
                      '${_formatNumber(_weeklyDownloads)} weekly downloads',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Version History',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildVersionItem(_latestVersion, 'Current',
                    DateTime.now().subtract(const Duration(days: 30))),
                const Divider(),
                _buildVersionItem(
                    _getPreviousVersion(_latestVersion),
                    'Previous',
                    DateTime.now().subtract(const Duration(days: 90))),
                const Divider(),
                _buildVersionItem(_getOlderVersion(_latestVersion), 'Legacy',
                    DateTime.now().subtract(const Duration(days: 180))),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Compatibility',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildCompatibilityItem('Chrome', true),
                _buildCompatibilityItem('Firefox', true),
                _buildCompatibilityItem('Safari', true),
                _buildCompatibilityItem('Edge', true),
                _buildCompatibilityItem('Internet Explorer', false),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewsTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Write a Review',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      // Store the rating here
                    },
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _reviewController,
                    decoration: const InputDecoration(
                      hintText: 'Write your review...',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () => _submitReview(3.5), // Example rating
                        child: const Text('Submit Review'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: _reviews.length,
            itemBuilder: (context, index) {
              return _buildReviewItem(_reviews[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          // Fallback to static description if no AI content
          _description ?? _getStaticDescription(widget.title),
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildCodeExampleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Code Example',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              // Fallback to static code example if no AI content
              _codeExample ?? _getStaticCodeExample(widget.title),
              style: const TextStyle(
                fontFamily: 'monospace',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResourcesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Resources',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),

        // If we have AI-generated resources, display them
        if (_resources != null && _resources!.isNotEmpty)
          ..._resources!.map((resource) => _buildResourceLink(resource)),

        // Otherwise, display static resources
        if (_resources == null || _resources!.isEmpty) ...[
          _buildResourceLink('Official Documentation'),
          _buildResourceLink('Tutorial'),
          _buildResourceLink('GitHub Repository'),
        ],
      ],
    );
  }

  // In your DetailPage class, replace the _buildResourceLink method with this:

  Widget _buildResourceLink(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () async {
          try {
            // Generate a search URL based on the resource title
            String searchUrl;

            // Try to extract URL if present in the resource title
            final urlRegex = RegExp(
              r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)',
              caseSensitive: false,
            );

            final match = urlRegex.firstMatch(title);
            if (match != null) {
              searchUrl = match.group(0) ?? 'https://www.google.com';
            } else {
              // If no URL is found, create a search query
              String searchTerm = title
                  .replaceAll(RegExp(r'^\d+\.\s*'), '') // Remove numbering
                  .replaceAll(RegExp(r'^[-•*]\s*'), '') // Remove bullet points
                  .trim();

              if (searchTerm.toLowerCase().contains('documentation') ||
                  searchTerm.toLowerCase().contains('docs')) {
                searchUrl =
                    'https://www.google.com/search?q=${Uri.encodeComponent(searchTerm)}+official+documentation';
              } else if (searchTerm.toLowerCase().contains('tutorial')) {
                searchUrl =
                    'https://www.google.com/search?q=${Uri.encodeComponent(searchTerm)}+tutorial';
              } else {
                searchUrl =
                    'https://www.google.com/search?q=${Uri.encodeComponent(searchTerm)}';
              }
            }

            // Launch URL
            final Uri uri = Uri.parse(searchUrl);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            } else {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Could not open: $title')),
                );
              }
            }
          } catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error opening resource: $e')),
              );
            }
          }
        },
        child: Row(
          children: [
            const Icon(Icons.link, color: Colors.blue),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRelatedTopicsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Related Topics',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _getRelatedTopics(widget.title, context),
        ),
      ],
    );
  }

  Widget _buildVersionItem(String version, String label, DateTime date) {
    return ListTile(
      title: Row(
        children: [
          Text(
            version,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: label == 'Current'
                  ? Colors.green.withOpacity(0.1)
                  : Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: label == 'Current' ? Colors.green : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      subtitle: Text(
        'Released on ${_formatDate(date)}',
        style: const TextStyle(fontSize: 14),
      ),
      trailing: label == 'Current'
          ? const Icon(Icons.check_circle, color: Colors.green)
          : null,
    );
  }

  Widget _buildCompatibilityItem(String browser, bool isCompatible) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(
            isCompatible ? Icons.check_circle : Icons.cancel,
            color: isCompatible ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 8),
          Text(
            browser,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(Review review) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Text(review.author[0]),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.author,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Posted on ${_formatDate(review.date)}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                RatingBarIndicator(
                  rating: review.rating,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 16.0,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(review.comment),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.thumb_up,
                  size: 16,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 4),
                Text(
                  review.likes.toString(),
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(BuildContext context, String tag, String tagCategory) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              title: tag,
              category: tagCategory,
              loadFromAi: true, // Auto-load content for related topics
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          tag,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  // Helper methods
  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toString();
  }

  String _getPreviousVersion(String currentVersion) {
    // Simple logic to generate a "previous" version
    final parts = currentVersion.split('.');
    if (parts.length > 1) {
      final minorVersion = int.parse(parts[1]);
      if (minorVersion > 0) {
        return '${parts[0]}.${minorVersion - 1}.0';
      }
      final majorVersion = int.parse(parts[0]);
      if (majorVersion > 0) {
        return '${majorVersion - 1}.0.0';
      }
    }
    return '0.9.0';
  }

  String _getOlderVersion(String currentVersion) {
    // Generate an even older version based on the current one
    final parts = currentVersion.split('.');
    if (parts.length > 1) {
      final majorVersion = int.parse(parts[0]);
      if (majorVersion > 1) {
        return '${majorVersion - 1}.0.0';
      }
    }
    return '0.5.0';
  }

  // Static content fallback methods
  String _getStaticDescription(String topic) {
    switch (topic.toLowerCase()) {
      case 'javascript':
        return 'JavaScript is a scripting or programming language that allows you to implement complex features on web pages. It\'s an essential technology for frontend development, enabling interactive web pages and is a core pillar of web applications.';
      case 'react':
        return 'React is a free and open-source front-end JavaScript library for building user interfaces based on UI components. It is maintained by Meta and a community of individual developers and companies.';
      default:
        return 'This is a detailed explanation of $topic. It would include comprehensive information about the technology, its features, benefits, and how it fits into the overall frontend development ecosystem.';
    }
  }

  String _getStaticCodeExample(String topic) {
    switch (topic.toLowerCase()) {
      case 'javascript':
        return '// Basic JavaScript example\nfunction greet(name) {\n  return `Hello, !`;\n}\n\nconst result = greet(\'Developer\');\nconsole.log(result); // Output: Hello, Developer!';
      case 'react':
        return '// Simple React component\nimport React from \'react\';\n\nfunction Welcome(props) {\n  return <h1>Hello, {props.name}</h1>;\n}\n\nexport default function App() {\n  return (\n    <div>\n      <Welcome name="Developer" />\n    </div>\n  );\n}';
      default:
        return '// Example code would be here\nfunction example() {\n  return "This is a code example for $topic";\n}';
    }
  }

  List<Widget> _getRelatedTopics(String topic, BuildContext context) {
    switch (topic.toLowerCase()) {
      case 'javascript':
        return [
          _buildTag(context, 'TypeScript', 'Language'),
          _buildTag(context, 'Node.js', 'Runtime'),
          _buildTag(context, 'ES6', 'Standard'),
          _buildTag(context, 'DOM', 'API'),
        ];
      case 'react':
        return [
          _buildTag(context, 'JavaScript', 'Language'),
          _buildTag(context, 'JSX', 'Syntax'),
          _buildTag(context, 'Redux', 'State Management'),
          _buildTag(context, 'Hooks', 'Feature'),
        ];
      default:
        return [
          _buildTag(context, 'JavaScript', 'Language'),
          _buildTag(context, 'Web Development', 'Concept'),
          _buildTag(context, 'Frontend', 'Category'),
          _buildTag(context, 'React', 'Framework'),
        ];
    }
  }
}

// Helper function to get minimum of two integers
int min(int a, int b) {
  return a < b ? a : b;
}

// Review class to represent user reviews
class Review {
  final String author;
  final double rating;
  final String comment;
  final DateTime date;
  final int likes;

  Review({
    required this.author,
    required this.rating,
    required this.comment,
    required this.date,
    required this.likes,
  });
}
