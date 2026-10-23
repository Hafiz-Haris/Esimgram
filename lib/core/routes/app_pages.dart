import 'package:get/get.dart';
import 'app_routes.dart';
import '../navigation/app_bottom_nav.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/destinations/presentation/pages/destinations_page.dart';
import '../../features/plans/presentation/pages/plans_page.dart';
import '../../features/my_esims/presentation/pages/my_esims_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/favorites/presentation/pages/favorites_page.dart';
import '../../features/support/presentation/pages/support_page.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(name: AppRoutes.onboarding, page: () => const OnboardingPage()),
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
    GetPage(name: AppRoutes.destinations, page: () => const DestinationsPage()),
    GetPage(name: AppRoutes.plans, page: () => const PlansPage()),
    GetPage(name: AppRoutes.myEsims, page: () => const MyEsimsPage()),
    GetPage(name: AppRoutes.profile, page: () => const ProfilePage()),
    GetPage(name: AppRoutes.settings, page: () => const SettingsPage()),
    GetPage(name: AppRoutes.favorites, page: () => const FavoritesPage()),
    GetPage(name: AppRoutes.support, page: () => const SupportPage()),
  ];
}
