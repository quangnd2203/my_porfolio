import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get regular => GoogleFonts.lekton().copyWith(
        fontWeight: FontWeight.w400,
      );

  static TextStyle get medium => GoogleFonts.lekton().copyWith(
        fontWeight: FontWeight.w500,
      );

  static TextStyle get semiBold => GoogleFonts.lekton().copyWith(
        fontWeight: FontWeight.w600,
      );

  static TextStyle get bold => GoogleFonts.lekton().copyWith(
        fontWeight: FontWeight.w700,
      );

  static TextStyle get2xlStyle(TextStyle textStyle) {
    return textStyle.copyWith(
      fontSize: 28,
      height: 3.6,
    );
  }

  static TextStyle getXlStyle(TextStyle textStyle) {
    return textStyle.copyWith(
      fontSize: 20,
      height: 2.8,
    );
  }

  static TextStyle getLgStyle(TextStyle textStyle) {
    return textStyle.copyWith(
      fontSize: 18,
      height: 2.8,
    );
  }

  static TextStyle getBaseStyle(TextStyle textStyle) {
    return textStyle.copyWith(
      fontSize: 16,
      height: 2.4,
    );
  }

  static TextStyle getSmStyle(TextStyle textStyle) {
    return textStyle.copyWith(
      fontSize: 14,
      height: 2.0,
    );
  }

  static TextStyle getXsStyle(TextStyle textStyle) {
    return textStyle.copyWith(
      fontSize: 12,
      height: 1.6,
    );
  }
}
