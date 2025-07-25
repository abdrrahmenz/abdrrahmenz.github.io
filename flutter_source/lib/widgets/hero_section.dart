import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_constants.dart';
import '../utils/responsive_utils.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final screenHeight = ResponsiveUtils.getScreenHeight(context);

    return Container(
      height: screenHeight * 0.9,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF8F9FA),
            Color(0xFFE3F2FD),
          ],
        ),
      ),
      child: Padding(
        padding: ResponsiveUtils.getResponsivePadding(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isMobile) ...[
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: _buildContent(context, isMobile),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildProfileImage(context),
                  ),
                ],
              ),
            ] else ...[
              _buildProfileImage(context),
              const SizedBox(height: 32),
              _buildContent(context, isMobile),
            ],
            
            const SizedBox(height: 40),
            _buildSocialLinks(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, I\'m',
          style: AppTextStyles.heading2.copyWith(
            color: AppColors.textSecondary,
            fontSize: isMobile ? 24 : 36,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Abdurrahman',
          style: AppTextStyles.heading1.copyWith(
            color: AppColors.primary,
            fontSize: isMobile ? 36 : 48,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 60,
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                'Flutter Developer',
                textStyle: AppTextStyles.heading3.copyWith(
                  color: AppColors.secondary,
                  fontSize: isMobile ? 20 : 24,
                ),
                speed: const Duration(milliseconds: 100),
              ),
              TyperAnimatedText(
                'Technical Writer',
                textStyle: AppTextStyles.heading3.copyWith(
                  color: AppColors.secondary,
                  fontSize: isMobile ? 20 : 24,
                ),
                speed: const Duration(milliseconds: 100),
              ),
              TyperAnimatedText(
                'Open Source Contributor',
                textStyle: AppTextStyles.heading3.copyWith(
                  color: AppColors.secondary,
                  fontSize: isMobile ? 20 : 24,
                ),
                speed: const Duration(milliseconds: 100),
              ),
            ],
            totalRepeatCount: 5,
            pause: const Duration(milliseconds: 1000),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'A self-taught Flutter developer passionate about creating beautiful, functional, and user-friendly applications. I love sharing knowledge through technical writing and contributing to open source projects.',
          style: AppTextStyles.body1.copyWith(
            color: AppColors.textSecondary,
            height: 1.6,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                // Scroll to contact section
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                ),
              ),
              child: const Text('Get In Touch'),
            ),
            const SizedBox(width: 16),
            OutlinedButton(
              onPressed: () {
                // Download resume
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.primary),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                ),
              ),
              child: const Text('Download CV'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final size = isMobile ? 200.0 : 300.0;
    
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primary, AppColors.secondary],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: const Center(
          child: Icon(
            Icons.person,
            size: 150,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon(
          FontAwesomeIcons.github,
          'https://github.com/abdrrahmenz',
        ),
        _buildSocialIcon(
          FontAwesomeIcons.linkedin,
          'https://linkedin.com/in/abdurrahman',
        ),
        _buildSocialIcon(
          FontAwesomeIcons.twitter,
          'https://twitter.com/abdurrahman',
        ),
        _buildSocialIcon(
          FontAwesomeIcons.envelope,
          'mailto:abdurrahman@email.com',
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: GestureDetector(
        onTap: () => _launchUrl(url),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: FaIcon(
            icon,
            size: 20,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}