import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../home/presentation/controllers/home_controller.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final destinations = controller.destinations;

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: Obx(() {
        final savedDestinations = destinations
            .where((destination) =>
                controller.favorites.contains(destination['name']))
            .toList();

        if (savedDestinations.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.favorite_border_rounded,
                      size: 52, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(height: 16),
                  Text('No favorites yet',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w800)),
                  const SizedBox(height: 8),
                  const Text(
                    'Save a destination from Explore and it will appear here.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  FilledButton.icon(
                    onPressed: () => Get.toNamed(AppRoutes.destinations),
                    icon: const Icon(Icons.travel_explore_rounded),
                    label: const Text('Explore destinations'),
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: savedDestinations.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final destination = savedDestinations[index];
            final name = destination['name']!;
            return Card(
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                leading: Text(destination['flag']!,
                    style: const TextStyle(fontSize: 30)),
                title: Text(name,
                    style: const TextStyle(fontWeight: FontWeight.w800)),
                subtitle: Text(
                    '${destination['plans']} · from ${destination['price']}'),
                trailing: IconButton(
                  tooltip: 'Remove from favorites',
                  onPressed: () => controller.toggleFavorite(name),
                  icon: const Icon(Icons.favorite, color: Colors.pinkAccent),
                ),
                onTap: () => Get.toNamed(AppRoutes.plans, arguments: name),
              ),
            );
          },
        );
      }),
    );
  }
}
