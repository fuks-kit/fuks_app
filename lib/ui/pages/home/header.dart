import 'package:flutter/material.dart';
import 'package:undraw/undraw.dart';

class HeaderWithIllustration extends StatelessWidget {
  const HeaderWithIllustration({
    super.key,
    required this.title,
    required this.subtitle,
    required this.illustration,
    this.dimension = 200,
  });

  final String title;
  final String subtitle;
  final UnDrawIllustration illustration;
  final double dimension;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  // color: colorScheme.primary,
                ),
              ),
              Text(
                subtitle,
                style: textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: UnDraw(
            width: dimension,
            height: dimension,
            illustration: illustration,
            color: colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
