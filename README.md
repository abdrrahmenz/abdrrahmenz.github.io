# Abdurrahman - Personal Portfolio Website

[![Deploy Flutter Web](https://github.com/abdrrahmenz/abdrrahmenz.github.io/actions/workflows/deploy.yml/badge.svg)](https://github.com/abdrrahmenz/abdrrahmenz.github.io/actions/workflows/deploy.yml)

Personal portfolio website showcasing my skills as a Flutter Developer, Technical Writer, and Open Source Contributor. Built with Flutter for web and deployed on GitHub Pages.

🌐 **Live Demo**: [abdrrahmenz.github.io](https://abdrrahmenz.github.io)

## 📋 Project Structure

```
├── flutter_source/          # Flutter source code
│   ├── lib/                 # Dart source files
│   ├── web/                 # Web-specific files
│   ├── test/                # Unit and widget tests
│   └── pubspec.yaml         # Flutter dependencies
├── .github/workflows/       # GitHub Actions CI/CD
├── build.sh                 # Build script for manual deployment
└── README.md               # This file
```

## 🚀 Quick Start

### Option 1: Automatic Deployment (Recommended)

The repository is configured with GitHub Actions for automatic deployment:

1. **Fork or clone** this repository
2. **Enable GitHub Pages** in repository settings
3. **Push changes** to the `main` branch
4. **GitHub Actions** will automatically build and deploy the site

### Option 2: Manual Build and Deploy

If you prefer manual deployment or want to test locally:

```bash
# Clone the repository
git clone https://github.com/abdrrahmenz/abdrrahmenz.github.io.git
cd abdrrahmenz.github.io

# Build and deploy using the build script
./build.sh

# Commit and push the changes
git add .
git commit -m "Deploy updated portfolio"
git push origin main
```

### Option 3: Development Mode

To run the Flutter app in development mode:

```bash
cd flutter_source
flutter pub get
flutter run -d chrome
```

## ✨ Features

- **🎨 Modern Design**: Clean, professional UI with smooth animations
- **📱 Responsive**: Optimized for desktop, tablet, and mobile devices
- **⚡ PWA Ready**: Progressive Web App with offline capabilities
- **🔍 SEO Optimized**: Proper meta tags and structured content
- **📧 Contact Form**: Interactive form for potential clients
- **🚀 Fast Loading**: Optimized build with lazy loading
- **♿ Accessible**: Built with accessibility best practices

## 🛠️ Technology Stack

- **Frontend**: Flutter (Dart)
- **Styling**: Material Design with custom theming
- **Icons**: Font Awesome Flutter
- **Fonts**: Google Fonts (Poppins)
- **Animations**: Animated Text Kit
- **Deployment**: GitHub Pages
- **CI/CD**: GitHub Actions

## 📱 Sections

1. **Hero Section**: Introduction with animated text and CTAs
2. **About Me**: Personal story, experience timeline, and stats
3. **Skills**: Technical skills with proficiency indicators
4. **Projects**: Featured work with live demos and source code
5. **Contact**: Contact form and social media links
6. **Footer**: Additional info and newsletter signup

## 🎨 Customization

### Updating Personal Information

Edit the following files to customize with your information:

- `flutter_source/lib/widgets/hero_section.dart` - Name, title, description
- `flutter_source/lib/widgets/about_section.dart` - About text and experience
- `flutter_source/lib/widgets/skills_section.dart` - Skills and proficiency levels
- `flutter_source/lib/widgets/projects_section.dart` - Portfolio projects
- `flutter_source/lib/widgets/contact_section.dart` - Contact information

### Changing Colors and Styling

Update the theme in:
- `flutter_source/lib/constants/app_constants.dart` - Colors, text styles, sizes

### Adding New Sections

1. Create a new widget in `flutter_source/lib/widgets/`
2. Import and add it to `flutter_source/lib/screens/home_screen.dart`
3. Update navigation in `flutter_source/lib/widgets/app_bar_widget.dart`

## 🔧 Development

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Web browser for testing

### Local Development

```bash
cd flutter_source
flutter pub get
flutter run -d chrome --web-port 8080
```

### Testing

```bash
cd flutter_source
flutter test
```

### Code Analysis

```bash
cd flutter_source
flutter analyze
```

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/abdrrahmenz/abdrrahmenz.github.io/issues).

## 📞 Contact

**Abdurrahman**
- 🌐 Website: [abdrrahmenz.github.io](https://abdrrahmenz.github.io)
- 📧 Email: abdurrahman@email.com
- 💼 LinkedIn: [Abdurrahman](https://linkedin.com/in/abdurrahman)
- 🐙 GitHub: [@abdrrahmenz](https://github.com/abdrrahmenz)

---

⭐ **Star this repository** if you found it helpful!

Built with ❤️ using Flutter