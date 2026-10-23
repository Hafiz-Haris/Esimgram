import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../home/presentation/controllers/home_controller.dart';
import '../../../../core/routes/app_routes.dart';

class DestinationsPage extends StatefulWidget {
  const DestinationsPage({super.key});
  @override
  State<DestinationsPage> createState() => _DestinationsPageState();
}

class _DestinationsPageState extends State<DestinationsPage> {
  final query = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final data = controller.destinations;
    final filtered = data
        .where(
            (d) => d['name']!.toLowerCase().contains(query.text.toLowerCase()))
        .toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Explore destinations')),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        Text('Where to next?',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.w900)),
        const SizedBox(height: 6),
        const Text('Find your connection before you arrive.'),
        const SizedBox(height: 20),
        TextField(
            controller: query,
            onChanged: (_) => setState(() {}),
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search_rounded),
                hintText: 'Search countries')),
        const SizedBox(height: 18),
        ...filtered.map((d) => Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: Container(
                    width: 54,
                    height: 54,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withValues(alpha: .1),
                        borderRadius: BorderRadius.circular(16)),
                    child:
                        Text(d['flag']!, style: const TextStyle(fontSize: 28))),
                title: Text(d['name']!,
                    style: const TextStyle(fontWeight: FontWeight.w800)),
                subtitle: Text('${d['plans']} · from ${d['price']}'),
                trailing: Obx(() {
                  final isFavorite = controller.favorites.contains(d['name']);
                  return IconButton(
                    tooltip: isFavorite
                        ? 'Remove from favorites'
                        : 'Add to favorites',
                    onPressed: () => controller.toggleFavorite(d['name']!),
                    icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.pinkAccent : null),
                  );
                }),
                onTap: () => Get.toNamed(AppRoutes.plans, arguments: d['name']),
              ),
            )),
        if (filtered.isEmpty)
          const Padding(
              padding: EdgeInsets.all(30),
              child: Center(
                  child: Text('No destinations found. Try another search.'))),
      ]),
    );
  }

  @override
  void dispose() {
    query.dispose();
    super.dispose();
  }
}
