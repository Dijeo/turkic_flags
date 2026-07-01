// Copyright (c) 2026, turkic_flags package. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:turkic_flags/turkic_flags.dart';

/// Represents the current UI state of the flag catalog application.
@immutable
class FlagsState {
  const FlagsState({
    this.displayedFlags = const <TurkicFlagProperties>[],
    this.selectedCategory,
    this.searchQuery = '',
    this.useEnglish = false,
    this.themeMode = ThemeMode.system,
  });

  /// The filtered and searched list of flag properties to display in the grid.
  final List<TurkicFlagProperties> displayedFlags;

  /// Currently selected category filter, or null if showing all categories.
  final TurkicFlagCategory? selectedCategory;

  /// Current search query string entered by the user.
  final String searchQuery;

  /// Whether to display text and names in English (true) or Turkish (false).
  final bool useEnglish;

  /// Active theme mode (light, dark, or system).
  final ThemeMode themeMode;

  /// Creates a copy of this state with specified properties replaced.
  FlagsState copyWith({
    List<TurkicFlagProperties>? displayedFlags,
    TurkicFlagCategory? Function()? selectedCategory,
    String? searchQuery,
    bool? useEnglish,
    ThemeMode? themeMode,
  }) {
    return FlagsState(
      displayedFlags: displayedFlags ?? this.displayedFlags,
      selectedCategory: selectedCategory != null
          ? selectedCategory()
          : this.selectedCategory,
      searchQuery: searchQuery ?? this.searchQuery,
      useEnglish: useEnglish ?? this.useEnglish,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FlagsState &&
        other.displayedFlags == displayedFlags &&
        other.selectedCategory == selectedCategory &&
        other.searchQuery == searchQuery &&
        other.useEnglish == useEnglish &&
        other.themeMode == themeMode;
  }

  @override
  int get hashCode => Object.hash(
    displayedFlags,
    selectedCategory,
    searchQuery,
    useEnglish,
    themeMode,
  );
}
