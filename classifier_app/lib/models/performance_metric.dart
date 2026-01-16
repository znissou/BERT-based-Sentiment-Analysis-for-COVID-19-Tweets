import 'package:flutter/material.dart';

class PerformanceMetric {
  final String title;
  final double value;
  final IconData icon;
  final Color color;
  final String description;

  const PerformanceMetric({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.description,
  });
}
