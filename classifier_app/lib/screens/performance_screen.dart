import 'package:flutter/material.dart';
import '../widgets/metric_card.dart';
import '../models/performance_metric.dart';

class PerformanceScreen extends StatelessWidget {
  const PerformanceScreen({super.key});

  static final List<PerformanceMetric> metrics = [
    PerformanceMetric(
      title: 'Accuracy',
      value: 91.21,
      icon: Icons.check_circle_outline,
      color: Colors.blue,
      description: 'Overall prediction correctness',
    ),
    PerformanceMetric(
      title: 'Precision',
      value: 92.02,
      icon: Icons.precision_manufacturing_outlined,
      color: Colors.green,
      description: 'True positive accuracy',
    ),
    PerformanceMetric(
      title: 'Recall',
      value: 90.39,
      icon: Icons.refresh_rounded,
      color: Colors.orange,
      description: 'True positive detection rate',
    ),
    PerformanceMetric(
      title: 'F1 Score',
      value: 89.00,
      icon: Icons.functions_rounded,
      color: Colors.purple,
      description: 'Harmonic mean of precision and recall',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Model Performance'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade50,
                    Colors.purple.shade50,
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Colors.blue.shade700,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'These metrics evaluate how well our BERT model performs on tweet sentiment classification',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.80,
                // crossAxisSpacing: 16,
                // mainAxisSpacing: 16,
              ),
              itemCount: metrics.length,
              itemBuilder: (context, index) {
                return MetricCard(metric: metrics[index]);
              },
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About These Metrics',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 16),
                    _buildMetricDescription(
                      context,
                      'Accuracy',
                      'The ratio of correct predictions to total predictions',
                    ),
                    _buildMetricDescription(
                      context,
                      'Precision',
                      'The proportion of positive identifications that were actually correct',
                    ),
                    _buildMetricDescription(
                      context,
                      'Recall',
                      'The proportion of actual positives that were identified correctly',
                    ),
                    _buildMetricDescription(
                      context,
                      'F1 Score',
                      'The harmonic mean of precision and recall, providing a balanced measure',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricDescription(BuildContext context, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
