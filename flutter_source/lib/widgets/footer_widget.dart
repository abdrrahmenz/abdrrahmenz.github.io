import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_constants.dart';
import '../utils/responsive_utils.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return Container(
      padding: ResponsiveUtils.getResponsivePadding(context),
      color: AppColors.dark,
      child: Column(
        children: [
          const SizedBox(height: 60),

          if (!isMobile) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: _buildBrandSection(),
                ),
                Expanded(
                  flex: 1,
                  child: _buildQuickLinks(),
                ),
                Expanded(
                  flex: 1,
                  child: _buildSocialSection(),
                ),
              ],
            ),
          ] else ...[
            _buildBrandSection(),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(child: _buildQuickLinks()),
                const SizedBox(width: 16),
                Expanded(child: _buildSocialSection()),
              ],
            ),
            // const SizedBox(height: 40),
            // _buildSocialSection(),
          ],

          const SizedBox(height: 40),

          // Divider
          Container(
            height: 1,
            color: Colors.white.withOpacity(0.2),
          ),

          const SizedBox(height: 24),

          // Copyright
          if (!isMobile) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '© 2024 Abdurrahman. All rights reserved.',
                  style: AppTextStyles.body2.copyWith(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                Text(
                  'Built with Flutter 💙',
                  style: AppTextStyles.body2.copyWith(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ] else ...[
            Text(
              '© 2024 Abdurrahman. All rights reserved.',
              style: AppTextStyles.body2.copyWith(
                color: Colors.white.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Built with Flutter 💙',
              style: AppTextStyles.body2.copyWith(
                color: Colors.white.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildBrandSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Abdurrahman',
          style: AppTextStyles.heading3.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'A passionate Flutter developer creating beautiful and functional applications. Always eager to learn new technologies and share knowledge with the community.',
          style: AppTextStyles.body1.copyWith(
            color: Colors.white.withOpacity(0.8),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 24),

        // Newsletter Subscription (placeholder)
        Text(
          'Stay Updated',
          style: AppTextStyles.body1.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: AppTextStyles.body2.copyWith(
                    color: Colors.white.withOpacity(0.6),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                style: AppTextStyles.body2.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                // Newsletter subscription logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Subscribe'),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Links',
          style: AppTextStyles.body1.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        _buildFooterLink('Home'),
        _buildFooterLink('About'),
        _buildFooterLink('Skills'),
        _buildFooterLink('Projects'),
        _buildFooterLink('Contact'),
        _buildFooterLink('Blog'),
      ],
    );
  }

  Widget _buildFooterLink(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: () {
          // Navigation logic
        },
        child: Text(
          title,
          style: AppTextStyles.body2.copyWith(
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Connect With Me',
          style: AppTextStyles.body1.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        _buildSocialLink(
          FontAwesomeIcons.github,
          'GitHub',
          'https://github.com/abdrrahmenz',
        ),
        _buildSocialLink(
          FontAwesomeIcons.linkedin,
          'LinkedIn',
          'https://linkedin.com/in/abdurrahman',
        ),
        _buildSocialLink(
          FontAwesomeIcons.twitter,
          'Twitter',
          'https://twitter.com/abdurrahman',
        ),
        _buildSocialLink(
          FontAwesomeIcons.medium,
          'Medium',
          'https://medium.com/@abdurrahman',
        ),
        _buildSocialLink(
          FontAwesomeIcons.envelope,
          'Email',
          'mailto:abdurrahman@email.com',
        ),
      ],
    );
  }

  Widget _buildSocialLink(IconData icon, String title, String url) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: () => _launchUrl(url),
        child: Row(
          children: [
            FaIcon(
              icon,
              color: Colors.white.withOpacity(0.8),
              size: 16,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: AppTextStyles.body2.copyWith(
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
