import 'package:flutter/material.dart';
import 'package:fuks_app/utils/breakpoint_m3.dart';

class ConstrainedListView extends StatelessWidget {
  const ConstrainedListView({
    super.key,
    required this.children,
    this.maxWidth = 800,
    this.shrinkWrap = false,
    this.primary,
    this.padding,
  });

  final List<Widget> children;
  final double maxWidth;
  final bool shrinkWrap;
  final bool? primary;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final breakpoint = Breakpoint.fromMediaQuery(context);

    return ListView(
      shrinkWrap: shrinkWrap,
      primary: primary,
      children: children
          .map(
            (child) => Center(
              child: Container(
                padding: padding ??
                    EdgeInsets.symmetric(
                      horizontal: breakpoint.spacing,
                    ),
                constraints: BoxConstraints(
                  maxWidth: maxWidth,
                ),
                child: child,
              ),
            ),
          )
          .toList(),
    );
  }
}
