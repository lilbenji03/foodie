import 'package:flutter/material.dart';

// Color Constants
class ColorConstants {
  // Onboarding Screen Colors
  static const Color imageBackground = Color(
    0xFFFFFFFF,
  ); // Light peach/cream color
  static const Color imageBackground2 = Color(0xFFFFE5B4); // Gold color

  // You can add more color constants here for other screens
  static const Color primaryColor = Color(0xFF2196F3);
  static const Color secondaryColor = Color(0xFF4CAF50);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color textColor = Color(0xFF333333);
}

// For backward compatibility and easy access
const Color imageBackground = ColorConstants.imageBackground;
const Color imageBackground2 = ColorConstants.imageBackground2;
