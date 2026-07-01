// Copyright (c) 2026, turkic_flags package. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:turkic_flags/turkic_flags.dart';

/// Base class for all events handled by [FlagsBloc].
@immutable
abstract class FlagsEvent {
  const FlagsEvent();
}

/// Event dispatched to initialize and load flag data.
class LoadFlags extends FlagsEvent {
  const LoadFlags();
}

/// Event dispatched when the user filters flags by category.
class FilterByCategory extends FlagsEvent {
  const FilterByCategory(this.category);

  final TurkicFlagCategory? category;
}

/// Event dispatched when the user types in the search field.
class SearchFlags extends FlagsEvent {
  const SearchFlags(this.query);

  final String query;
}

/// Event dispatched to toggle between Turkish and English display language.
class ToggleLanguage extends FlagsEvent {
  const ToggleLanguage();
}

/// Event dispatched to toggle between light, dark, and system themes.
class ToggleThemeMode extends FlagsEvent {
  const ToggleThemeMode();
}
