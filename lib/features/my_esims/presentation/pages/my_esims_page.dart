import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/theme_controller.dart';
import '../../../../core/widgets/gradient_panel.dart';

class MyEsimsPage extends StatelessWidget {
  const MyEsimsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final palette = Get.find<ThemeController>().palette;
    return Scaffold(appBar: AppBar(title: const Text('My eSIMs')),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        GradientPanel(palette: palette, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Row(children: [Icon(Icons.sim_card_rounded, color: Colors.white), SizedBox(width: 8), Text('ACTIVE eSIM', style: TextStyle(color: Colors.white70, letterSpacing: 1.2, fontWeight: FontWeight.w800))]),
          const SizedBox(height: 18),
          const Text('🇯🇵  Japan Travel', style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w900)),
          const SizedBox(height: 8),
          const Text('12.4 GB remaining · 18 days left', style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 20),
          Row(children: [
            Expanded(child: OutlinedButton.icon(onPressed: () => Get.snackbar('Installation', 'Connect provider activation details to show the real QR code.'), icon: const Icon(Icons.qr_code_2), label: const Text('Install'), style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white54)))),
            const SizedBox(width: 10),
            Expanded(child: FilledButton.tonal(onPressed: () => Get.snackbar('Usage details', 'Usage data will come from your eSIM provider API.'), child: const Text('Usage details'))),
          ]),
        ])),
        const SizedBox(height: 24),
        Text('Your eSIM history', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
        const SizedBox(height: 12),
        const Card(child: ListTile(leading: CircleAvatar(child: Text('🇺🇸')), title: Text('United States'), subtitle: Text('Expired · 10 GB / 15 days'), trailing: Icon(Icons.chevron_right))),
        const Card(child: ListTile(leading: CircleAvatar(child: Text('🇹🇷')), title: Text('Türkiye'), subtitle: Text('Not activated · 5 GB / 7 days'), trailing: Icon(Icons.chevron_right))),
      ]),
      );
  }
}
