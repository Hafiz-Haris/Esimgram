import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/theme_controller.dart';
import '../../../../core/theme/palette.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final c = Get.find<ThemeController>();
    return Scaffold(
        appBar: AppBar(title: const Text('Appearance & settings')),
        body: ListView(padding: const EdgeInsets.all(20), children: [
          Text('Appearance',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w900)),
          const SizedBox(height: 10),
          Obx(() => Card(
                  child: SwitchListTile(
                secondary: Icon(c.mode.value == ThemeMode.dark
                    ? Icons.dark_mode_rounded
                    : Icons.light_mode_rounded),
                title: const Text('Dark mode',
                    style: TextStyle(fontWeight: FontWeight.w800)),
                subtitle: const Text('Choose the look that feels right'),
                value: c.mode.value == ThemeMode.dark,
                onChanged: c.toggleMode,
              ))),
          const SizedBox(height: 22),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Expanded(
                          child: Text('Color universe',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w900))),
                      Obx(() => Text(
                          '${c.paletteIndex.value + 1} / ${appPalettes.length}',
                          style: Theme.of(context).textTheme.bodySmall)),
                    ]),
                    const SizedBox(height: 10),
                    const Text(
                        'Your palette changes buttons, accents, navigation and highlights throughout the app.'),
                    const SizedBox(height: 16),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: appPalettes.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1.04),
                      itemBuilder: (context, i) {
                        final p = appPalettes[i];
                        return Obx(() {
                          final selected = c.paletteIndex.value == i;
                          return InkWell(
                            borderRadius: BorderRadius.circular(18),
                            onTap: () => c.selectPalette(i),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                      color: selected
                                          ? p.primary
                                          : Theme.of(context)
                                              .colorScheme
                                              .outlineVariant,
                                      width: selected ? 2 : 1)),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Row(children: [
                                      _dot(p.primary),
                                      const SizedBox(width: 4),
                                      _dot(p.secondary),
                                      const SizedBox(width: 4),
                                      _dot(p.accent),
                                      const Spacer(),
                                      if (selected)
                                        Icon(Icons.check_circle,
                                            size: 17, color: p.primary),
                                    ])),
                                    const SizedBox(height: 8),
                                    Text(p.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w800)),
                                  ]),
                            ),
                          );
                        });
                      },
                    ),
                  ]),
            ),
          ),
          const SizedBox(height: 22),
          const Card(
              child: ListTile(
                  leading: Icon(Icons.language_rounded),
                  title: Text('Language'),
                  subtitle: Text('English · more languages can be added'))),
          const Card(
              child: ListTile(
                  leading: Icon(Icons.privacy_tip_outlined),
                  title: Text('Privacy & security'),
                  subtitle: Text('Manage account and privacy preferences'))),
          const Card(
              child: ListTile(
                  leading: Icon(Icons.info_outline_rounded),
                  title: Text('About eSIMgram'),
                  subtitle: Text('Version 1.0.0 · Travel smarter'))),
        ]));
  }

  Widget _dot(Color color) => Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle));
}
