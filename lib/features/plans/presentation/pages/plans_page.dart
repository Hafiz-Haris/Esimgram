import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/palette.dart';
import '../../../../core/theme/theme_controller.dart';
import '../../../../core/widgets/gradient_panel.dart';
import '../../../auth/presentation/widgets/login_bottom_sheet.dart';
// Agar LoginBottomSheet kisi aur file mein hai toh usko yahan import kar lena:
// import '../auth/presentation/widgets/login_bottom_sheet.dart';

class PlansPage extends StatelessWidget {
  const PlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = Get.find<ThemeController>().palette;
    final destination = Get.arguments as String?;
    final plans = [
      ('5 GB', '7 days', '\$4.90', 'For a short city break'),
      ('10 GB', '15 days', '\$9.90', 'Perfect for a two-week trip'),
      ('20 GB', '30 days', '\$16.90', 'Best for longer adventures'),
      ('Unlimited', '30 days', '\$29.90', 'Go all-in on connectivity'),
    ];

    return Scaffold(
        appBar: AppBar(
            title: Text(destination == null
                ? 'Choose your plan'
                : 'Plans for $destination')),
        body: ListView(padding: const EdgeInsets.all(20), children: [
          Text(
              destination == null
                  ? 'A plan for every journey'
                  : 'Stay connected in $destination',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w900)),
          const SizedBox(height: 8),
          const Text(
              'Sample pricing for UI preview — connect your provider API for live offers.'),
          const SizedBox(height: 20),
          ...plans.asMap().entries.map((entry) {
            final i = entry.key;
            final p = entry.value;
            return Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: i == 2
                    ? GradientPanel(
                        palette: palette,
                        child: _PlanContent(plan: p, featured: true, palette: palette))
                    : Card(
                        child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: _PlanContent(plan: p, featured: false, palette: palette))));
          }),
        ]));
  }
}

class _PlanContent extends StatelessWidget {
  const _PlanContent({
    required this.plan,
    required this.featured,
    required this.palette,
  });

  final (String, String, String, String) plan;
  final bool featured;
  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    final fg =
        featured ? Colors.white : Theme.of(context).colorScheme.onSurface;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (featured)
        const Text('✦ BEST VALUE',
            style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w900,
                fontSize: 11,
                letterSpacing: 1.2)),
      Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Expanded(
            child: Text(plan.$1,
                style: TextStyle(
                    color: fg, fontSize: 27, fontWeight: FontWeight.w900))),
        Text(plan.$3,
            style: TextStyle(
                color: fg, fontSize: 23, fontWeight: FontWeight.w900)),
      ]),
      const SizedBox(height: 5),
      Text('${plan.$2} · ${plan.$4}',
          style: TextStyle(color: fg.withValues(alpha: .75))),
      const SizedBox(height: 15),
      SizedBox(
          width: double.infinity,
          child: featured
              ? FilledButton.tonal(
                  onPressed: () {
                    // Yahan humne helper function call kar diya hai
                    triggerLoginBottomSheet(context, palette);
                  },
                  child: const Text('Choose plan'))
              : OutlinedButton(
                  onPressed: () {
                    // Yahan bhi helper function call kar diya hai
                    triggerLoginBottomSheet(context, palette);
                  },
                  child: const Text('Choose plan'))),
    ]);
  }
}

/// Yeh raha wo helper function jisko aap kahin bhi rakh sakte hain.
/// Isko aapne is hi file ke bilkul akhir (bottom) mein paste kar dena hai.
void triggerLoginBottomSheet(BuildContext context, AppPalette currentPalette) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent, // Background transparent rakhein taake border radius clean dikhe
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, // Keyboard open hone par overflow se bachne ke liye
      ),
      child: LoginBottomSheet(palette: currentPalette),
    ),
  );
}