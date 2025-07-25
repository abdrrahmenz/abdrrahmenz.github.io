import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../utils/responsive_utils.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return Container(
      padding: ResponsiveUtils.getResponsivePadding(context),
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 80),
          Text(
            'About Me',
            style: AppTextStyles.heading2.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 60),
          
          if (!isMobile) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: _buildAboutContent(),
                ),
                const SizedBox(width: 60),
                Expanded(
                  flex: 1,
                  child: _buildStats(),
                ),
              ],
            ),
          ] else ...[
            _buildAboutContent(),
            const SizedBox(height: 40),
            _buildStats(),
          ],
          
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildAboutContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello! I\'m Abdurrahman',
          style: AppTextStyles.heading3.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'I am a passionate and self-taught Flutter developer with a strong interest in creating beautiful, functional, and user-friendly mobile and web applications. My journey in programming started with curiosity and has evolved into a deep passion for solving real-world problems through code.',
          style: AppTextStyles.body1.copyWith(
            color: AppColors.textSecondary,
            height: 1.8,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'When I\'m not coding, I enjoy writing technical articles to share knowledge with the developer community and contributing to open source projects. I believe in the power of collaboration and continuous learning.',
          style: AppTextStyles.body1.copyWith(
            color: AppColors.textSecondary,
            height: 1.8,
          ),
        ),
        const SizedBox(height: 24),
        
        // Experience Timeline
        _buildExperienceItem(
          'Self-taught Flutter Developer',
          '2021 - Present',
          'Building cross-platform applications with Flutter and Dart',
        ),
        _buildExperienceItem(
          'Technical Writer',
          '2022 - Present',
          'Writing articles about Flutter development and best practices',
        ),
        _buildExperienceItem(
          'Open Source Contributor',
          '2022 - Present',
          'Contributing to various Flutter and Dart packages',
        ),
      ],
    );
  }

  Widget _buildExperienceItem(String title, String period, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 12,
            height: 12,
            margin: const EdgeInsets.only(top: 6),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.body1.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  period,
                  style: AppTextStyles.body2.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: AppTextStyles.body2.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Column(
      children: [
        _buildStatCard('3+', 'Years of\nExperience'),
        const SizedBox(height: 20),
        _buildStatCard('20+', 'Projects\nCompleted'),
        const SizedBox(height: 20),
        _buildStatCard('5+', 'Open Source\nContributions'),
        const SizedBox(height: 20),
        _buildStatCard('10+', 'Technical\nArticles'),
      ],
    );
  }

  Widget _buildStatCard(String number, String label) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            number,
            style: AppTextStyles.heading2.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: AppTextStyles.body2.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}