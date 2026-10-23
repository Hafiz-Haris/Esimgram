import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'palette.dart';

class ThemeController extends GetxController {
  final mode = ThemeMode.dark.obs;
  final paletteIndex = 0.obs;
  AppPalette get palette => appPalettes[paletteIndex.value];

  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    mode.value = (prefs.getBool('dark_mode') ?? true) ? ThemeMode.dark : ThemeMode.light;
    paletteIndex.value = (prefs.getInt('palette_index') ?? 0).clamp(0, appPalettes.length - 1);
  }

  Future<void> toggleMode(bool dark) async {
    mode.value = dark ? ThemeMode.dark : ThemeMode.light;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('dark_mode', dark);
  }

  Future<void> selectPalette(int index) async {
    if (index < 0 || index >= appPalettes.length) return;
    paletteIndex.value = index;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('palette_index', index);
  }
}
