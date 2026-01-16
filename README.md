
# BERT-based Sentiment Analysis for COVID-19 Tweets

A deep learning project that uses BERT (Bidirectional Encoder Representations from Transformers) to classify sentiment in COVID-19 related tweets into three categories: Positive, Negative, and Neutral.

## 📋 Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Dataset](#dataset)
- [Installation](#installation)
- [Usage](#usage)
- [Model Performance](#model-performance)
- [Project Structure](#project-structure)
- [Results](#results)
- [Mobile Application](#mobile-application)
- [Authors](#authors)
- [License](#license)

## 🎯 Overview

This project implements a sentiment analysis model for COVID-19 tweets using BERT transformers. The model was developed as part of a Master's thesis at the University of Abdelhamid Mehri Constantine 2, Faculty of New Technologies of Information and Communication (NTIC).

**Key Highlights:**
- **Accuracy:** 91.4%
- **Dataset:** 41,157 COVID-19 related tweets
- **Time Period:** March to mid-April 2020
- **Classes:** Positive, Negative, Neutral

## ✨ Features

- State-of-the-art BERT-based sentiment classification
- Comprehensive text preprocessing pipeline
- Custom tokenization with sequence length optimization (60 tokens)
- Transfer learning with BERT-base model (110M parameters)
- Mobile application for real-time sentiment prediction
- Detailed performance metrics and visualizations

## 🏗️ Architecture

The model consists of the following layers:

1. **Input Layer:** Accepts text data as strings
2. **BERT Preprocessor Tokenizer:** Handles tokenization
3. **BERT Preprocessor:** Converts tokens to BERT input format
   - Input word IDs
   - Attention masks
   - Token type IDs
4. **BERT Encoder:** 12 transformer layers with 768 hidden units
5. **Output Layer:** Dense layer with softmax activation for 3-class classification

**Model Parameters:**
- Total params: 109,484,548
- Trainable params: 109,484,547
- Optimizer: Adam (learning rate: 2e-5)
- Loss function: Categorical Crossentropy
- Batch size: 50
- Epochs: 3

## 📊 Dataset

**Source:** Kaggle - Coronavirus tweets NLP Text Classification

**Statistics:**
- Total records: 41,157 tweets
- Features: Username, Screen name, Location, Tweet date, Original tweet, Sentiment
- Refined classes distribution:
  - Positive: 18,046 (43.8%)
  - Negative: 15,398 (37.4%)
  - Neutral: 7,713 (18.7%)

## 🚀 Installation

### Prerequisites
- Python 3.7+
- Google Colab (recommended) or local GPU environment
- TensorFlow 2.x
- TensorFlow Hub

### Setup Instructions

1. **Clone the repository:**
```bash
git clone <your-repository-url>
cd BERT-COVID19-Sentiment-Analysis
```

2. **Upload dataset to Google Drive:**
```python
# Upload the 'datasets' folder to your Google Drive root
# Path should be: /content/drive/MyDrive/datasets/
```

3. **Create models folder:**
```python
# Create a 'models' folder in your Google Drive root for saving trained models
# Path: /content/drive/MyDrive/models/
```

4. **Open the notebook in Google Colab:**
```bash
# Open BERT-based-Sentiment-Analysis-for-COVID-19-Tweets.ipynb
# Make sure to use GPU runtime (Runtime > Change runtime type > GPU)
```


## 💻 Usage

### Training the Model

```python
# Mount Google Drive
from google.colab import drive
drive.mount('/content/drive')

# Load and preprocess data
df = pd.read_csv('/content/drive/MyDrive/datasets/CoronaNLP/train.csv', encoding='ISO-8859-1')

# Train the model
history = classifier_model.fit(
    df['tweet'].astype(str),
    label.astype(int),
    epochs=3,
    batch_size=50,
    validation_split=0.2
)

# Save the model
saved_model_path = '/content/drive/MyDrive/models/Classifier'
classifier_model.save(saved_model_path)
```


### Making Predictions

```python
# Load the model
loaded_model = tf.keras.models.load_model(saved_model_path)

# Predict sentiment
sample_tweet = "Hope everyone stays safe during these times"
prediction = loaded_model.predict([sample_tweet])
sentiment = np.argmax(prediction)  # 0: Neutral, 1: Positive, 2: Negative
```


## 📈 Model Performance

### Overall Metrics

| Metric | Score |
| :-- | :-- |
| Accuracy | 91.4% |
| Precision | 92.02% |
| Recall | 90.39% |
| F1-Score | 89.0% |

### Per-Class Performance

| Class | Precision | Recall | F1-Score |
| :-- | :-- | :-- | :-- |
| Neutral | High | High | High |
| Positive | 92.02% | 90.39% | High |
| Negative | High | High | High |

### Comparison with Other Models

| Model | Accuracy | Precision | Recall | F1-Score |
| :-- | :-- | :-- | :-- | :-- |
| **BERT (Ours)** | **91.4%** | **92.02%** | **90.39%** | **89.0%** |
| LSTM | 83.0% | 83.0% | 83.0% | 83.0% |
| MKH-SVM | 84.0% | 86.0% | 69.0% | 77.0% |
| Neural Net | 79.0% | 72.0% | 37.0% | 48.0% |
| Linear-SVM | 83.0% | 69.0% | 49.0% | 57.0% |

## 📁 Project Structure

```
BERT-COVID19-Sentiment-Analysis/
│
├── Deep learning model/
│   ├── BERT-based-Sentiment-Analysis-for-COVID-19-Tweets.ipynb
│   └── datasets/
│       └── CoronaNLP/
│           ├── train.csv
│           └── test.csv
│
├── Mobile application/
│   ├── classifier_app_v2/          # Flutter frontend
│   ├── Flask_Sentiment_Backend.ipynb
│   └── Classifier-model/           # Saved trained model
│
├── Thesis.pdf
├── instructions.pdf
├── LICENSE
└── README.md
```


## 🔬 Text Preprocessing Pipeline

The preprocessing pipeline includes:

1. **Deleting irrelevant columns** (username, screen name, date, location)
2. **Removing retweets**
3. **Converting to lowercase**
4. **Removing URLs**
5. **Removing hashtags and mentions**
6. **Removing emojis**
7. **Handling internet slang** (using abbreviation dictionary)
8. **Removing HTML tags**
9. **Removing special characters and digits**
10. **Removing extra whitespaces**

## 📱 Mobile Application

A Flutter-based mobile application provides a user-friendly interface for real-time sentiment classification.

### Features:

- **Classify Screen:** Input tweets for sentiment prediction
- **Performance Screen:** View model metrics and results
- **Information Screen:** Learn about the model architecture


### Backend:

- Flask server handles classification requests
- RESTful API endpoint for predictions
- Real-time sentiment analysis


### Running the Mobile App:

**Frontend (Flutter):**

```bash
cd Mobile application/classifier_app_v2
flutter run
```

**Backend (Flask):**

```bash
# Open Flask_Sentiment_Backend.ipynb in Jupyter Notebook
# Update model path and run the server
```


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

- Dataset source: Kaggle (AMAN MIGLANI - Coronavirus tweets NLP Text Classification)
- BERT model: Google AI Language
- Special thanks to Dr. ZERABI Soumeya for supervision and guidance
- Thanks to Pr. GHERZOULI for practical help and moral support


## 📚 References

For detailed information about the methodology, architecture, and experiments, please refer to the [Thesis.pdf](Thesis.pdf) document.

## 🔗 Links

- [Dataset on Kaggle](https://www.kaggle.com/)
- [BERT Paper: "Attention is All You Need"](https://arxiv.org/abs/1706.03762)
- [TensorFlow Hub](https://tfhub.dev/)


## 📊 Training Environment

- **Platform:** Google Colab
- **Runtime:** GPU (Tesla K80 or better recommended)
- **Libraries:** TensorFlow 2.x, TensorFlow Hub, Keras, Pandas, NumPy, Scikit-learn
- **Training Time:** Approximately 30 minutes per epoch


## 🎓 Citation

If you use this project in your research, please cite:

```bibtex
@mastersthesis{
  title={BERT-based Sentiment Analysis for COVID-19 Tweets},
  author={Zouaghi Anis and Bouchelaghem Ayyoub},
  year={2023},
  school={University of Abdelhamid Mehri Constantine 2},
  type={Master's Thesis}
}
```


## 📞 Contact

For questions or collaborations, please feel free to reach out through the project repository.

---

**Note:** This is an academic project completed as part of a Master's degree program. The model and results are based on data from March-April 2020 during the early COVID-19 pandemic period.


