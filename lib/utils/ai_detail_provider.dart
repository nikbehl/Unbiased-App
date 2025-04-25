import 'dart:async';
import 'package:frontend_dev_guide/utils/grokcloud.dart';
import 'package:frontend_dev_guide/utils/ai_content_parser.dart';

class AiDetailProvider {
  // Cache mechanism to store previously fetched technology details
  static final Map<String, Map<String, dynamic>> _cache = {};

  // Check if we have cached data for a technology
  static bool hasCachedData(String technology) {
    return _cache.containsKey(technology.toLowerCase());
  }

  // Get cached data for a technology
  static Map<String, dynamic>? getCachedData(String technology) {
    return _cache[technology.toLowerCase()];
  }

  // Main method to get technology details (either from cache or API)
  static Future<Map<String, dynamic>> getTechnologyDetails(
      String technology) async {
    // Check cache first
    if (hasCachedData(technology)) {
      return getCachedData(technology)!;
    }

    // If not in cache, fetch from API
    String prompt = _createDetailPrompt(technology);

    try {
      // Default to the first available model
      String model = "gpt-3.5-turbo"; // fallback
      final models = await getAvailableModels();
      if (models != null && models.models.isNotEmpty) {
        model = models.models.first.id;
      }

      final response = await sendPostPrompt(prompt, model);

      if (response != null && response.choices.isNotEmpty) {
        final cleanedResponse = response.choices.first.message.content
            .replaceAll(RegExp(r'<\/?think>'), '');

        // Parse the AI response
        final parsedContent = AiContentParser.parseAIResponse(cleanedResponse);

        // Cache the results
        _cache[technology.toLowerCase()] = parsedContent;

        return parsedContent;
      } else {
        // Return fallback content if API fails
        return _getFallbackContent(technology);
      }
    } catch (e) {
      print('Error fetching AI content: $e');
      return _getFallbackContent(technology);
    }
  }

  // Create a detailed prompt for the AI
  static String _createDetailPrompt(String technology) {
    return """Please provide detailed information about $technology in frontend development.
Format your answer with exactly these sections:

Description: [Write a comprehensive explanation of what $technology is, its features, benefits, and significance in frontend development]

Code Example: [Show a practical, real-world code example using $technology with proper syntax]

Resources: [List 4-5 specific resources for learning more about $technology, including:
- Official documentation
- A good tutorial
- A GitHub repository if applicable
- Community forums
- Learning resources]

Be concise but thorough in your answer.""";
  }

  // Fallback content if API fails
  static Map<String, dynamic> _getFallbackContent(String technology) {
    return {
      'description': 'Information about $technology could not be loaded. '
          'Please check your internet connection and try again.',
      'codeExample':
          '// Example code for $technology\n// (Could not load content)',
      'resources': <String>[
        'Official Documentation',
        'Tutorials',
        'GitHub Repository',
      ],
    };
  }

  // Preload common technologies in the background
  static Future<void> preloadCommonTechnologies() async {
    // List of common technologies to preload
    final commonTechs = [
      'JavaScript',
      'React',
      'HTML5',
      'CSS3',
      'TypeScript',
    ];

    // Load each technology in the background
    for (var tech in commonTechs) {
      // Skip if already cached
      if (hasCachedData(tech)) continue;

      // Wait a bit between requests to avoid rate limiting
      await Future.delayed(const Duration(seconds: 2));

      // Load in the background without awaiting completion
      getTechnologyDetails(tech).then((_) {
        print('Preloaded: $tech');
      }).catchError((e) {
        print('Failed to preload: $tech ($e)');
      });
    }
  }
}
