
import 'package:flutter/material.dart';

import 'app_fonts.dart';
import 'colors.dart';

class AppTexts {
  const AppTexts({
    required this.data,
    this.textColor = AppColor.kText1,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.selectionColor,
    this.semanticsLabel,
    this.textDirection,
    this.textWidthBasis,
    this.textScaler,
    this.textDecoration,
    this.wordSpacing,
    this.letterSpacing,
  });

  final String data;
  final Color? textColor;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final Color? selectionColor;
  final String? semanticsLabel;
  final TextDirection? textDirection;
  final TextWidthBasis? textWidthBasis;
  final TextScaler? textScaler;
  final TextDecoration? textDecoration;
  final double? wordSpacing, letterSpacing;

  Text _font({required FontWeight fontWeight, required double fontSize}) {
    return Text(
      data,
      softWrap: true,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      selectionColor: selectionColor,
      semanticsLabel: semanticsLabel,
      textDirection: textDirection,
      textWidthBasis: textWidthBasis,
      textScaler: textScaler,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: textColor,
        decoration: textDecoration,
        wordSpacing: wordSpacing,
        letterSpacing: letterSpacing,
      ),
    );
  }

  /// Heading Font Sizes:
  // Heading Bold:
  Text headingBXL() {
    return _font(fontWeight: AppFonts.bold, fontSize: AppFonts.headingXL);
  }

  Text headingBL() {
    return _font(fontWeight: AppFonts.bold, fontSize: AppFonts.headingL);
  }

  Text headingBM() {
    return _font(fontWeight: AppFonts.bold, fontSize: AppFonts.headingM);
  }

  Text headingBS() {
    return _font(fontWeight: AppFonts.bold, fontSize: AppFonts.headingS);
  }

  // Heading SemiBold:
  Text headingSBXL() {
    return _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.headingXL);
  }

  Text headingSBL() {
    return _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.headingL);
  }

  Text headingSBM() {
    return _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.headingM);
  }

  Text headingSBS() {
    return _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.headingS);
  }

  // Heading Medium:
  Text headingMXL() {
    return _font(fontWeight: AppFonts.medium, fontSize: AppFonts.headingXL);
  }

  Text headingML() {
    return _font(fontWeight: AppFonts.medium, fontSize: AppFonts.headingL);
  }

  Text headingMM() {
    return _font(fontWeight: AppFonts.medium, fontSize: AppFonts.headingM);
  }

  Text headingMS() {
    return _font(fontWeight: AppFonts.medium, fontSize: AppFonts.headingS);
  }

  // Heading Regular:
  Text headingRXL() {
    return _font(fontWeight: AppFonts.regular, fontSize: AppFonts.headingXL);
  }

  Text headingRL() {
    return _font(fontWeight: AppFonts.regular, fontSize: AppFonts.headingL);
  }

  Text headingRM() {
    return _font(fontWeight: AppFonts.regular, fontSize: AppFonts.headingM);
  }

  Text headingRS() {
    return _font(fontWeight: AppFonts.regular, fontSize: AppFonts.headingS);
  }

  Text headingSL() {
    return _font(fontWeight: AppFonts.semiregular, fontSize: AppFonts.headingL);
  }

  /// Body Font Sizes:
  // Body Bold:
  Text bodyBXL() {
    return _font(fontWeight: AppFonts.bold, fontSize: AppFonts.bodyXL);
  }

  Text bodyBL() {
    return _font(fontWeight: AppFonts.bold, fontSize: AppFonts.bodyL);
  }

  Text bodyBM() {
    return _font(fontWeight: AppFonts.bold, fontSize: AppFonts.bodyM);
  }

  Text bodyBS() {
    return _font(fontWeight: AppFonts.bold, fontSize: AppFonts.bodyS);
  }

  // Body SemiBold:
  Text bodySBXL() {
    return _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.bodyXL);
  }

  Text bodySBL() {
    return _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.bodyL);
  }

  Text bodySBM() {
    return _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.bodyM);
  }

  Text bodySBS() {
    return _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.bodyS);
  }

  // Body Medium:
  Text bodyMXL() {
    return _font(fontWeight: AppFonts.medium, fontSize: AppFonts.bodyXL);
  }

  Text bodyML() {
    return _font(fontWeight: AppFonts.medium, fontSize: AppFonts.bodyL);
  }

  Text bodyMM() {
    return _font(fontWeight: AppFonts.medium, fontSize: AppFonts.bodyM);
  }

  Text bodyMS() {
    return _font(fontWeight: AppFonts.medium, fontSize: AppFonts.bodyS);
  }

  // Body Regular:
  Text bodyRXL() {
    return _font(fontWeight: AppFonts.regular, fontSize: AppFonts.bodyXL);
  }

  Text bodyRL() {
    return _font(fontWeight: AppFonts.regular, fontSize: AppFonts.bodyL);
  }

  Text bodyRM() {
    return _font(fontWeight: AppFonts.regular, fontSize: AppFonts.bodyM);
  }

  Text bodyRS() {
    return _font(fontWeight: AppFonts.regular, fontSize: AppFonts.bodyS);
  }

  /// Button Font Sizes:
  // Button Bold:
  Text buttonBL() {
    return _font(fontWeight: AppFonts.bold, fontSize: AppFonts.buttonL);
  }

  Text buttonBM() {
    return _font(fontWeight: AppFonts.bold, fontSize: AppFonts.buttonM);
  }

  Text buttonBS() {
    return _font(fontWeight: AppFonts.bold, fontSize: AppFonts.buttonS);
  }

  // Button SemiBold:
  Text buttonSBL() {
    return _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.buttonL);
  }

  Text buttonSBM() {
    return _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.buttonM);
  }

  Text buttonSBS() {
    return _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.buttonS);
  }

  // Button Medium:
  Text buttonML() {
    return _font(fontWeight: AppFonts.medium, fontSize: AppFonts.buttonL);
  }

  Text buttonMM() {
    return _font(fontWeight: AppFonts.medium, fontSize: AppFonts.buttonM);
  }

  Text buttonMS() {
    return _font(fontWeight: AppFonts.medium, fontSize: AppFonts.buttonS);
  }

  // Button Regular:
  Text buttonRL() {
    return _font(fontWeight: AppFonts.regular, fontSize: AppFonts.buttonL);
  }

  Text buttonRM() {
    return _font(fontWeight: AppFonts.regular, fontSize: AppFonts.buttonM);
  }

  Text buttonRS() {
    return _font(fontWeight: AppFonts.regular, fontSize: AppFonts.buttonS);
  }
}