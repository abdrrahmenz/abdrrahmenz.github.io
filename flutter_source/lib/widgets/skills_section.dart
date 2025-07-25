import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/app_constants.dart';
import '../utils/responsive_utils.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final columns = ResponsiveUtils.getResponsiveColumns(context);

    return Container(
      padding: ResponsiveUtils.getResponsivePadding(context),
      color: AppColors.background,
      child: Column(
        children: [
          const SizedBox(height: 80),
          Text(
            'Skills & Technologies',
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
          
          // Programming Languages
          _buildSkillCategory('Programming Languages', [
            SkillItem('Dart', FontAwesomeIcons.code, 90),
            SkillItem('JavaScript', FontAwesomeIcons.js, 75),
            SkillItem('Python', FontAwesomeIcons.python, 70),
            SkillItem('Java', FontAwesomeIcons.java, 65),
          ]),
          
          const SizedBox(height: 40),
          
          // Frameworks & Tools
          _buildSkillCategory('Frameworks & Tools', [
            SkillItem('Flutter', Icons.flutter_dash, 95),
            SkillItem('React', FontAwesomeIcons.react, 70),
            SkillItem('Node.js', FontAwesomeIcons.node, 75),
            SkillItem('Firebase', Icons.local_fire_department, 85),
          ]),
          
          const SizedBox(height: 40),
          
          // Other Skills
          _buildSkillCategory('Other Skills', [
            SkillItem('Git & GitHub', FontAwesomeIcons.github, 90),
            SkillItem('UI/UX Design', Icons.design_services, 80),
            SkillItem('Technical Writing', FontAwesomeIcons.pen, 85),
            SkillItem('Problem Solving', Icons.lightbulb, 90),
          ]),
          
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(String title, List<SkillItem> skills) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.heading3.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 24),
        LayoutBuilder(
          builder: (context, constraints) {
            final columns = ResponsiveUtils.getResponsiveColumns(context);
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                childAspectRatio: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: skills.length,
              itemBuilder: (context, index) {
                return _buildSkillCard(skills[index]);
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildSkillCard(SkillItem skill) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                skill.icon,
                color: AppColors.primary,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  skill.name,
                  style: AppTextStyles.body1.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Text(
                '${skill.level}%',
                style: AppTextStyles.body2.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Stack(
            children: [
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              FractionallySizedBox(
                widthFactor: skill.level / 100,
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.primary, AppColors.secondary],
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SkillItem {
  final String name;
  final IconData icon;
  final int level;

  SkillItem(this.name, this.icon, this.level);
}