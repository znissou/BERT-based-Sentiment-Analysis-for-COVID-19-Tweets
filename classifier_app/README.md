# Sentiment Analysis App

A modern Flutter application for sentiment analysis of tweets using a BERT-based deep learning model.

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart" alt="Dart">
  <img src="https://img.shields.io/badge/Material-3-6200EE?logo=material-design" alt="Material 3">
</p>

## 📱 Screenshots

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/cffa1c5d-7267-48be-933c-c312e4a08460" alt="Home Screen" width="250"/></td>
    <td><img src="https://github.com/user-attachments/assets/7c332513-fd11-4aaf-9785-32fb04b1515c" alt="Classification Screen" width="250"/></td>
    <td><img src="screenshots/result_screen.png" alt="Result Screen" width="250"/></td>
  </tr>
  <tr>
    <td align="center"><b>Home Screen</b></td>
    <td align="center"><b>Classification</b></td>
    <td align="center"><b>Results</b></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/ebfd1412-cd14-4850-a289-8256ab4c52c9" alt="Performance Screen" width="250"/></td>
    <td><img src="https://github.com/user-attachments/assets/9f2c95d5-4a19-4e0e-bd46-b38652af7253" alt="Model Info Screen" width="250"/></td>
    <td><img src="https://github.com/user-attachments/assets/79682092-1e20-4f03-9719-20607c341793" alt="Architecture Screen" width="250"/></td>
  </tr>
  <tr>
    <td align="center"><b>Performance Metrics</b></td>
    <td align="center"><b>Model Information</b></td>
    <td align="center"><b>Architecture Details</b></td>
  </tr>
</table>

## 📖 About

This is an academic project demonstrating a BERT-based deep learning model for sentiment classification of COVID-19 related tweets. The app provides an intuitive interface to classify tweets, view model performance metrics, and learn about the underlying architecture.


## ✨ Features

- 🤖 **Tweet Classification**: Real-time sentiment analysis of text input
- 📊 **Performance Metrics**: View model accuracy, precision, recall, and F1 score
- 📚 **Model Information**: Detailed documentation of BERT architecture and training process
- 🎨 **Modern UI**: Material 3 design with gradient headers and smooth animations
- 🌙 **Dark Mode Support**: Automatic theme switching based on system preferences
- 📱 **Responsive Design**: Adapts to different screen sizes

## 🏗️ Project Structure

```
lib/
├── main.dart                      # App entry point and routing
├── app_theme.dart                 # Material 3 theme configuration
│
├── screens/
│   ├── home_screen.dart          # Main landing page
│   ├── classify_screen.dart      # Tweet classification interface
│   ├── performance_screen.dart   # Model metrics display
│   └── model_info_screen.dart    # Architecture documentation
│
├── widgets/
│   ├── feature_card.dart         # Reusable feature card component
│   ├── gradient_header.dart      # Header with gradient background
│   ├── sentiment_result_card.dart # Display classification results
│   └── metric_card.dart          # Performance metric card
│
├── services/
│   └── sentiment_service.dart    # API service for sentiment classification
│
└── models/
    └── performance_metric.dart   # Performance metric data model
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- A running backend server for sentiment classification

### Running the App

1. Get dependencies:
```bash
flutter pub get
```

2. Configure the API endpoint in `lib/services/sentiment_service.dart`:

```dart
// For Android emulator
static const String baseUrl = 'http://10.0.2.2:5000';

// For iOS simulator
static const String baseUrl = 'http://localhost:5000';

// For physical device (replace with your computer's IP)
static const String baseUrl = 'http://192.168.1.X:5000';
```

3. Run the app:
```bash
flutter run
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
```

## 🎨 Design Features

- **Material 3**: Latest Material Design guidelines
- **Custom Color Scheme**: Primary indigo (#6366F1), secondary purple (#8B5CF6), accent cyan (#06B6D4)
- **Gradient Accents**: Modern gradient headers and card backgrounds
- **Responsive Layout**: Adapts seamlessly to different screen sizes
- **Icon System**: Meaningful icons throughout the app
- **Smooth Animations**: Subtle animations for better user experience
- **Error Handling**: Comprehensive error states with user-friendly messages


## 🎯 Key Features Implemented

### 1. Home Screen
- Gradient header with app branding
- Feature cards with navigation
- Project information display

### 2. Classification Screen
- Multi-line text input
- Real-time sentiment analysis
- Loading states during classification
- Error handling with user feedback
- Result display with color-coded sentiments
- Step-by-step usage guide

### 3. Performance Screen
- Grid layout for metrics
- Visual metric cards with icons
- Color-coded performance indicators
- Detailed metric descriptions
- Informational tooltips

### 4. Model Information Screen
- Comprehensive architecture breakdown
- Layer-by-layer explanation
- Hyperparameter details
- Training process documentation
- Results summary


## 📝 Usage Example

```dart
// Using the sentiment service
final sentimentService = SentimentService();

try {
  final result = await sentimentService.classifySentiment(
    "This is a great day for AI!"
  );
  print('Sentiment: $result'); // Output: Sentiment: positive
} catch (e) {
  print('Error: $e');
}
```



## 📄 License

This project is open source and available for educational purposes.

## 🙏 Acknowledgments

- Built with Flutter and Material 3 design system
- BERT model from TensorFlow Hub
- Trained on Kaggle COVID-19 tweet datasets
- Google Colab for model training infrastructure

## 📧 Contact

For questions or feedback about this project, please open an issue on GitHub.

---

<p align="center">
  <b>⭐ If you find this project useful, please consider giving it a star! ⭐</b>
</p>

<p align="center">
  <i>This is a demonstration project for academic purposes. The backend server must be running for the classification feature to work.</i>
</p>
