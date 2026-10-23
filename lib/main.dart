import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';
import 'core/network/api_client.dart';
import 'features/home/presentation/controllers/home_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeController = ThemeController();
  await themeController.loadPreferences();
  Get.put<ThemeController>(themeController, permanent: true);
  Get.put<ApiClient>(ApiClient(), permanent: true);
  Get.put<HomeController>(HomeController(), permanent: true);
  runApp(const EsimgramApp());
}

class EsimgramApp extends StatelessWidget {
  const EsimgramApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeController>();
    return Obx(() => GetMaterialApp(
          title: 'eSIMgram',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(theme.palette),
          darkTheme: AppTheme.dark(theme.palette),
          themeMode: theme.mode.value,
          initialRoute: AppRoutes.home,
          getPages: AppPages.pages,
          defaultTransition: Transition.cupertino,
          transitionDuration: const Duration(milliseconds: 280),
        ));
  }
}
