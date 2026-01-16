"""
Flask Sentiment Analysis API
BERT-based tweet sentiment classification backend
Updated for 2026 - Modern Flask patterns with error handling
"""

from flask import Flask, request, jsonify
from flask_cors import CORS
import tensorflow as tf
import tensorflow_text as text
import numpy as np
import emoji
import re
import os
import logging
from pathlib import Path

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Initialize Flask app
app = Flask(__name__)
CORS(app)  # Enable CORS for Flutter app

# Configuration
MODEL_PATH = os.environ.get('MODEL_PATH', './models/Classifier-model')
PORT = int(os.environ.get('PORT', 5000))
HOST = os.environ.get('HOST', '0.0.0.0')

# Sentiment mapping
SENTIMENT_LABELS = {0: 'neutral', 1: 'positive', 2: 'negative'}

# Global model variable
classifier_model = None


def clean_text(text):
    """
    Clean and preprocess tweet text

    Args:
        text (str): Raw tweet text

    Returns:
        str: Cleaned text
    """
    if not text or not isinstance(text, str):
        return ""

    # Step 1: Convert to lowercase
    text = text.lower()

    # Step 2: Remove URLs
    text = ' '.join(word for word in text.split() if not word.startswith('http'))

    # Step 3: Remove mentions (@) and hashtags (#)
    text = ' '.join(word for word in text.split() 
                   if not word.startswith('@') and not word.startswith('#'))

    # Step 4: Remove emojis
    text = emoji.replace_emoji(text, '')

    # Step 5: Handle abbreviations
    abbreviations = {
        "bro": "brother", "luv": "love", "omg": " ", "lol": " ",
        "fyi": "for your information", "u": "you", "cuz": "because",
        "wanna": "want to", "gonna": "going to", "im": "i am",
        "id": "i would", "hes": "he is", "shes": "she is",
        "werent": "were not", "arent": "are not", "wasnt": "was not",
        "isnt": "is not", "didnt": "did not", "couldnt": "could not",
        "shouldnt": "should not", "wouldnt": "would not", "dont": "do not",
        "doesnt": "does not", "thats": "that is", "theres": "there is",
        "whats": "what is", "theyre": "they are", "cant": "can not",
        "hadnt": "had not", "havent": "have not", "couldve": "could have",
        "shouldve": "should have", "wouldve": "would have",
        "hasnt": "has not", "aint": "are not", "youve": "you have",
        "theyve": "they have", "weve": "we have", "ain't": "are not",
        "'s": " is", "aren't": "are not", "can't": "cannot",
        "can't've": "cannot have", "'cause": "because",
        "could've": "could have", "couldn't": "could not",
        "couldn't've": "could not have", "didn't": "did not",
        "doesn't": "does not", "don't": "do not", "hadn't": "had not",
        "hadn't've": "had not have", "hasn't": "has not",
        "haven't": "have not", "he'd": "he would",
        "he'd've": "he would have", "he'll": "he will",
        "he'll've": "he will have", "how'd": "how did",
        "how'd'y": "how do you", "how'll": "how will",
        "i'd": "I would", "I'd've": "I would have", "I'll": "I will",
        "i'll've": "I will have", "I'm": "I am", "I've": "I have",
        "isn't": "is not", "it'd": "it would", "it'd've": "it would have",
        "it'll": "it will", "it'll've": "it will have",
        "let's": "let us", "ma'am": "madam", "mayn't": "may not",
        "might've": "might have", "mightn't": "might not",
        "mightn't've": "might not have", "must've": "must have",
        "mustn't": "must not", "mustn't've": "must not have",
        "needn't": "need not", "needn't've": "need not have",
        "o'clock": "of the clock", "oughtn't": "ought not",
        "oughtn't've": "ought not have", "shan't": "shall not",
        "sha'n't": "shall not", "shan't've": "shall not have",
        "she'd": "she would", "she'd've": "she would have",
        "she'll": "she will", "she'll've": "she will have",
        "should've": "should have", "shouldn't": "should not",
        "shouldn't've": "should not have", "so've": "so have",
        "that'd": "that would", "that'd've": "that would have",
        "there'd": "there would", "there'd've": "there would have",
        "they'd": "they would", "they'd've": "they would have",
        "they'll": "they will", "they'll've": "they will have",
        "they're": "they are", "they've": "they have",
        "to've": "to have", "wasn't": "was not", "we'd": "we would",
        "we'd've": "we would have", "we'll": "we will",
        "we'll've": "we will have", "we're": "we are",
        "we've": "we have", "weren't": "were not",
        "what'll": "what will", "what'll've": "what will have",
        "what're": "what are", "what've": "what have",
        "when've": "when have", "where'd": "where did",
        "where've": "where have", "who'll": "who will",
        "who'll've": "who will have", "who've": "who have",
        "why've": "why have", "will've": "will have",
        "won't": "will not", "won't've": "will not have",
        "would've": "would have", "wouldn't": "would not",
        "wouldn't've": "would not have", "y'all": "you all",
        "y'all'd": "you all would", "y'all'd've": "you all would have",
        "y'all're": "you all are", "y'all've": "you all have",
        "you'd": "you would", "you'd've": "you would have",
        "you'll": "you will", "you'll've": "you will have",
        "you're": "you are", "you've": "you have"
    }
    text = ' '.join(abbreviations.get(word, word) for word in text.split())

    # Step 6: Remove HTML tags
    text = re.sub('<[^<]+?>', '', text)

    # Step 7: Remove special characters and digits
    text = ''.join(char for char in text if char.isalnum() or char.isspace())

    # Step 8: Remove numbers
    text = ' '.join(word for word in text.split() if not word.isdigit())

    # Step 9: Remove extra whitespaces
    text = ' '.join(text.split())

    return text


