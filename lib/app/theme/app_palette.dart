import 'package:flutter/material.dart';

/// Neutral design primitives. Prefer semantic [ColorScheme] roles in widgets.
///
/// These values are the single source of truth for the starter's monochrome
/// palette; product-specific brand colors belong in the consuming app.
abstract final class AppPalette {
  // Light surfaces.
  static const Color paper = Color(0xFFFBFBF9);
  static const Color white = Color(0xFFFFFFFF);
  static const Color cloud = Color(0xFFF4F4F1);
  static const Color mist = Color(0xFFE8E8E3);

  // Primary neutral scale.
  static const Color ink = Color(0xFF171715);
  static const Color graphite = Color(0xFF555550);
  static const Color slate = Color(0xFF73736D);
  static const Color ash = Color(0xFF92928B);

  // Dark surfaces.
  static const Color night = Color(0xFF111110);
  static const Color darkSurface = Color(0xFF1A1A18);
  static const Color darkSurfaceRaised = Color(0xFF232321);
  static const Color darkSurfaceHigh = Color(0xFF2A2A27);
  static const Color darkText = Color(0xFFF3F3EF);
  static const Color darkMuted = Color(0xFFB5B5AE);
  static const Color darkOutline = Color(0xFF3A3A35);

  // Semantic colors are intentionally restrained, but remain distinct from
  // neutral text and surfaces when an application needs to report an error.
  static const Color error = Color(0xFFB3261E);
  static const Color errorDark = Color(0xFFFFB4AB);
}
