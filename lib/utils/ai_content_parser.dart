import 'package:flutter/material.dart';

class AiContentParser {
  // Parse AI response into sections
  static Map<String, dynamic> parseAIResponse(String response) {
    Map<String, dynamic> result = {
      'description': '',
      'codeExample': '',
      'resources': <String>[],
    };

    // Extract description
    final descriptionPattern = RegExp(
        r'(?:Description:?|About:?)(.*?)(?=Code Example:|Example:|Resources:|$)',
        dotAll: true);
    final descriptionMatch = descriptionPattern.firstMatch(response);
    if (descriptionMatch != null && descriptionMatch.group(1) != null) {
      result['description'] = descriptionMatch.group(1)!.trim();
    }

    // Extract code example
    final codePattern = RegExp(
        r'(?:Code Example:?|Example:?)(.*?)(?=Resources:|$)',
        dotAll: true);
    final codeMatch = codePattern.firstMatch(response);
    if (codeMatch != null && codeMatch.group(1) != null) {
      result['codeExample'] = codeMatch.group(1)!.trim();

      // Clean up code if it has markdown formatting
      if (result['codeExample'].contains('```')) {
        result['codeExample'] = _cleanCodeMarkdown(result['codeExample']);
      }
    }

    // Extract resources
    final resourcesPattern =
        RegExp(r'(?:Resources:?|Links:?|Documentation:?)(.*?)$', dotAll: true);
    final resourcesMatch = resourcesPattern.firstMatch(response);
    if (resourcesMatch != null && resourcesMatch.group(1) != null) {
      String resourcesText = resourcesMatch.group(1)!.trim();

      // Try to extract individual resources
      List<String> resources = [];

      // Try to parse as a bulleted list
      final bulletItems =
          RegExp(r'[-*•]\s*(.*?)(?=\n[-*•]|\n\n|$)', dotAll: true)
              .allMatches(resourcesText);

      if (bulletItems.isNotEmpty) {
        for (var match in bulletItems) {
          if (match.group(1) != null && match.group(1)!.trim().isNotEmpty) {
            resources.add(match.group(1)!.trim());
          }
        }
      }
      // Try to parse as numbered list
      else {
        final numberedItems =
            RegExp(r'\d+\.\s*(.*?)(?=\n\d+\.|\n\n|$)', dotAll: true)
                .allMatches(resourcesText);
        if (numberedItems.isNotEmpty) {
          for (var match in numberedItems) {
            if (match.group(1) != null && match.group(1)!.trim().isNotEmpty) {
              resources.add(match.group(1)!.trim());
            }
          }
        }
        // If no structured list, just split by newlines as a fallback
        else if (resourcesText.contains('\n')) {
          resources = resourcesText
              .split('\n')
              .where((line) => line.trim().isNotEmpty)
              .map((line) => line.trim())
              .toList();
        }
        // If all else fails, just add the whole text as one resource
        else {
          resources.add(resourcesText);
        }
      }

      result['resources'] = resources;
    }

    return result;
  }

  // Clean code markdown (remove triple backticks and language identifier)
  static String _cleanCodeMarkdown(String code) {
    // Remove opening markdown (```javascript or just ```)
    code = code.replaceFirst(RegExp(r'```\w*\n?'), '');

    // Remove closing markdown
    code = code.replaceFirst(RegExp(r'```\s*$'), '');

    return code.trim();
  }

  // Extract URLs from text (for resources that contain URLs)
  static String? extractUrl(String text) {
    final urlPattern = RegExp(
        r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)',
        caseSensitive: false);

    final match = urlPattern.firstMatch(text);
    if (match != null) {
      return match.group(0);
    }

    return null;
  }
}
