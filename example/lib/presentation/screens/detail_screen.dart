// Copyright (c) 2026, turkic_flags package. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:turkic_flags/turkic_flags.dart';
import '../bloc/flags_bloc.dart';
import '../bloc/flags_state.dart';

/// Detailed information screen presenting large flag vector graphics,
/// historical context, color palettes, and implementation code snippets.
class DetailScreen extends StatelessWidget {
  const DetailScreen({required this.codeName, super.key});

  /// The enum name string of the flag code (e.g., 'tr', 'az', 'kz').
  final String codeName;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlagsBloc, FlagsState>(
      builder: (BuildContext context, FlagsState state) {
        final TurkicFlagCode code = TurkicFlagCode.values.firstWhere(
          (TurkicFlagCode c) => c.name == codeName,
          orElse: () => TurkicFlagCode.tr,
        );
        final TurkicFlagProperties flag = TurkicFlagsRepository.getByCode(code);
        final ThemeData theme = Theme.of(context);
        final String displayName = state.useEnglish ? flag.nameEn : flag.nameTr;
        final String displayCategory = state.useEnglish
            ? flag.category.nameEn
            : flag.category.nameTr;
        final String displayDescription = state.useEnglish
            ? flag.descriptionEn
            : flag.descriptionTr;

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.go('/'),
            ),
            title: Text(displayName),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 16),
                    Hero(
                      tag: 'flag_${flag.code.name}',
                      child: TurkicFlagWidget.fromProperties(
                        properties: flag,
                        width: 340,
                        elevation: 14,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: flag.primaryColors.first.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: flag.primaryColors.first.withValues(
                            alpha: 0.4,
                          ),
                        ),
                      ),
                      child: Text(
                        displayCategory,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: theme.brightness == Brightness.dark
                              ? Color.lerp(
                                  flag.primaryColors.first,
                                  Colors.white,
                                  0.4,
                                )
                              : Color.lerp(
                                  flag.primaryColors.first,
                                  Colors.black,
                                  0.3,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      displayName,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (!state.useEnglish)
                      Text(
                        flag.nameEn,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    const SizedBox(height: 24),
                    Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              state.useEnglish
                                  ? 'Historical Background'
                                  : 'Tarihi ve Bilgi',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              displayDescription,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    _ColorPaletteSection(
                      colors: flag.primaryColors,
                      useEnglish: state.useEnglish,
                    ),
                    const SizedBox(height: 24),
                    _CodeSnippetSection(
                      codeName: flag.code.name,
                      useEnglish: state.useEnglish,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ColorPaletteSection extends StatelessWidget {
  const _ColorPaletteSection({required this.colors, required this.useEnglish});

  final List<Color> colors;
  final bool useEnglish;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              useEnglish ? 'Primary Color Palette' : 'Bayrak Renk Paleti',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: <Widget>[
                for (final Color color in colors) _ColorChip(color: color),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorChip extends StatelessWidget {
  const _ColorChip({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    final int rgb = color.toARGB32() & 0xFFFFFF;
    final String hexString =
        '#${rgb.toRadixString(16).toUpperCase().padLeft(6, '0')}';
    final bool isDark = color.computeLuminance() < 0.5;

    return Container(
      width: 130,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withValues(alpha: 0.15)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: color.withValues(alpha: 0.3),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          hexString,
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

class _CodeSnippetSection extends StatelessWidget {
  const _CodeSnippetSection({required this.codeName, required this.useEnglish});

  final String codeName;
  final bool useEnglish;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final String snippet =
        'TurkicFlagWidget(\n  code: TurkicFlagCode.$codeName,\n  width: 120,\n  elevation: 4.0,\n)';

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  useEnglish
                      ? 'Flutter Implementation'
                      : 'Flutter\'da Kullanım',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy, size: 20),
                  tooltip: useEnglish ? 'Copy Code' : 'Kodu Kopyala',
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: snippet));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          useEnglish
                              ? 'Code copied to clipboard!'
                              : 'Kod panoya kopyalandı!',
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.6,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                snippet,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
