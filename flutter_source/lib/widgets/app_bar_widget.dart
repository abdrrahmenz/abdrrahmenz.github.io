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
    final isDesktop = ResponsiveUtils.isDesktop(context);

    return Container(
      height: isDesktop ? 80 : 60,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop
            ? 64.0
            : (ResponsiveUtils.isTablet(context) ? 32.0 : 16.0),
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo/Brand
          GestureDetector(
            onTap: () => onNavigate(heroKey),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                child: Text(
                  'Abdurrahman',
                  style: AppTextStyles.heading3.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: isDesktop ? 28 : 24,
                  ),
                ),
              ),
            ),
          ),

          // Navigation Menu
          if (!isMobile) ...[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 12 : 8,
                vertical: isDesktop ? 6 : 4,
              ),
              child: Row(
                children: [
                  _buildNavItem('Home', () => onNavigate(heroKey), context),
                  _buildNavItem('About', () => onNavigate(aboutKey), context),
                  _buildNavItem('Skills', () => onNavigate(skillsKey), context),
                  _buildNavItem(
                      'Projects', () => onNavigate(projectsKey), context),
                  _buildNavItem(
                      'Contact', () => onNavigate(contactKey), context),
                ],
              ),
            ),
          ] else ...[
            // Mobile menu button
            Container(
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: PopupMenuButton<String>(
                icon:
                    const Icon(Icons.menu, color: AppColors.primary, size: 28),
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
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
                  _buildPopupMenuItem('home', 'Home', Icons.home),
                  _buildPopupMenuItem('about', 'About', Icons.person),
                  _buildPopupMenuItem('skills', 'Skills', Icons.code),
                  _buildPopupMenuItem('projects', 'Projects', Icons.work),
                  _buildPopupMenuItem('contact', 'Contact', Icons.contact_mail),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem(
      String value, String title, IconData icon) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 20),
          const SizedBox(width: 12),
          Text(
            title,
            style: AppTextStyles.body1.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, VoidCallback onTap, BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 4.0 : 2.0),
      child: _HoverableNavItem(
        title: title,
        onTap: onTap,
        context: context,
      ),
    );
  }
}

class _HoverableNavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final BuildContext context;

  const _HoverableNavItem({
    required this.title,
    required this.onTap,
    required this.context,
  });

  @override
  State<_HoverableNavItem> createState() => _HoverableNavItemState();
}

class _HoverableNavItemState extends State<_HoverableNavItem>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(widget.context);
    final isTablet = ResponsiveUtils.isTablet(widget.context);

    // Responsive font size
    double fontSize;
    if (isDesktop) {
      fontSize = 16.0;
    } else if (isTablet) {
      fontSize = 14.0;
    } else {
      fontSize = 12.0;
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => _isHovered = true);
        _animationController.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _animationController.reverse();
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 24.0 : (isTablet ? 20.0 : 16.0),
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: _isHovered ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(25),
                boxShadow: _isHovered && isDesktop
                    ? [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: InkWell(
                onTap: widget.onTap,
                borderRadius: BorderRadius.circular(25),
                child: Text(
                  widget.title,
                  style: AppTextStyles.body1.copyWith(
                    color: _isHovered ? Colors.white : AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize,
                    letterSpacing: 0.5,
                    height: 1.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
