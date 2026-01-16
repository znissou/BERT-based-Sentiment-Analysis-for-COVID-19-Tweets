import 'package:flutter/material.dart';

class ModelInfoScreen extends StatelessWidget {
  const ModelInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Model Information'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade400, Colors.purple.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.model_training_rounded,
                      size: 64,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'BERT-Based Classification',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Deep Learning Model for Tweet Sentiment Analysis',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white.withOpacity(0.9),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            _buildSection(
              context,
              icon: Icons.psychology_outlined,
              title: 'Overview',
              content:
                  'The deep learning model used for tweet classification consists of several layers that extract relevant features from the input text and a final classification layer that maps the extracted features to the target sentiment classes.',
            ),

            _buildArchitectureSection(context),

            _buildSection(
              context,
              icon: Icons.science_outlined,
              title: 'Experiment Environment',
              content:
                  'Various software and hardware environments were used to develop and evaluate our deep learning model:',
              children: [
                _buildEnvironmentItem(
                  context,
                  'Google Colab',
                  'Cloud-based Jupyter notebook environment with GPU/TPU access for seamless model training and experimentation.',
                ),
                _buildEnvironmentItem(
                  context,
                  'TensorFlow Hub',
                  'Repository of pre-trained models and embeddings, enabling transfer learning for improved performance.',
                ),
                _buildEnvironmentItem(
                  context,
                  'TensorFlow & Keras',
                  'Open-source deep learning framework providing essential tools for building and training neural networks.',
                ),
                _buildEnvironmentItem(
                  context,
                  'Kaggle',
                  'Data science platform providing access to COVID-labeled tweet datasets for model training and validation.',
                ),
              ],
            ),

            _buildSection(
              context,
              icon: Icons.tune_rounded,
              title: 'Hyperparameters',
              children: [
                _buildHyperparameterItem(
                  context,
                  'Optimizer',
                  'Adam with learning rate of 2e-5',
                ),
                _buildHyperparameterItem(
                  context,
                  'Loss Function',
                  'CategoricalCrossentropy for multi-class classification',
                ),
                _buildHyperparameterItem(
                  context,
                  'Batch Size',
                  '50 samples per iteration',
                ),
                _buildHyperparameterItem(
                  context,
                  'Epochs',
                  '3 complete passes through the dataset',
                ),
                _buildHyperparameterItem(
                  context,
                  'Validation Split',
                  '0.2 (20% of data for validation)',
                ),
              ],
            ),

            _buildSection(
              context,
              icon: Icons.school_outlined,
              title: 'Training Process',
              content:
                  'The model was trained on COVID-19 related tweets, using data partitioning, batch processing, and multiple epochs to optimize performance. The validation split ensured effective evaluation of generalization capability.',
            ),

            _buildSection(
              context,
              icon: Icons.emoji_events_outlined,
              title: 'Results Summary',
              content:
                  'The model achieved promising results with 85% accuracy, demonstrating strong ability to classify positive, negative, and neutral sentiments in COVID-related tweets. All sentiment classes showed balanced performance with precision, recall, and F1 scores around 85%.',
            ),

            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.lightbulb_outline, color: Colors.amber.shade700),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'This model demonstrates the effectiveness of transfer learning using BERT for sentiment analysis tasks.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.amber.shade900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? content,
    List<Widget>? children,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ],
            ),
            if (content != null) ...[
              const SizedBox(height: 12),
              Text(
                content,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
            if (children != null) ...[
              const SizedBox(height: 12),
              ...children,
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildArchitectureSection(BuildContext context) {
    final layers = [
      {'name': 'Input Layer', 'desc': 'Accepts text data as input'},
      {'name': 'BERT Tokenizer', 'desc': 'Handles tokenization process'},
      {
        'name': 'BERT Preprocessor',
        'desc': 'Converts tokens to input IDs and attention masks'
      },
      {
        'name': 'BERT Encoder',
        'desc': 'Encodes text using BERT algorithm'
      },
      {'name': 'Output Layer', 'desc': 'Dense layer with sigmoid activation'},
    ];

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.account_tree_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Text(
                  'Model Architecture',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...layers.asMap().entries.map((entry) {
              final index = entry.key;
              final layer = entry.value;
              return Column(
                children: [
                  _buildLayerItem(context, index + 1, layer['name']!, layer['desc']!),
                  if (index < layers.length - 1)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Icon(
                        Icons.arrow_downward_rounded,
                        color: Colors.grey.shade400,
                        size: 20,
                      ),
                    ),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildLayerItem(
      BuildContext context, int number, String name, String description) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
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
          ),
        ],
      ),
    );
  }

  Widget _buildEnvironmentItem(
      BuildContext context, String name, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            color: Theme.of(context).colorScheme.primary,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
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
          ),
        ],
      ),
    );
  }

  Widget _buildHyperparameterItem(
      BuildContext context, String name, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
