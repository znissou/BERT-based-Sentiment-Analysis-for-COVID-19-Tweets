import 'package:flutter/material.dart';
import '../models/performance_metric.dart';

class MetricCard extends StatelessWidget {
  final PerformanceMetric metric;

  const MetricCard({
    super.key,
    required this.metric,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              metric.color.withOpacity(0.1),
              metric.color.withOpacity(0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: metric.color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                metric.icon,
                color: metric.color,
                size: 32,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              metric.title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade600,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              '${metric.value.toStringAsFixed(2)}%',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: metric.color,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              metric.description,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
