# Sentiment Analysis Backend

Flask API for BERT-based tweet sentiment classification.

## 🚀 Quick Setup

### 1. Download Model

⚠️ **The model is NOT included in this repository (440 MB - too large for Git)**

**Download from [GitHub Releases](../../releases/latest)**

Extract to the `models/` directory. Your structure should look like:

```
backend/
├── .env
├── app.py
├── requirements.txt
├── README.md
└── models/
    └── Classifier-model/
        ├── saved_model.pb
        ├── keras_metadata.pb
        ├── fingerprint.pb
        ├── variables/
        │   ├── variables.data-00000-of-00001
        │   └── variables.index
        └── assets/
            └── vocab.txt
```

### 2. Install Dependencies

```bash
pip install -r requirements.txt
```

### 3. Run Server

```bash
python app.py
```

✅ Server running at `http://localhost:5000`

You should see:
```
INFO:__main__:Starting Sentiment Analysis API...
INFO:__main__:Loading model from: ./models/Classifier-model
INFO:__main__:Model loaded successfully!
INFO:__main__:Server running on http://0.0.0.0:5000
```

## 📡 API Usage

### Health Check
```bash
curl http://localhost:5000/
```

**Response:**
```json
{
  "status": "online",
  "service": "Sentiment Analysis API",
  "model_loaded": true,
  "version": "2.0"
}
```

### Classify Sentiment
```bash
curl -X POST http://localhost:5000/classify \
  -H "Content-Type: application/json" \
  -d '{"text": "I love this project!"}'
```

**Response:**
```json
{
  "sentiment": "positive",
  "confidence": 0.9234,
  "raw_output": [0.05, 0.92, 0.03]
}
```

**Possible sentiments:** `positive`, `negative`, `neutral`

## ⚙️ Configuration

The `.env` file contains:
```env
MODEL_PATH=./models/Classifier-model
HOST=0.0.0.0
PORT=5000
FLASK_ENV=development
```

**Change port:**
```bash
PORT=5001 python app.py
```

## 🔧 Troubleshooting

| Problem | Solution |
|---------|----------|
| `Model path does not exist` | Download model from [Releases](../../releases) and extract to `models/` |
| `Module not found` errors | Run `pip install -r requirements.txt` |
| Port already in use | Run with different port: `PORT=5001 python app.py` |
| CORS errors from Flutter | Use correct URL: Android=`10.0.2.2:5000`, iOS=`localhost:5000`, Device=`YOUR_IP:5000` |

## 🧪 Testing

**Python:**
```python
import requests

response = requests.post(
    'http://localhost:5000/classify',
    json={'text': 'This is amazing!'}
)
print(response.json())
```

**Flutter (in `sentiment_service.dart`):**
```dart
// Android emulator
static const String baseUrl = 'http://10.0.2.2:5000';

// iOS simulator  
static const String baseUrl = 'http://localhost:5000';

// Physical device (replace with your IP)
static const String baseUrl = 'http://192.168.1.X:5000';
```



## 🚀 Production Deployment

Install gunicorn:
```bash
pip install gunicorn
```

Run with multiple workers:
```bash
gunicorn -w 4 -b 0.0.0.0:5000 app:app
```

## 🐳 Docker (Optional)

Create `Dockerfile`:
```dockerfile
FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
```

**Build and run:**
```bash
docker build -t sentiment-api .
docker run -p 5000:5000 -v $(pwd)/models:/app/models sentiment-api
```

## 📝 Project Info

**Model Download:** [Releases Page](../../releases/latest)  
**Flutter App:** See main repository README

---

**Note:** Make sure to download the model before running! The app won't work without it.
