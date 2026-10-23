import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/theme_controller.dart';
import '../../../../core/widgets/gradient_panel.dart';
import '../../../../core/widgets/section_title.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put<HomeController>(HomeController(), permanent: true);
    final theme = Get.find<ThemeController>();
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 110),
              sliver: SliverList(
                  delegate: SliverChildListDelegate([
                Row(children: [
                  Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                          color: theme.palette.primary.withValues(alpha: .16),
                          borderRadius: BorderRadius.circular(16)),
                      child: Icon(Icons.public_rounded,
                          color: theme.palette.primary, size: 28)),
                  const SizedBox(width: 12),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text('Good day, traveller',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: colors.onSurfaceVariant)),
                        Text('Stay connected.',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.w900)),
                      ])),
                  IconButton.filledTonal(
                      onPressed: () => Get.toNamed(AppRoutes.settings),
                      icon: const Icon(Icons.tune_rounded)),
                ]),
                const SizedBox(height: 24),
                GradientPanel(
                    palette: theme.palette,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            const Icon(Icons.sensors_rounded,
                                color: Colors.white70),
                            const SizedBox(width: 8),
                            const Expanded(
                                child: Text('YOUR CONNECTIVITY',
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 11,
                                        letterSpacing: 1.4,
                                        fontWeight: FontWeight.w800))),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: .14),
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Text('ACTIVE',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w800))),
                          ]),
                          const SizedBox(height: 22),
                          const Text('Japan · Travel eSIM',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700)),
                          const SizedBox(height: 4),
                          Obx(() => TweenAnimationBuilder<double>(
                                tween: Tween(
                                    begin: 0,
                                    end: c.remainingGb.value / c.totalGb),
                                duration: const Duration(milliseconds: 900),
                                builder: (_, value, __) => Text(
                                    '${c.remainingGb.value.toStringAsFixed(1)} GB',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 36,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: -1.5)),
                              )),
                          const Text('remaining of 20 GB',
                              style: TextStyle(color: Colors.white70)),
                          const SizedBox(height: 18),
                          Obx(() => ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: LinearProgressIndicator(
                                  minHeight: 8,
                                  value: c.remainingGb.value / c.totalGb,
                                  backgroundColor:
                                      Colors.white.withValues(alpha: .2),
                                  valueColor: const AlwaysStoppedAnimation(
                                      Colors.white)))),
                          const SizedBox(height: 18),
                          Row(children: [
                            const Icon(Icons.calendar_month_rounded,
                                color: Colors.white70, size: 18),
                            const SizedBox(width: 7),
                            const Expanded(
                                child: Text('18 days left',
                                    style: TextStyle(color: Colors.white))),
                            TextButton(
                                onPressed: () => Get.toNamed(AppRoutes.myEsims),
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.white),
                                child: const Text('Manage eSIM →')),
                          ]),
                        ])),
                const SizedBox(height: 28),
                const SectionTitle('Quick actions'),
                const SizedBox(height: 14),
                Row(children: [
                  _QuickAction(
                      icon: Icons.travel_explore_rounded,
                      label: 'Explore',
                      color: theme.palette.primary,
                      onTap: () => Get.toNamed(AppRoutes.destinations)),
                  const SizedBox(width: 12),
                  _QuickAction(
                      icon: Icons.shopping_bag_outlined,
                      label: 'Plans',
                      color: theme.palette.accent,
                      onTap: () => Get.toNamed(AppRoutes.plans)),
                  const SizedBox(width: 12),
                  _QuickAction(
                      icon: Icons.qr_code_2_rounded,
                      label: 'Install',
                      color: const Color(0xFF35C99A),
                      onTap: () => Get.toNamed(AppRoutes.myEsims)),
                ]),
                const SizedBox(height: 28),
                SectionTitle('Popular destinations',
                    action: 'See all',
                    onAction: () => Get.toNamed(AppRoutes.destinations)),
                const SizedBox(height: 12),
                SizedBox(
                    height: 148,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: c.destinations.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (_, i) {
                        final d = c.destinations[i];
                        return InkWell(
                          borderRadius: BorderRadius.circular(22),
                          onTap: () => Get.toNamed(AppRoutes.plans,
                              arguments: d['name']),
                          child: Container(
                              width: 148,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: colors.surface,
                                  borderRadius: BorderRadius.circular(22),
                                  border: Border.all(
                                      color: colors.outlineVariant
                                          .withValues(alpha: .45))),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(d['flag']!,
                                        style: const TextStyle(fontSize: 29)),
                                    const Spacer(),
                                    Text(d['name']!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w800)),
                                    const SizedBox(height: 3),
                                    Text('From ${d['price']}',
                                        style: TextStyle(
                                            color: theme.palette.primary,
                                            fontWeight: FontWeight.w800)),
                                  ])),
                        );
                      },
                    )),
                const SizedBox(height: 28),
                const SectionTitle('Built for your next trip'),
                const SizedBox(height: 12),
                Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        color: colors.surface,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                            color:
                                colors.outlineVariant.withValues(alpha: .4))),
                    child: Row(children: [
                      Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                              color:
                                  theme.palette.primary.withValues(alpha: .14),
                              borderRadius: BorderRadius.circular(18)),
                          child: Icon(Icons.rocket_launch_rounded,
                              color: theme.palette.primary, size: 28)),
                      const SizedBox(width: 14),
                      const Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text('Your world, without roaming fees',
                                style: TextStyle(fontWeight: FontWeight.w800)),
                            SizedBox(height: 5),
                            Text('Find a plan before you land.',
                                style: TextStyle(fontSize: 12)),
                          ])),
                      Icon(Icons.arrow_forward_ios_rounded,
                          size: 16, color: colors.onSurfaceVariant),
                    ])),
              ])),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  const _QuickAction(
      {required this.icon,
      required this.label,
      required this.color,
      required this.onTap});
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Expanded(
          child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .outlineVariant
                        .withValues(alpha: .4))),
            child: Column(children: [
              Icon(icon, color: color, size: 25),
              const SizedBox(height: 8),
              Text(label,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 12)),
            ])),
      ));
}
