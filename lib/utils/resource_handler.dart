import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourceLinkHandler {
  // Extract URLs from resource text if present
  static Future<String> getResourceUrl(String resource) async {
    // Try to find URL in the text
    final urlRegex = RegExp(
      r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)',
      caseSensitive: false,
    );

    final match = urlRegex.firstMatch(resource);
    if (match != null) {
      return match.group(0) ?? 'https://example.com';
    }

    // If no URL is found, try to generate a search URL based on the resource text
    // First, clean up the text to make it more suitable for a search query
    String searchTerm = resource
        .replaceAll(RegExp(r'^\d+\.\s*'), '') // Remove numbering
        .replaceAll(RegExp(r'^[-•*]\s*'), '') // Remove bullet points
        .trim();

    // If it mentions "documentation" or "docs", search for official docs
    if (searchTerm.toLowerCase().contains('documentation') ||
        searchTerm.toLowerCase().contains('docs') ||
        searchTerm.toLowerCase().contains('official')) {
      return 'https://www.google.com/search?q=${Uri.encodeComponent(searchTerm)}+official+documentation';
    }

    // If it mentions "tutorial", search for tutorials
    if (searchTerm.toLowerCase().contains('tutorial')) {
      return 'https://www.google.com/search?q=${Uri.encodeComponent(searchTerm)}';
    }

    // Generic search
    return 'https://www.google.com/search?q=${Uri.encodeComponent(searchTerm)}';
  }

  // Launch URL with error handling
  static Future<void> launchResourceUrl(
      String resource, BuildContext context) async {
    try {
      final url = await getResourceUrl(resource);
      final Uri uri = Uri.parse(url);

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        // Show error if URL can't be launched
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not open: $resource')),
          );
        }
      }
    } catch (e) {
      // Show error if any exception occurs
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error opening resource: $e')),
        );
      }
    }
  }
}
