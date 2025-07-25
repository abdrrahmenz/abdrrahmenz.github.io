import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../utils/responsive_utils.dart';

class CustomAppBar extends StatelessWidget {
  final Function(GlobalKey) onNavigate;
  final GlobalKey heroKey;
  final GlobalKey aboutKey;
  final GlobalKey skillsKey;
  final GlobalKey projectsKey;
  final GlobalKey contactKey;

  const CustomAppBar({
    super.key,
    required this.onNavigate,
    required this.heroKey,
    required this.aboutKey,
    required this.skillsKey,
    required this.projectsKey,
    required this.contactKey,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return Container(
      padding: ResponsiveUtils.getResponsivePadding(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo/Brand
          GestureDetector(
            onTap: () => onNavigate(heroKey),
            child: Text(
              'Abdurrahman',
              style: AppTextStyles.heading3.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          // Navigation Menu
          if (!isMobile) ...[
            Row(
              children: [
                _buildNavItem('Home', () => onNavigate(heroKey)),
                _buildNavItem('About', () => onNavigate(aboutKey)),
                _buildNavItem('Skills', () => onNavigate(skillsKey)),
                _buildNavItem('Projects', () => onNavigate(projectsKey)),
                _buildNavItem('Contact', () => onNavigate(contactKey)),
              ],
            ),
          ] else ...[
            // Mobile menu button
            PopupMenuButton<String>(
              icon: const Icon(Icons.menu, color: AppColors.primary),
              onSelected: (value) {
                switch (value) {
                  case 'home':
                    onNavigate(heroKey);
                    break;
                  case 'about':
                    onNavigate(aboutKey);
                    break;
                  case 'skills':
                    onNavigate(skillsKey);
                    break;
                  case 'projects':
                    onNavigate(projectsKey);
                    break;
                  case 'contact':
                    onNavigate(contactKey);
                    break;
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'home', child: Text('Home')),
                const PopupMenuItem(value: 'about', child: Text('About')),
                const PopupMenuItem(value: 'skills', child: Text('Skills')),
                const PopupMenuItem(value: 'projects', child: Text('Projects')),
                const PopupMenuItem(value: 'contact', child: Text('Contact')),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: AppTextStyles.body1.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}