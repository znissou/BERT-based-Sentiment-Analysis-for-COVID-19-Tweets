import 'package:flutter/material.dart';

class SentimentResultCard extends StatelessWidget {
  final String sentiment;

  const SentimentResultCard({
    super.key,
    required this.sentiment,
  });

  Color _getSentimentColor() {
    switch (sentiment.toLowerCase()) {
      case 'positive':
        return Colors.green;
      case 'negative':
        return Colors.red;
      case 'neutral':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  IconData _getSentimentIcon() {
    switch (sentiment.toLowerCase()) {
      case 'positive':
        return Icons.sentiment_satisfied_alt_rounded;
      case 'negative':
        return Icons.sentiment_dissatisfied_rounded;
      case 'neutral':
        return Icons.sentiment_neutral_rounded;
      default:
        return Icons.help_outline_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getSentimentColor();

    return Card(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color.withOpacity(0.1),
              color.withOpacity(0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(
              'Classification Result',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey.shade600,
                  ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _getSentimentIcon(),
                size: 48,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              sentiment.toUpperCase(),
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Sentiment detected successfully',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
