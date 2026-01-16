# BERT-based Sentiment Analysis for COVID-19 Tweets

A complete deep learning system using BERT (Bidirectional Encoder Representations from Transformers) to classify sentiment in COVID-19 related tweets. This project includes a trained model, Flask API backend, and cross-platform Flutter mobile application.

## 📋 Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Quick Start](#quick-start)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Model Performance](#model-performance)
- [Deployment](#deployment)
- [Technology Stack](#technology-stack)
- [Authors](#authors)
- [License](#license)

## 🎯 Overview

This project implements an end-to-end sentiment analysis system developed as part of a Master's thesis at the University of Abdelhamid Mehri Constantine 2. The system analyzes COVID-19 related tweets and classifies them into three sentiment categories: Positive, Negative, and Neutral.

**Key Highlights:**
- **Accuracy:** 91.4%
- **Dataset:** 41,157 COVID-19 related tweets (March-April 2020)
- **Model:** BERT-base with 110M parameters
- **Backend:** Flask REST API
- **Frontend:** Cross-platform Flutter application (Android, iOS, Web, Desktop)

## ✨ Features

### Deep Learning Model
- State-of-the-art BERT-based sentiment classification
- Comprehensive text preprocessing pipeline
- Custom tokenization with optimized sequence length (60 tokens)
- Transfer learning with fine-tuned BERT encoder

### Backend API
- RESTful Flask server for inference
- Real-time sentiment prediction
- Health check and monitoring endpoints
- CORS support for cross-platform access

### Mobile Application
- Modern Material 3 design with dark mode support
- Real-time tweet classification interface
- Model performance metrics visualization
- Architecture documentation viewer
- Cross-platform support (Android, iOS, Web, Linux, macOS, Windows)

## 🚀 Quick Start

### 1. Download the Model

⚠️ **The trained model is NOT included in the repository (440 MB)**

Download from [GitHub Releases](../../releases/latest) and extract to `backend/models/`:

```
backend/models/Classifier-model/
├── saved_model.pb
├── keras_metadata.pb
├── fingerprint.pb
├── variables/
│   ├── variables.data-00000-of-00001
│   └── variables.index
└── assets/
    └── vocab.txt
```

### 2. Set Up Backend

```bash
cd backend
pip install -r requirements.txt
python app.py
```

Server runs at `http://localhost:5000`

For detailed backend setup, see [backend/README.md](backend/README.md)

### 3. Run Mobile App

```bash
cd classifier_app
flutter pub get
flutter run
```

**Configure API endpoint in `lib/services/sentiment_service.dart`:**

```dart
// Android emulator
static const String baseUrl = 'http://10.0.2.2:5000';

// iOS simulator
static const String baseUrl = 'http://localhost:5000';

// Physical device (replace with your computer's IP)
static const String baseUrl = 'http://192.168.1.X:5000';
```

For detailed mobile app setup, see [classifier_app/README.md](classifier_app/README.md)

## 🏗️ Architecture

### System Architecture

```
┌─────────────────┐
│  Flutter App    │  ← User Interface (Cross-platform)
└────────┬────────┘
         │ HTTP POST /classify
         ▼
┌─────────────────┐
│   Flask API     │  ← Backend Server (Port 5000)
└────────┬────────┘
         │ Model Inference
         ▼
┌─────────────────┐
│  BERT Model     │  ← Deep Learning Model (TensorFlow)
└─────────────────┘
```

### Model Architecture

1. **Input Layer:** Text strings
2. **BERT Preprocessor Tokenizer:** Tokenization
3. **BERT Preprocessor:** Converts to BERT input format
   - Input word IDs
   - Attention masks
   - Token type IDs
4. **BERT Encoder:** 12 transformer layers (768 hidden units each)
5. **Output Layer:** Dense layer with softmax (3 classes)

**Model Parameters:**
- Total params: 109,484,548
- Trainable params: 109,484,547
- Optimizer: Adam (learning rate: 2e-5)
- Loss: Categorical Crossentropy
- Batch size: 50
- Epochs: 3

## 📁 Project Structure

```
├── LICENSE
├── README.md
├── Thesis.pdf
│
├── backend/                           # Flask API Backend
│   ├── .env                          # Environment configuration
│   ├── app.py                        # Flask application
│   ├── README.md                     # Backend documentation
│   ├── requirements.txt              # Python dependencies
│   └── models/                       # Model directory
│       └── Classifier-model/         # Downloaded BERT model
│
├── classifier_app/                    # Flutter Mobile Application
│   ├── README.md                     # Mobile app documentation
│   ├── pubspec.yaml                  # Flutter dependencies
│   ├── lib/
│   │   ├── main.dart                 # App entry point
│   │   ├── app_theme.dart            # Material 3 theme
│   │   ├── screens/                  # UI screens
│   │   │   ├── home_screen.dart
│   │   │   ├── classify_screen.dart
│   │   │   ├── performance_screen.dart
│   │   │   └── model_info_screen.dart
│   │   ├── widgets/                  # Reusable components
│   │   │   ├── feature_card.dart
│   │   │   ├── gradient_header.dart
│   │   │   ├── sentiment_result_card.dart
│   │   │   └── metric_card.dart
│   │   ├── services/                 # API integration
│   │   │   └── sentiment_service.dart
│   │   └── models/                   # Data models
│   │       └── performance_metric.dart
│   ├── android/                      # Android platform code
│   ├── ios/                          # iOS platform code
│   ├── web/                          # Web platform code
│   ├── linux/                        # Linux platform code
│   ├── macos/                        # macOS platform code
│   └── windows/                      # Windows platform code
│
└── Deep learning model/               # Model Training
    ├── BERT-based Sentiment Analysis for COVID-19 Tweets.ipynb
    └── datasets/
        ├── Corona_NLP_train.csv
        └── Corona_NLP_samples.csv
```

## 📊 Dataset

**Source:** Kaggle - Coronavirus tweets NLP Text Classification

**Statistics:**
- Total records: 41,157 tweets
- Time period: March to mid-April 2020
- Features: Username, Screen name, Location, Tweet date, Original tweet, Sentiment

**Class Distribution:**
- Positive: 18,046 (43.8%)
- Negative: 15,398 (37.4%)
- Neutral: 7,713 (18.7%)

## 📈 Model Performance

### Overall Metrics

| Metric | Score |
|--------|-------|
| Accuracy | 91.4% |
| Precision | 92.02% |
| Recall | 90.39% |
| F1-Score | 89.0% |

### Comparison with Other Models

| Model | Accuracy | Precision | Recall | F1-Score |
|-------|----------|-----------|--------|----------|
| **BERT (Ours)** | **91.4%** | **92.02%** | **90.39%** | **89.0%** |
| LSTM | 83.0% | 83.0% | 83.0% | 83.0% |
| MKH-SVM | 84.0% | 86.0% | 69.0% | 77.0% |
| Neural Net | 79.0% | 72.0% | 37.0% | 48.0% |
| Linear-SVM | 83.0% | 69.0% | 49.0% | 57.0% |

## 💻 Usage

### API Usage

**Health Check:**
```bash
curl http://localhost:5000/
```

**Classify Sentiment:**
```bash
curl -X POST http://localhost:5000/classify \
  -H "Content-Type: application/json" \
  -d '{"text": "Stay safe and healthy everyone!"}'
```

**Response:**
```json
{
  "sentiment": "positive",
  "confidence": 0.9234,
  "raw_output": [0.05, 0.92, 0.03]
}
```

### Python Usage

```python
import requests

response = requests.post(
    'http://localhost:5000/classify',
    json={'text': 'This vaccine gives me hope!'}
)
result = response.json()
print(f"Sentiment: {result['sentiment']}")
print(f"Confidence: {result['confidence']:.2%}")
```

### Flutter Usage

```dart
final sentimentService = SentimentService();

try {
  final sentiment = await sentimentService.classifySentiment(
    "Thanks to all healthcare workers!"
  );
  print('Sentiment: $sentiment');
} catch (e) {
  print('Error: $e');
}
```

## 🚀 Deployment

### Backend Deployment

**Production with Gunicorn:**
```bash
cd backend
pip install gunicorn
gunicorn -w 4 -b 0.0.0.0:5000 app:app
```

**Docker Deployment:**
```bash
cd backend
docker build -t sentiment-api .
docker run -p 5000:5000 -v $(pwd)/models:/app/models sentiment-api
```

### Mobile App Deployment

**Android APK:**
```bash
cd classifier_app
flutter build apk --release
```

**iOS:**
```bash
cd classifier_app
flutter build ios --release
```

**Web:**
```bash
cd classifier_app
flutter build web
```

**Desktop:**
```bash
# Windows
flutter build windows

# macOS
flutter build macos

# Linux
flutter build linux
```

## 🛠️ Technology Stack

### Deep Learning
- TensorFlow 2.x
- TensorFlow Hub
- BERT-base (uncased)
- Keras
- NumPy, Pandas
- Scikit-learn

### Backend
- Python 3.10+
- Flask 3.0+
- TensorFlow 2.x
- python-dotenv

### Mobile App
- Flutter 3.0+
- Dart 3.0+
- Material 3 Design
- HTTP package for API calls

### Training Environment
- Google Colab
- GPU Runtime (Tesla K80 or better)
- Training time: ~30 minutes per epoch

## 🔬 Text Preprocessing Pipeline

1. Deleting irrelevant columns
2. Removing retweets
3. Converting to lowercase
4. Removing URLs
5. Removing hashtags and mentions
6. Removing emojis
7. Handling internet slang
8. Removing HTML tags
9. Removing special characters and digits
10. Removing extra whitespaces

## 📱 Mobile App Features

- **Home Screen:** Feature cards and project overview
- **Classification Screen:** Real-time sentiment analysis with multi-line input
- **Performance Screen:** Model metrics visualization
- **Model Info Screen:** Architecture details and training process
- **Modern UI:** Material 3 with gradient headers and dark mode
- **Cross-platform:** Android, iOS, Web, Linux, macOS, Windows

## ⚙️ Configuration

### Backend Configuration (.env)

```env
MODEL_PATH=./models/Classifier-model
HOST=0.0.0.0
PORT=5000
FLASK_ENV=development
```

### Mobile App Configuration

Edit `classifier_app/lib/services/sentiment_service.dart`:

```dart
// Choose based on your environment
static const String baseUrl = 'http://10.0.2.2:5000';      // Android emulator
// static const String baseUrl = 'http://localhost:5000';   // iOS simulator
// static const String baseUrl = 'http://192.168.1.X:5000'; // Physical device
```

## 🔧 Troubleshooting

### Backend Issues

| Problem | Solution |
|---------|----------|
| Model path error | Download model from releases and extract to `backend/models/` |
| Module not found | Run `pip install -r requirements.txt` |
| Port in use | Change PORT in `.env` or use `PORT=5001 python app.py` |

### Mobile App Issues

| Problem | Solution |
|---------|----------|
| Connection refused | Verify backend is running and URL is correct |
| CORS errors | Backend should allow CORS (already configured) |
| Build errors | Run `flutter clean && flutter pub get` |

## 👨‍🎓 Authors

**Master's Thesis Project**

- **ZOUAGHI Anis**
- **BOUCHELAGHEM Ayyoub**

**Supervisor:**
- Dr. ZERABI Soumeya

**Institution:**
- University of Abdelhamid Mehri Constantine 2
- Faculty of New Technologies of Information and Communication (NTIC)
- Department of Fundamental Computing and its Applications (IFA)
- Master's Degree in Computer Science
- Option: Networks and Distributed Systems

**Date:** July 2023

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Dataset: Kaggle (AMAN MIGLANI - Coronavirus tweets NLP Text Classification)
- BERT model: Google AI Language / TensorFlow Hub
- Dr. ZERABI Soumeya for supervision and guidance
- Pr. GHERZOULI for practical help and moral support

## 📚 References

For detailed methodology, architecture, and experimental results, refer to:
- [Thesis.pdf](Thesis.pdf) - Complete thesis document
- [backend/README.md](backend/README.md) - Backend documentation
- [classifier_app/README.md](classifier_app/README.md) - Mobile app documentation

## 🔗 Resources

- [Dataset on Kaggle](https://www.kaggle.com/datasets/datatattle/covid-19-nlp-text-classification)
- [BERT Paper: "Attention is All You Need"](https://arxiv.org/abs/1706.03762)
- [TensorFlow Hub](https://tfhub.dev/)
- [Flutter Documentation](https://flutter.dev/docs)

## 🎓 Citation

If you use this project in your research, please cite:

```bibtex
@mastersthesis{zouaghi2023bert,
  title={BERT-based Sentiment Analysis for COVID-19 Tweets},
  author={Zouaghi, Anis and Bouchelaghem, Ayyoub},
  year={2023},
  school={University of Abdelhamid Mehri Constantine 2},
  type={Master's Thesis}
}
```

## 📞 Contact

For questions or collaborations, please open an issue on GitHub.

---

## ⚠️ Important Notes

1. **Model Download Required:** The trained model must be downloaded separately from the releases page
2. **Backend Dependency:** The mobile app requires the Flask backend to be running
3. **Network Configuration:** Update API endpoints based on your deployment environment
4. **Academic Project:** This is research work based on March-April 2020 COVID-19 data

---

<p align="center">
  <b>⭐ If you find this project useful, please consider giving it a star! ⭐</b>
</p>
