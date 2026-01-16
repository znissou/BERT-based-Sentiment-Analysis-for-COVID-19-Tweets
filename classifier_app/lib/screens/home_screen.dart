import 'package:flutter/material.dart';
import '../widgets/feature_card.dart';
import '../widgets/gradient_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const GradientHeader(
              title: 'Sentiment Analysis',
              subtitle: 'BERT-based Tweet Classification',
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About This Project',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.blue.shade100),
                    ),
                    child: Text(
                      'An academic project by A. ZOUAGHI & A. BOUCHELAGHEM demonstrating a BERT-based deep learning model for sentiment classification of tweets.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            height: 1.5,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Features',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  FeatureCard(
                    icon: Icons.psychology_outlined,
                    title: 'Classify Tweets',
                    description: 'Analyze sentiment of tweets using our BERT model',
                    color: Colors.blue,
                    onTap: () => Navigator.pushNamed(context, '/classification'),
                  ),
                  FeatureCard(
                    icon: Icons.bar_chart_rounded,
                    title: 'Performance Metrics',
                    description: 'View model accuracy, precision, and other metrics',
                    color: Colors.green,
                    onTap: () => Navigator.pushNamed(context, '/performance'),
                  ),
                  FeatureCard(
                    icon: Icons.info_outline_rounded,
                    title: 'Model Information',
                    description: 'Learn about the architecture and training process',
                    color: Colors.purple,
                    onTap: () => Navigator.pushNamed(context, '/model_info'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
