import 'package:flutter/material.dart';
import '../theme/palette.dart';

class GradientPanel extends StatelessWidget {
  const GradientPanel({super.key, required this.palette, required this.child, this.padding = const EdgeInsets.all(20)});
  final AppPalette palette;
  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => Container(
    padding: padding,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft, end: Alignment.bottomRight,
        colors: [palette.primary.withValues(alpha: .95), palette.secondary, const Color(0xFF111827)],
      ),
      borderRadius: BorderRadius.circular(28),
      border: Border.all(color: Colors.white.withValues(alpha: .12)),
      boxShadow: [BoxShadow(color: palette.glow, blurRadius: 28, offset: const Offset(0, 12))],
    ),
    child: child,
  );
}
