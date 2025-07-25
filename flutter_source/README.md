# Abdurrahman - Personal Portfolio

A responsive personal portfolio website built with Flutter for web, showcasing skills, projects, and professional experience.

## 🚀 Features

- **Responsive Design**: Optimized for desktop, tablet, and mobile devices
- **Modern UI**: Clean and professional design with smooth animations
- **PWA Support**: Progressive Web App with offline capabilities
- **SEO Optimized**: Proper meta tags and structured content
- **Contact Form**: Interactive contact form for potential clients
- **Project Showcase**: Display of featured projects with live demos and source code links
- **Skills Section**: Visual representation of technical skills and expertise
- **Social Integration**: Links to social media and professional profiles

## 🛠️ Built With

- **Flutter**: Google's UI toolkit for building natively compiled applications
- **Dart**: Programming language optimized for client development
- **Google Fonts**: Beautiful typography with Poppins font family
- **Font Awesome Flutter**: Icon library for social media and contact icons
- **Animated Text Kit**: Smooth text animations for dynamic content
- **URL Launcher**: Handle external links and contact methods

## 📱 Sections

1. **Hero Section**: Introduction with animated text and call-to-action buttons
2. **About Me**: Personal introduction, experience timeline, and statistics
3. **Skills**: Technical skills with proficiency levels and categories
4. **Projects**: Featured projects with descriptions, technologies, and links
5. **Contact**: Contact form and social media links
6. **Footer**: Additional information and newsletter subscription

## 🎨 Design Features

- **Color Scheme**: Professional blue theme with gradients
- **Typography**: Poppins font for modern and readable text
- **Animations**: Smooth transitions and hover effects
- **Cards**: Clean card-based design for content organization
- **Grid Layout**: Responsive grid system for optimal viewing

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Web browser for testing

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/abdrrahmenz/abdrrahmenz.github.io.git
   cd abdrrahmenz.github.io/flutter_source
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the development server:
   ```bash
   flutter run -d chrome
   ```

### Building for Production

To build the web application for deployment:

```bash
flutter build web --release
```

The built files will be in the `build/web` directory.

## 📁 Project Structure

```
flutter_source/
├── lib/
│   ├── constants/
│   │   └── app_constants.dart      # Colors, text styles, and sizes
│   ├── screens/
│   │   └── home_screen.dart        # Main screen with sections
│   ├── utils/
│   │   └── responsive_utils.dart   # Responsive design utilities
│   ├── widgets/
│   │   ├── app_bar_widget.dart     # Navigation app bar
│   │   ├── hero_section.dart       # Hero/landing section
│   │   ├── about_section.dart      # About me section
│   │   ├── skills_section.dart     # Skills showcase
│   │   ├── projects_section.dart   # Projects portfolio
│   │   ├── contact_section.dart    # Contact form and info
│   │   └── footer_widget.dart      # Footer section
│   └── main.dart                   # Application entry point
├── web/
│   ├── index.html                  # Main HTML file
│   └── manifest.json               # PWA manifest
├── assets/                         # Images and icons
├── pubspec.yaml                    # Dependencies and configuration
└── README.md                       # Project documentation
```

## 🌐 Deployment

This portfolio is designed to be deployed on GitHub Pages. The build output from `flutter build web` should be copied to the repository root for GitHub Pages deployment.

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/abdrrahmenz/abdrrahmenz.github.io/issues).

## 📞 Contact

**Abdurrahman**
- Email: abdurrahman@email.com
- GitHub: [@abdrrahmenz](https://github.com/abdrrahmenz)
- LinkedIn: [Abdurrahman](https://linkedin.com/in/abdurrahman)

---

⭐ Star this repository if you found it helpful!