// Copyright (c) 2026, turkic_flags package. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import '../data/turkic_flags_repository.dart';
import '../models/turkic_flag_code.dart';
import '../models/turkic_flag_properties.dart';
import 'turkic_flag_widget.dart';

/// A premium, responsive Material card widget displaying a Turkic flag,
/// its country/state name, its category badge, and optional historical description.
class TurkicFlagCard extends StatelessWidget {
  /// Creates a [TurkicFlagCard] using a [TurkicFlagCode].
  const TurkicFlagCard({
    required TurkicFlagCode code,
    super.key,
    this.onTap,
    this.showDescription = false,
    this.useEnglish = false,
    this.elevation = 6.0,
    this.flagWidth = 100.0,
    this.flagAspectRatio,
    this.flagFit = BoxFit.contain,
  }) : _code = code,
       _flagProperties = null;

  /// Creates a [TurkicFlagCard] from an existing [TurkicFlagProperties] object.
  const TurkicFlagCard.fromProperties({
    required TurkicFlagProperties properties,
    super.key,
    this.onTap,
    this.showDescription = false,
    this.useEnglish = false,
    this.elevation = 6.0,
    this.flagWidth = 100.0,
    this.flagAspectRatio,
    this.flagFit = BoxFit.contain,
  }) : _code = null,
       _flagProperties = properties;

  final TurkicFlagCode? _code;
  final TurkicFlagProperties? _flagProperties;

  /// The code identifying the Turkic flag to display.
  TurkicFlagCode get code => _code ?? _flagProperties!.code;

  /// The resolved properties of the flag to display.
  TurkicFlagProperties get flagProperties =>
      _flagProperties ?? TurkicFlagsRepository.getByCode(_code!);

  /// Callback executed when the card is tapped.
  final VoidCallback? onTap;

  /// Whether to display the historical and informational description text.
  final bool showDescription;

  /// Whether to display names and descriptions in English instead of Turkish.
  final bool useEnglish;

  /// Elevation of the card shadow.
  final double elevation;

  /// Width of the flag inside the card.
  final double flagWidth;

  /// Target aspect ratio of the flag widget inside the card. Defaults to `null` to use natural proportions.
  final double? flagAspectRatio;

  /// How the flag SVG graphic should be inscribed into the box. Defaults to [BoxFit.contain].
  final BoxFit flagFit;

  @override
  Widget build(BuildContext context) {
    final TurkicFlagProperties flag = flagProperties;
    final Color primaryGlow = flag.primaryColors.first;
    final ThemeData theme = Theme.of(context);
    final String displayName = useEnglish ? flag.nameEn : flag.nameTr;
    final String displayCategory = useEnglish
        ? flag.category.nameEn
        : flag.category.nameTr;
    final String displayDescription = useEnglish
        ? flag.descriptionEn
        : flag.descriptionTr;

    return Card(
      elevation: elevation,
      shadowColor: primaryGlow.withValues(alpha: 0.25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(color: primaryGlow.withValues(alpha: 0.2), width: 1.2),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                theme.colorScheme.surface,
                theme.colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.4,
                ),
              ],
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TurkicFlagWidget.fromProperties(
                    properties: flag,
                    width: flagWidth,
                    aspectRatio: flagAspectRatio,
                    fit: flagFit,
                    elevation: elevation * 0.5,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _CategoryBadge(
                          text: displayCategory,
                          color: primaryGlow,
                        ),
                        const SizedBox(height: 6.0),
                        Text(
                          displayName,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (showDescription) ...<Widget>[
                const SizedBox(height: 12.0),
                const Divider(height: 1),
                const SizedBox(height: 10.0),
                Text(
                  displayDescription,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.textTheme.bodyMedium?.color?.withValues(
                      alpha: 0.8,
                    ),
                    height: 1.4,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryBadge extends StatelessWidget {
  const _CategoryBadge({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: color.withValues(alpha: 0.4), width: 0.8),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11.0,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).brightness == Brightness.dark
              ? Color.lerp(color, Colors.white, 0.4)
              : Color.lerp(color, Colors.black, 0.3),
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
