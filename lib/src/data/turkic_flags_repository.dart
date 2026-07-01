// Copyright (c) 2026, turkic_flags package. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import '../models/turkic_flag_category.dart';
import '../models/turkic_flag_code.dart';
import '../models/turkic_flag_properties.dart';
import 'autonomous_flags_data.dart';
import 'historical_flags_data.dart';
import 'independent_flags_data.dart';

/// A repository providing access to all Turkic world flags, metadata, and search capabilities.
class TurkicFlagsRepository {
  TurkicFlagsRepository._();

  /// Returns an immutable list of all 41 Turkic world flags.
  static final List<TurkicFlagProperties> allFlags =
      List<TurkicFlagProperties>.unmodifiable(<TurkicFlagProperties>[
        ...IndependentFlagsData.flags,
        ...AutonomousFlagsData.flags,
        ...HistoricalFlagsData.flags,
      ]);

  /// Retrieves the flag properties corresponding to the specified [code].
  ///
  /// Throws a [StateError] if no flag matches the given [code], although
  /// every defined [TurkicFlagCode] is guaranteed to exist in the data repository.
  static TurkicFlagProperties getByCode(TurkicFlagCode code) {
    return allFlags.firstWhere(
      (TurkicFlagProperties flag) => flag.code == code,
    );
  }

  /// Returns all flags belonging to the given [category].
  static List<TurkicFlagProperties> getByCategory(TurkicFlagCategory category) {
    return allFlags
        .where((TurkicFlagProperties flag) => flag.category == category)
        .toList();
  }

  /// Searches for flags matching the [query] string in their Turkish name,
  /// English name, or descriptions.
  ///
  /// The search is case-insensitive. Returns an empty list if [query] is empty or whitespace.
  static List<TurkicFlagProperties> search(String query) {
    final String trimmed = query.trim().toLowerCase();
    if (trimmed.isEmpty) {
      return allFlags;
    }
    return allFlags.where((TurkicFlagProperties flag) {
      return flag.nameTr.toLowerCase().contains(trimmed) ||
          flag.nameEn.toLowerCase().contains(trimmed) ||
          flag.descriptionTr.toLowerCase().contains(trimmed) ||
          flag.descriptionEn.toLowerCase().contains(trimmed) ||
          flag.code.name.toLowerCase().contains(trimmed);
    }).toList();
  }
}
