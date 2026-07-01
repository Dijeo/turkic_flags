// Copyright (c) 2026, turkic_flags package. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:turkic_flags/turkic_flags.dart';
import '../bloc/flags_bloc.dart';
import '../bloc/flags_event.dart';
import '../bloc/flags_state.dart';

/// The main interactive catalog screen displaying all Turkic flags,
/// search filters, category selectors, and theme controls.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlagsBloc, FlagsState>(
      builder: (BuildContext context, FlagsState state) {
        final ThemeData theme = Theme.of(context);
        final bool isDark = theme.brightness == Brightness.dark;
        final String titleText = state.useEnglish
            ? 'Turkic World Flags'
            : 'Türk Dünyası Bayrakları';
        final String subtitleText = state.useEnglish
            ? 'Explore sovereign states, autonomous regions & historical empires.'
            : 'Bağımsız devletler, özerk cumhuriyetler ve tarihi imparatorlukları keşfedin.';

        return Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar.large(
                title: Text(titleText),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      state.useEnglish ? Icons.translate : Icons.language,
                    ),
                    tooltip: state.useEnglish
                        ? 'Türkçe\'ye Geç'
                        : 'Switch to English',
                    onPressed: () =>
                        context.read<FlagsBloc>().add(const ToggleLanguage()),
                  ),
                  IconButton(
                    icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                    tooltip: isDark ? 'Light Mode' : 'Dark Mode',
                    onPressed: () =>
                        context.read<FlagsBloc>().add(const ToggleThemeMode()),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        subtitleText,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _SearchBar(useEnglish: state.useEnglish),
                      const SizedBox(height: 16),
                      _CategorySelector(
                        selectedCategory: state.selectedCategory,
                        useEnglish: state.useEnglish,
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
              if (state.displayedFlags.isEmpty)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.flag_outlined,
                          size: 64,
                          color: theme.colorScheme.outline,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          state.useEnglish
                              ? 'No matching flags found.'
                              : 'Eşleşen bayrak bulunamadı.',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 400,
                          mainAxisExtent: 130,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                    delegate: SliverChildBuilderDelegate((
                      BuildContext context,
                      int index,
                    ) {
                      final TurkicFlagProperties flag =
                          state.displayedFlags[index];
                      return TurkicFlagCard.fromProperties(
                        properties: flag,
                        useEnglish: state.useEnglish,
                        flagWidth: 110,
                        flagAspectRatio: 1.5,
                        elevation: isDark ? 4 : 6,
                        onTap: () => context.go('/details/${flag.code.name}'),
                      );
                    }, childCount: state.displayedFlags.length),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({required this.useEnglish});

  final bool useEnglish;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String query) {
        context.read<FlagsBloc>().add(SearchFlags(query));
      },
      decoration: InputDecoration(
        hintText: useEnglish
            ? 'Search country, republic, or historical empire...'
            : 'Devlet, cumhuriyet veya imparatorluk ara...',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Theme.of(
          context,
        ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }
}

class _CategorySelector extends StatelessWidget {
  const _CategorySelector({
    required this.selectedCategory,
    required this.useEnglish,
  });

  final TurkicFlagCategory? selectedCategory;
  final bool useEnglish;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          _FilterChip(
            label: useEnglish ? 'All Flags' : 'Tümü',
            isSelected: selectedCategory == null,
            onSelected: () =>
                context.read<FlagsBloc>().add(const FilterByCategory(null)),
          ),
          for (final TurkicFlagCategory category in TurkicFlagCategory.values)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: _FilterChip(
                label: useEnglish ? category.nameEn : category.nameTr,
                isSelected: selectedCategory == category,
                onSelected: () =>
                    context.read<FlagsBloc>().add(FilterByCategory(category)),
              ),
            ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;

    return FilterChip(
      label: Text(
        label,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? colors.onPrimary : colors.onSurfaceVariant,
        ),
      ),
      selected: isSelected,
      onSelected: (_) => onSelected(),
      backgroundColor: colors.surfaceContainerHighest.withValues(alpha: 0.5),
      selectedColor: colors.primary,
      checkmarkColor: colors.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    );
  }
}
