import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/navigation/app_bottom_nav.dart';
import '../../../../core/theme/theme_controller.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}
class _OnboardingPageState extends State<OnboardingPage> {
  final page = PageController();
  int index = 0;
  final slides = const [
    (Icons.public_rounded, 'Your world.\nAlways connected.', 'Travel across borders with seamless digital connectivity.'),
    (Icons.bolt_rounded, 'Your eSIM.\nIn a few taps.', 'Choose a destination and find a plan that fits your journey.'),
    (Icons.qr_code_2_rounded, 'Land ready.\nConnect instantly.', 'Install your eSIM and spend less time searching for Wi-Fi.'),
  ];
  @override
  Widget build(BuildContext context) {
    final palette = Get.find<ThemeController>().palette;
    final item = slides[index];
    return Scaffold(body: SafeArea(child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(children: [
        Row(children: [
          Icon(Icons.public_rounded, color: palette.primary, size: 28),
          const SizedBox(width: 8),
          const Text('eSIMgram', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
          const Spacer(),
          TextButton(onPressed: () => Get.off(() => const HomeScreen()), child: const Text('Skip')),
        ]),
        const Spacer(),
        AnimatedContainer(duration: const Duration(milliseconds: 400), width: 220, height: 220,
          decoration: BoxDecoration(shape: BoxShape.circle,
            gradient: RadialGradient(colors: [palette.primary.withValues(alpha: .35), palette.primary.withValues(alpha: .03)]),
            border: Border.all(color: palette.primary.withValues(alpha: .35))),
          child: Icon(item.$1, size: 100, color: palette.primary)),
        const SizedBox(height: 48),
        AnimatedSwitcher(duration: const Duration(milliseconds: 250), child: Text(item.$2, key: ValueKey(index),
          textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900, height: 1.12))),
        const SizedBox(height: 16),
        Text(item.$3, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6)),
        const Spacer(),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(slides.length, (i) =>
          AnimatedContainer(duration: const Duration(milliseconds: 250), margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 7, width: index == i ? 26 : 7,
            decoration: BoxDecoration(color: index == i ? palette.primary : Theme.of(context).colorScheme.outlineVariant,
              borderRadius: BorderRadius.circular(8))))),
        const SizedBox(height: 28),
        SizedBox(width: double.infinity, height: 56, child: FilledButton(
          onPressed: () {
            if (index < slides.length - 1) {
              setState(() => index++);
            } else {
              Get.off(() => const HomeScreen());
            }
          },
          child: Text(index == slides.length - 1 ? 'Get started' : 'Continue'),
        )),
      ]),
    )));
  }
}
