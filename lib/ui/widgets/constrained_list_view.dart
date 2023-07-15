import 'package:flutter/material.dart';
import 'package:fuks_app/utils/breakpoint_m3.dart';

class ConstrainedListView extends StatelessWidget {
  const ConstrainedListView({
    super.key,
    required this.children,
    this.minWidth = 600,
    this.maxWidth = 800,
    this.shrinkWrap = false,
    this.primary,
  });

  final List<Widget> children;
  final double minWidth;
  final double maxWidth;
  final bool shrinkWrap;
  final bool? primary;

  @override
  Widget build(BuildContext context) {
    final breakpoint = Breakpoint.fromMediaQuery(context);
    final media = MediaQuery.of(context);

    double width = media.size.width;

    if (breakpoint.window > WindowClass.medium || width >= maxWidth) {
      return ListView(
        shrinkWrap: shrinkWrap,
        primary: primary,
        children: children
            .map((child) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: breakpoint.spacing,
                      ),
                      constraints: BoxConstraints(
                        minWidth: minWidth,
                        maxWidth: maxWidth,
                      ),
                      child: child,
                    ),
                  ],
                ))
            .toList(),
      );
    } else {
      return ListView(
        shrinkWrap: shrinkWrap,
        primary: primary,
        children: children,
      );
    }
  }
}
