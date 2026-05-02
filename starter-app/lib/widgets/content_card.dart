import 'package:flutter/material.dart';

import '../utils/colors.dart';

/// Content type strings — used for rendering chips on content cards.
/// Must match the labels shown in the UI mockups.
const String kContentTypeMantra = 'Mantra';
const String kContentTypePrayer = 'Prayer';
const String kContentTypeCourse = 'Course';
const String kContentTypeGyan = 'Gyan';

class ContentCard extends StatelessWidget {
  final String title;
  final String typeLabel;
  final String? subtitle;
  final VoidCallback? onTap;

  const ContentCard({
    super.key,
    required this.title,
    required this.typeLabel,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      elevation: 1,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.transparentOrange,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.play_arrow, color: AppColors.orange),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      typeLabel.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.grey_7,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.grey_7,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