def load_model():
    """Load the TensorFlow model"""
    global classifier_model

    try:
        model_path = Path(MODEL_PATH)

        if not model_path.exists():
            logger.error(f"Model path does not exist: {MODEL_PATH}")
            logger.info("Please ensure the model is in the correct location")
            return False

        logger.info(f"Loading model from: {MODEL_PATH}")
        classifier_model = tf.saved_model.load(str(model_path))
        logger.info("Model loaded successfully!")
        return True

    except Exception as e:
        logger.error(f"Error loading model: {str(e)}")
        return False


@app.route('/', methods=['GET'])
def home():
    """Health check endpoint"""
    return jsonify({
        'status': 'online',
        'service': 'Sentiment Analysis API',
        'model_loaded': classifier_model is not None,
        'version': '2.0'
    })


@app.route('/classify', methods=['POST'])
def classify():
    """
    Classify sentiment of input text

    Expected JSON:
        {"text": "Your tweet here"}

    Returns JSON:
        {"sentiment": "positive|negative|neutral"}
    """
    try:
        # Validate request
        if not request.json:
            return jsonify({'error': 'No JSON data provided'}), 400

        if 'text' not in request.json:
            return jsonify({'error': 'Missing "text" field in request'}), 400

        text = request.json['text']

        # Validate text input
        if not text or not isinstance(text, str):
            return jsonify({'error': 'Invalid text input'}), 400

        if len(text.strip()) == 0:
            return jsonify({'error': 'Empty text provided'}), 400

        # Check if model is loaded
        if classifier_model is None:
            return jsonify({'error': 'Model not loaded'}), 503

        # Preprocess text
        cleaned_text = clean_text(text)

        if len(cleaned_text.strip()) == 0:
            # If cleaning removed all text, return neutral
            return jsonify({'sentiment': 'neutral'})

        logger.info(f"Processing: '{text[:50]}...'")
        logger.info(f"Cleaned: '{cleaned_text[:50]}...'")

        # Make prediction
        prediction = classifier_model([cleaned_text])

        # Get the predicted class
        output_array = prediction.numpy()[0]
        predicted_class = np.argmax(output_array)
        confidence = float(output_array[predicted_class])

        # Get sentiment label
        sentiment = SENTIMENT_LABELS.get(predicted_class, 'unknown')

        logger.info(f"Prediction: {sentiment} (confidence: {confidence:.2f})")

        return jsonify({
            'sentiment': sentiment,
            'confidence': round(confidence, 4),
            'raw_output': output_array.tolist()
        })

    except Exception as e:
        logger.error(f"Error during classification: {str(e)}")
        return jsonify({'error': f'Classification failed: {str(e)}'}), 500


@app.errorhandler(404)
def not_found(error):
    """Handle 404 errors"""
    return jsonify({'error': 'Endpoint not found'}), 404


@app.errorhandler(500)
def internal_error(error):
    """Handle 500 errors"""
    return jsonify({'error': 'Internal server error'}), 500


if __name__ == '__main__':
    logger.info("Starting Sentiment Analysis API...")

    # Load model on startup
    if not load_model():
        logger.warning("Server starting without model loaded!")
        logger.warning("API will return 503 errors until model is available")

    # Run server
    logger.info(f"Server running on http://{HOST}:{PORT}")
    logger.info("Press CTRL+C to quit")

    app.run(host=HOST, port=PORT, debug=False)
