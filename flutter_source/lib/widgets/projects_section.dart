import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_constants.dart';
import '../utils/responsive_utils.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final columns = ResponsiveUtils.getResponsiveColumns(context);

    return Container(
      padding: ResponsiveUtils.getResponsivePadding(context),
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 80),
          Text(
            'Featured Projects',
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
          
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              childAspectRatio: 0.8,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
            ),
            itemCount: _projects.length,
            itemBuilder: (context, index) {
              return _buildProjectCard(_projects[index]);
            },
          ),
          
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildProjectCard(ProjectItem project) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Image
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: project.gradientColors,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSizes.borderRadius),
                topRight: Radius.circular(AppSizes.borderRadius),
              ),
            ),
            child: Center(
              child: Icon(
                project.icon,
                size: 80,
                color: Colors.white,
              ),
            ),
          ),
          
          // Project Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: AppTextStyles.heading3.copyWith(
                      fontSize: 20,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    project.description,
                    style: AppTextStyles.body2.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  
                  // Technologies
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: project.technologies.map((tech) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          tech,
                          style: AppTextStyles.body2.copyWith(
                            color: AppColors.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  
                  const Spacer(),
                  
                  // Action Buttons
                  Row(
                    children: [
                      if (project.githubUrl.isNotEmpty) ...[
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () => _launchUrl(project.githubUrl),
                            icon: const FaIcon(
                              FontAwesomeIcons.github,
                              size: 16,
                            ),
                            label: const Text('Code'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.textPrimary,
                              side: BorderSide(
                                color: AppColors.textPrimary.withOpacity(0.3),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                      if (project.liveUrl.isNotEmpty) ...[
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => _launchUrl(project.liveUrl),
                            icon: const Icon(Icons.launch, size: 16),
                            label: const Text('Live'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  final List<ProjectItem> _projects = [
    ProjectItem(
      title: 'Personal Portfolio',
      description: 'A responsive portfolio website built with Flutter for web showcasing my skills and projects.',
      technologies: ['Flutter', 'Dart', 'Responsive Design'],
      icon: Icons.web,
      gradientColors: [AppColors.primary, AppColors.secondary],
      githubUrl: 'https://github.com/abdrrahmenz/portfolio',
      liveUrl: 'https://abdrrahmenz.github.io',
    ),
    ProjectItem(
      title: 'Task Manager App',
      description: 'A productivity app with task management, reminders, and progress tracking features.',
      technologies: ['Flutter', 'Firebase', 'Provider'],
      icon: Icons.task_alt,
      gradientColors: [Colors.green, Colors.teal],
      githubUrl: 'https://github.com/abdrrahmenz/task-manager',
      liveUrl: '',
    ),
    ProjectItem(
      title: 'Weather App',
      description: 'A beautiful weather application with current conditions, forecasts, and location-based services.',
      technologies: ['Flutter', 'API Integration', 'Animations'],
      icon: Icons.wb_sunny,
      gradientColors: [Colors.orange, Colors.deepOrange],
      githubUrl: 'https://github.com/abdrrahmenz/weather-app',
      liveUrl: '',
    ),
    ProjectItem(
      title: 'E-commerce UI',
      description: 'A modern e-commerce app UI with shopping cart, product catalog, and user authentication.',
      technologies: ['Flutter', 'UI/UX', 'State Management'],
      icon: Icons.shopping_cart,
      gradientColors: [Colors.purple, Colors.deepPurple],
      githubUrl: 'https://github.com/abdrrahmenz/ecommerce-ui',
      liveUrl: '',
    ),
    ProjectItem(
      title: 'Chat Application',
      description: 'Real-time messaging app with group chats, file sharing, and push notifications.',
      technologies: ['Flutter', 'Socket.IO', 'Firebase'],
      icon: Icons.chat,
      gradientColors: [Colors.indigo, Colors.blue],
      githubUrl: 'https://github.com/abdrrahmenz/chat-app',
      liveUrl: '',
    ),
    ProjectItem(
      title: 'Expense Tracker',
      description: 'Personal finance management app with expense tracking, budgeting, and analytics.',
      technologies: ['Flutter', 'SQLite', 'Charts'],
      icon: Icons.account_balance_wallet,
      gradientColors: [Colors.red, Colors.pink],
      githubUrl: 'https://github.com/abdrrahmenz/expense-tracker',
      liveUrl: '',
    ),
  ];
}

class ProjectItem {
  final String title;
  final String description;
  final List<String> technologies;
  final IconData icon;
  final List<Color> gradientColors;
  final String githubUrl;
  final String liveUrl;

  ProjectItem({
    required this.title,
    required this.description,
    required this.technologies,
    required this.icon,
    required this.gradientColors,
    required this.githubUrl,
    required this.liveUrl,
  });
}