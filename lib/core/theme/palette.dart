import 'package:flutter/material.dart';

class AppPalette {
  final String name;
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color glow;
  const AppPalette(this.name, this.primary, this.secondary, this.accent, this.glow);
}

const appPalettes = <AppPalette>[
  AppPalette('Cosmic Blue', Color(0xFF647BFF), Color(0xFF172554), Color(0xFF42D9FF), Color(0x6642D9FF)),
  AppPalette('Aurora', Color(0xFF31C7A0), Color(0xFF164E63), Color(0xFFB8FFDA), Color(0x6631C7A0)),
  AppPalette('Galaxy Purple', Color(0xFF9B72FF), Color(0xFF3B1D66), Color(0xFFE1C7FF), Color(0x669B72FF)),
  AppPalette('Neon Cyan', Color(0xFF00BFEA), Color(0xFF064E63), Color(0xFF7DF9FF), Color(0x6600BFEA)),
  AppPalette('Emerald', Color(0xFF10B981), Color(0xFF064E3B), Color(0xFF6EE7B7), Color(0x6610B981)),
  AppPalette('Ocean', Color(0xFF168AAD), Color(0xFF184E77), Color(0xFF76C893), Color(0x66168AAD)),
  AppPalette('Sunset', Color(0xFFFF7A59), Color(0xFF7F1D1D), Color(0xFFFFC857), Color(0x66FF7A59)),
  AppPalette('Ruby', Color(0xFFE11D48), Color(0xFF881337), Color(0xFFFFA3B5), Color(0x66E11D48)),
  AppPalette('Rose', Color(0xFFEC4899), Color(0xFF831843), Color(0xFFFBCFE8), Color(0x66EC4899)),
  AppPalette('Amber', Color(0xFFD97706), Color(0xFF78350F), Color(0xFFFDE68A), Color(0x66D97706)),
  AppPalette('Electric Violet', Color(0xFF7C3AED), Color(0xFF4C1D95), Color(0xFFC4B5FD), Color(0x667C3AED)),
  AppPalette('Arctic', Color(0xFF60A5FA), Color(0xFF1E3A8A), Color(0xFFDBEAFE), Color(0x6660A5FA)),
  AppPalette('Midnight', Color(0xFF818CF8), Color(0xFF111827), Color(0xFF67E8F9), Color(0x66818CF8)),
  AppPalette('Cyber Blue', Color(0xFF2563EB), Color(0xFF1E40AF), Color(0xFF22D3EE), Color(0x662563EB)),
  AppPalette('Mint', Color(0xFF34D399), Color(0xFF065F46), Color(0xFFA7F3D0), Color(0x6634D399)),
  AppPalette('Coral', Color(0xFFFB7185), Color(0xFF9F1239), Color(0xFFFDA4AF), Color(0x66FB7185)),
  AppPalette('Sapphire', Color(0xFF3B82F6), Color(0xFF1D4ED8), Color(0xFF93C5FD), Color(0x663B82F6)),
  AppPalette('Lavender', Color(0xFFA78BFA), Color(0xFF5B21B6), Color(0xFFEDE9FE), Color(0x66A78BFA)),
  AppPalette('Lime', Color(0xFF84CC16), Color(0xFF365314), Color(0xFFD9F99D), Color(0x6684CC16)),
  AppPalette('Tangerine', Color(0xFFF97316), Color(0xFF9A3412), Color(0xFFFED7AA), Color(0x66F97316)),
  AppPalette('Ice Blue', Color(0xFF38BDF8), Color(0xFF0C4A6E), Color(0xFFE0F2FE), Color(0x6638BDF8)),
  AppPalette('Plum', Color(0xFFA855F7), Color(0xFF581C87), Color(0xFFE9D5FF), Color(0x66A855F7)),
  AppPalette('Forest', Color(0xFF22C55E), Color(0xFF14532D), Color(0xFFBBF7D0), Color(0x6622C55E)),
  AppPalette('Crimson', Color(0xFFDC2626), Color(0xFF7F1D1D), Color(0xFFFCA5A5), Color(0x66DC2626)),
  AppPalette('Gold', Color(0xFFEAB308), Color(0xFF713F12), Color(0xFFFEF08A), Color(0x66EAB308)),
  AppPalette('Teal', Color(0xFF14B8A6), Color(0xFF134E4A), Color(0xFF99F6E4), Color(0x6614B8A6)),
  AppPalette('Indigo', Color(0xFF6366F1), Color(0xFF312E81), Color(0xFFC7D2FE), Color(0x666366F1)),
  AppPalette('Orchid', Color(0xFFD946EF), Color(0xFF701A75), Color(0xFFF5D0FE), Color(0x66D946EF)),
  AppPalette('Steel', Color(0xFF64748B), Color(0xFF1E293B), Color(0xFFCBD5E1), Color(0x6664748B)),
  AppPalette('Skyline', Color(0xFF0EA5E9), Color(0xFF075985), Color(0xFFBAE6FD), Color(0x660EA5E9)),
  AppPalette('Berry', Color(0xFFBE185D), Color(0xFF831843), Color(0xFFF9A8D4), Color(0x66BE185D)),
  AppPalette('Polar Night', Color(0xFF94A3B8), Color(0xFF0F172A), Color(0xFF67E8F9), Color(0x6694A3B8)),
];
