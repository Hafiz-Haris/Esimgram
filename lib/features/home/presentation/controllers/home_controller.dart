import 'package:get/get.dart';

class HomeController extends GetxController {
  final navIndex = 0.obs;
  final searchText = ''.obs;
  final remainingGb = 12.4.obs;
  final totalGb = 20.0;
  final favorites = <String>{}.obs;
  final destinations = const [
    {'name': 'Japan', 'flag': '🇯🇵', 'price': '\$4.90', 'plans': '12 plans'},
    {
      'name': 'United States',
      'flag': '🇺🇸',
      'price': '\$3.50',
      'plans': '18 plans'
    },
    {'name': 'Türkiye', 'flag': '🇹🇷', 'price': '\$2.90', 'plans': '9 plans'},
    {
      'name': 'United Kingdom',
      'flag': '🇬🇧',
      'price': '\$3.20',
      'plans': '14 plans'
    },
  ];

  void toggleFavorite(String destination) {
    if (!favorites.remove(destination)) {
      favorites.add(destination);
    }
  }
}
