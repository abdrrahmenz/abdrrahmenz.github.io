import 'package:flutter/material.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer_widget.dart';
import '../utils/responsive_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 0,
            floating: true,
            pinned: true,
            backgroundColor: Colors.white.withOpacity(0.95),
            elevation: 2,
            flexibleSpace: CustomAppBar(
              onNavigate: _scrollToSection,
              heroKey: _heroKey,
              aboutKey: _aboutKey,
              skillsKey: _skillsKey,
              projectsKey: _projectsKey,
              contactKey: _contactKey,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              HeroSection(key: _heroKey),
              AboutSection(key: _aboutKey),
              SkillsSection(key: _skillsKey),
              ProjectsSection(key: _projectsKey),
              ContactSection(key: _contactKey),
              const FooterWidget(),
            ]),
          ),
        ],
      ),
    );
  }
}