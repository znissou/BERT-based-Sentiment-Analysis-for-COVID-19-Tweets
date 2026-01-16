import 'package:flutter/material.dart';
import '../services/sentiment_service.dart';
import '../widgets/sentiment_result_card.dart';

class ClassifyScreen extends StatefulWidget {
  const ClassifyScreen({super.key});

  @override
  State<ClassifyScreen> createState() => _ClassifyScreenState();
}

class _ClassifyScreenState extends State<ClassifyScreen> {
  final TextEditingController _textController = TextEditingController();
  final SentimentService _sentimentService = SentimentService();

  String? _result;
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _classifySentiment() async {
    if (_textController.text.trim().isEmpty) {
      setState(() {
        _errorMessage = 'Please enter some text to classify';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _result = null;
    });

    try {
      final result = await _sentimentService.classifySentiment(_textController.text);
      setState(() {
        _result = result;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to classify: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tweet Classification'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.edit_note_rounded,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Enter Tweet',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _textController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: 'Type or paste a tweet here...',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        if (_errorMessage != null) {
                          setState(() => _errorMessage = null);
                        }
                      },
                    ),
                    if (_errorMessage != null) ...[
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.red.shade200),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.error_outline, color: Colors.red.shade700, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                _errorMessage!,
                                style: TextStyle(color: Colors.red.shade700),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _classifySentiment,
                        child: _isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : const Text('Analyze Sentiment'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            if (_result != null) ...[
              const SizedBox(height: 24),
              SentimentResultCard(sentiment: _result!),
            ],

            const SizedBox(height: 32),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.help_outline_rounded,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'How It Works',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildStep(1, 'Enter a tweet in the text field above'),
                    _buildStep(2, 'Tap the "Analyze Sentiment" button'),
                    _buildStep(3, 'View the sentiment classification result'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(int number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
