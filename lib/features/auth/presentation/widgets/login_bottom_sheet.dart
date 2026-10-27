import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/palette.dart';
import '../controllers/login_controller.dart';
 // Upar wala controller import karein

class LoginBottomSheet extends StatelessWidget {
  final AppPalette palette;

  LoginBottomSheet({super.key, required this.palette});

  final LoginController controller = Get.put(LoginController());
  final TextEditingController inputController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Drag Handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: isDark ? Colors.white24 : Colors.black12,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            // Header Title
            Text(
              'Sign in to eSIMgram',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              'Complete your purchase instantly',
              style: TextStyle(
                fontSize: 14,
                color: isDark ? Colors.white60 : Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // Fast Social Login Buttons
            OutlinedButton.icon(
              onPressed: () => controller.loginWithProvider('Google'),
              icon: const Icon(Icons.g_mobiledata, size: 28), // Yahan Google SVG/Icon laga sakte hain
              label: const Text('Continue with Google'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                side: BorderSide(color: isDark ? Colors.white12 : Colors.black12),
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => controller.loginWithProvider('Apple'),
              icon: const Icon(Icons.apple, size: 22),
              label: const Text('Continue with Apple'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                side: BorderSide(color: isDark ? Colors.white12 : Colors.black12),
              ),
            ),

            const SizedBox(height: 20),

            // Divider
            Row(
              children: [
                Expanded(child: Divider(color: isDark ? Colors.white12 : Colors.black12)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'OR EMAIL / PHONE',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: isDark ? Colors.white38 : Colors.black38),
                  ),
                ),
                Expanded(child: Divider(color: isDark ? Colors.white12 : Colors.black12)),
              ],
            ),

            const SizedBox(height: 20),

            // Email/Phone Input Field
            TextField(
              controller: inputController,
              decoration: const InputDecoration(
                labelText: 'Email or Phone Number',
                hintText: 'name@example.com',
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            const SizedBox(height: 12),

            // Password Field
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: '••••••••',
                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),
            const SizedBox(height: 24),

            // Action Button (Dynamic Palette Primary Color)
            Obx(() => ElevatedButton(
              onPressed: controller.isLoading.value
                  ? null
                  : () => controller.loginWithEmailOrPhone(
                        inputController.text.trim(),
                        passwordController.text.trim(),
                      ),
              style: ElevatedButton.styleFrom(
                backgroundColor: palette.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
              child: controller.isLoading.value
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                    )
                  : const Text(
                      'Sign In / Register',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
            )),
          ],
        ),
      ),
    );
  }
}