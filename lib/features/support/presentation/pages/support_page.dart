import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  static const _faqs = [
    (
      'How do I install my eSIM?',
      'Open My eSIMs, select your plan, and follow the installation steps shown there. '
          'Make sure your device supports eSIM and that you have an internet connection during setup.',
    ),
    (
      'When should I activate my travel eSIM?',
      'You can install your eSIM before travelling. Enable its data line when you arrive at your destination '
          'and follow the plan details for when validity begins.',
    ),
    (
      'Why is my eSIM not connecting?',
      'Check that the eSIM is enabled, mobile data is assigned to it, and data roaming is enabled for that line. '
          'Then restart your device and confirm that you are in an area with network coverage.',
    ),
    (
      'How can I check my remaining data?',
      'Your active eSIM and remaining data are shown on the home screen and in My eSIMs.',
    ),
    (
      'Can I use my eSIM on any phone?',
      'Your phone must support eSIM and be carrier-unlocked. Check your device settings or contact your device '
          'manufacturer to confirm compatibility before travelling.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Support')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colors.primaryContainer,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              children: [
                Icon(Icons.support_agent_rounded,
                    size: 36, color: colors.onPrimaryContainer),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('How can we help?',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  color: colors.onPrimaryContainer,
                                  fontWeight: FontWeight.w900)),
                      const SizedBox(height: 4),
                      Text('Quick answers for common eSIM questions.',
                          style: TextStyle(color: colors.onPrimaryContainer)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text('Frequently asked questions',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w900)),
          const SizedBox(height: 10),
          ..._faqs.map((faq) => Card(
                child: ExpansionTile(
                  leading: const Icon(Icons.help_outline_rounded),
                  title: Text(faq.$1,
                      style: const TextStyle(fontWeight: FontWeight.w700)),
                  childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(faq.$2)],
                ),
              )),
        ],
      ),
    );
  }
}
