// Copyright (c) 2026, turkic_flags package. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'turkic_flag_category.dart';
import 'turkic_flag_code.dart';

/// Immutable model representing complete metadata, visual properties,
/// and vector graphics for a specific Turkic world flag.
@immutable
class TurkicFlagProperties {
  /// Creates a new [TurkicFlagProperties] instance.
  const TurkicFlagProperties({
    required this.code,
    required this.nameTr,
    required this.nameEn,
    required this.category,
    required this.descriptionTr,
    required this.descriptionEn,
    required this.primaryColors,
    required this.svgData,
    this.aspectRatio = 1.5, // Standard 3:2 aspect ratio
  });

  /// The unique identifier code of the flag.
  final TurkicFlagCode code;

  /// Turkish name of the country, state, republic, or community.
  final String nameTr;

  /// English name of the country, state, republic, or community.
  final String nameEn;

  /// The category of this flag (independent, autonomous, historical, etc.).
  final TurkicFlagCategory category;

  /// Historical and informational description in Turkish.
  final String descriptionTr;

  /// Historical and informational description in English.
  final String descriptionEn;

  /// Key theme colors of the flag, useful for UI backgrounds, cards, and glowing effects.
  final List<Color> primaryColors;

  /// Embedded raw SVG string content representing the flag vector graphics.
  final String svgData;

  /// The natural aspect ratio (width / height) of the flag. Defaults to 1.5 (3:2).
  final double aspectRatio;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TurkicFlagProperties &&
        other.code == code &&
        other.nameTr == nameTr &&
        other.nameEn == nameEn &&
        other.category == category &&
        other.svgData == svgData;
  }

  @override
  int get hashCode => Object.hash(code, nameTr, nameEn, category, svgData);

  @override
  String toString() =>
      'TurkicFlagProperties(code: $code, nameTr: $nameTr, category: $category)';
}
