import 'package:flutter/material.dart';
import '../../features/destinations/presentation/pages/destinations_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/my_esims/presentation/pages/my_esims_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    DestinationsPage(),
    MyEsimsPage(),
    ProfilePage(),
  ];

  static const _navItems = [
    (icon: Icons.grid_view_rounded, label: 'Home'),
    (icon: Icons.explore_outlined, label: 'Explore'),
    (icon: Icons.sim_card_outlined, label: 'My eSims'),
    (icon: Icons.person_outline_rounded, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          const Positioned.fill(
            child: Opacity(
              opacity: 0.75,
            ),
          ),

          Positioned.fill(child: _pages[_currentIndex]),
          Positioned(
            left: 25,
            right: 25,
            bottom: 21,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.85),
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: colorScheme.outlineVariant.withValues(alpha: 0.6),
                    width: 1.2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.12),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(_navItems.length, (index) {
                    final isSelected = _currentIndex == index;
                    final item = _navItems[index];

                    return GestureDetector(
                      onTap: () => setState(() => _currentIndex = index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        padding: EdgeInsets.symmetric(
                          horizontal: isSelected ? 16 : 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? colorScheme.primary
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              item.icon,
                              size: 20,
                              // FIX 3: Unselected icons dark mode mein readable hone ke liye onSurfaceVariant pick karenge
                              color: isSelected
                                  ? colorScheme.onPrimary
                                  : colorScheme.onSurfaceVariant,
                            ),
                            if (isSelected) ...[
                              const SizedBox(width: 6),
                              Text(
                                item.label,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.onPrimary,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// class AppBottomNav extends StatelessWidget {
//   final int currentIndex;

//   const AppBottomNav({
//     super.key,
//     required this.currentIndex,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.blue.shade100,
//           borderRadius: BorderRadius.circular(30.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.08),
//               blurRadius: 15,
//               offset: const Offset(0, 5),
//             ),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(30.0),
//           child: NavigationBar(
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             selectedIndex: currentIndex,
//             onDestinationSelected: (i) {
//               // Prevent reloading the same page if tapped again
//               if (i == currentIndex) return;

//               switch (i) {
//                 case 0:
//                   Get.offAllNamed(AppRoutes.home);
//                   break;
//                 case 1:
//                   Get.toNamed(AppRoutes.destinations);
//                   break;
//                 case 2:
//                   Get.toNamed(AppRoutes.myEsims);
//                   break;
//                 case 3:
//                   Get.toNamed(AppRoutes.profile);
//                   break;
//               }
//             },
//             destinations: const [
//               NavigationDestination(
//                 icon: Icon(Icons.grid_view_rounded),
//                 label: 'Home',
//               ),
//               NavigationDestination(
//                 icon: Icon(Icons.explore_outlined),
//                 label: 'Explore',
//               ),
//               NavigationDestination(
//                 icon: Icon(Icons.sim_card_outlined),
//                 label: 'My eSIMs',
//               ),
//               NavigationDestination(
//                 icon: Icon(Icons.person_outline_rounded),
//                 label: 'Profile',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }