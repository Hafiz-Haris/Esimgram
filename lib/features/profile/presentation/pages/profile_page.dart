import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/theme_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    final palette = Get.find<ThemeController>().palette;
    final items = [
      (Icons.shopping_bag_outlined, 'Orders', 'Your purchase history'),
      (Icons.favorite_border, 'Favorites', 'Saved destinations and plans'),
      (
        Icons.notifications_none_rounded,
        'Notifications',
        'Connectivity and offers'
      ),
      (Icons.support_agent_rounded, 'Support', 'Help, FAQs and contact'),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Your profile')),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(26)),
          child: Column(children: [
            CircleAvatar(
                radius: 38,
                backgroundColor: palette.primary.withValues(alpha: .15),
                child: Icon(Icons.person_rounded,
                    size: 42, color: palette.primary)),
            const SizedBox(height: 12),
            const Text('Welcome, traveller',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900)),
            const SizedBox(height: 4),
            const Text('Sign in to sync your eSIMs across devices'),
            const SizedBox(height: 14),
            FilledButton(
                onPressed: () => Get.snackbar('Authentication',
                    'Connect your login API to enable accounts.'),
                child: const Text('Sign in / Create account')),
          ]),
        ),
        const SizedBox(height: 18),
        ...items.map((item) => Card(
                child: ListTile(
              leading: Icon(item.$1, color: palette.primary),
              title: Text(item.$2,
                  style: const TextStyle(fontWeight: FontWeight.w800)),
              subtitle: Text(item.$3),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                if (item.$2 == 'Favorites') {
                  Get.toNamed(AppRoutes.favorites);
                } else if (item.$2 == 'Support') {
                  Get.toNamed(AppRoutes.support);
                } else {
                  Get.snackbar(
                      item.$2, 'This feature is scaffolded for integration.');
                }
              },
            ))),
        Card(
            child: ListTile(
                leading: Icon(Icons.settings_outlined, color: palette.primary),
                title: const Text('Settings',
                    style: TextStyle(fontWeight: FontWeight.w800)),
                subtitle: const Text('Theme, palette and preferences'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Get.toNamed(AppRoutes.settings))),
      ]),
    );
  }
}
