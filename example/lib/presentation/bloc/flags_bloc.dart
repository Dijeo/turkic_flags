// Copyright (c) 2026, turkic_flags package. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turkic_flags/turkic_flags.dart';
import 'flags_event.dart';
import 'flags_state.dart';

/// Business logic component managing flag catalog state, filtering, search, and preferences.
class FlagsBloc extends Bloc<FlagsEvent, FlagsState> {
  FlagsBloc() : super(const FlagsState()) {
    on<LoadFlags>(_onLoadFlags);
    on<FilterByCategory>(_onFilterByCategory);
    on<SearchFlags>(_onSearchFlags);
    on<ToggleLanguage>(_onToggleLanguage);
    on<ToggleThemeMode>(_onToggleThemeMode);
  }

  void _onLoadFlags(LoadFlags event, Emitter<FlagsState> emit) {
    emit(state.copyWith(displayedFlags: TurkicFlagsRepository.allFlags));
  }

  void _onFilterByCategory(FilterByCategory event, Emitter<FlagsState> emit) {
    final TurkicFlagCategory? nextCategory = event.category;
    emit(state.copyWith(selectedCategory: () => nextCategory));
    _refreshList(emit);
  }

  void _onSearchFlags(SearchFlags event, Emitter<FlagsState> emit) {
    emit(state.copyWith(searchQuery: event.query));
    _refreshList(emit);
  }

  void _onToggleLanguage(ToggleLanguage event, Emitter<FlagsState> emit) {
    emit(state.copyWith(useEnglish: !state.useEnglish));
  }

  void _onToggleThemeMode(ToggleThemeMode event, Emitter<FlagsState> emit) {
    final ThemeMode nextMode;
    switch (state.themeMode) {
      case ThemeMode.system:
      case ThemeMode.light:
        nextMode = ThemeMode.dark;
      case ThemeMode.dark:
        nextMode = ThemeMode.light;
    }
    emit(state.copyWith(themeMode: nextMode));
  }

  void _refreshList(Emitter<FlagsState> emit) {
    List<TurkicFlagProperties> results = TurkicFlagsRepository.search(
      state.searchQuery,
    );
    if (state.selectedCategory != null) {
      results = results
          .where(
            (TurkicFlagProperties f) => f.category == state.selectedCategory,
          )
          .toList();
    }
    emit(state.copyWith(displayedFlags: results));
  }
}
