import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FuksLogo extends StatelessWidget {
  const FuksLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'fuks',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 8),
        FuksIcon(),
      ],
    );
  }
}

class FuksIcon extends StatelessWidget {
  const FuksIcon({
    super.key,
    this.size = 24,
    this.color,
  });

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: size,
      height: size,
      child: SvgPicture.asset(
        "assets/fuks_logo.svg",
        colorFilter: ColorFilter.mode(
          color ?? colorScheme.onSurface,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
