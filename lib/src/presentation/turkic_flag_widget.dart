// Copyright (c) 2026, turkic_flags package. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../data/turkic_flags_repository.dart';
import '../models/turkic_flag_code.dart';
import '../models/turkic_flag_properties.dart';

/// A customizable Flutter widget that renders a high-resolution SVG flag
/// of any Turkic state, republic, region, or historical empire.
///
/// Features built-in support for rounded corners, borders, and multi-layered
/// drop shadows with color glowing effects.
class TurkicFlagWidget extends StatelessWidget {
  /// Creates a [TurkicFlagWidget] using a [TurkicFlagCode].
  const TurkicFlagWidget({
    required TurkicFlagCode code,
    super.key,
    this.width,
    this.height,
    this.aspectRatio,
    this.borderRadius,
    this.fit = BoxFit.contain,
    this.elevation = 4.0,
    this.shadowColor,
    this.backgroundColor,
    this.showBorder = true,
    this.borderColor,
    this.borderWidth = 1.0,
  }) : _code = code,
       _flagProperties = null;

  /// Creates a [TurkicFlagWidget] directly using a [TurkicFlagProperties] object.
  const TurkicFlagWidget.fromProperties({
    required TurkicFlagProperties properties,
    super.key,
    this.width,
    this.height,
    this.aspectRatio,
    this.borderRadius,
    this.fit = BoxFit.contain,
    this.elevation = 4.0,
    this.shadowColor,
    this.backgroundColor,
    this.showBorder = true,
    this.borderColor,
    this.borderWidth = 1.0,
  }) : _code = null,
       _flagProperties = properties;

  final TurkicFlagCode? _code;
  final TurkicFlagProperties? _flagProperties;

  /// The code identifying the Turkic flag to display.
  TurkicFlagCode get code => _code ?? _flagProperties!.code;

  /// The resolved properties of the flag to display.
  TurkicFlagProperties get flagProperties =>
      _flagProperties ?? TurkicFlagsRepository.getByCode(_code!);

  /// Optional width of the flag widget. If null, sizes dynamically or respects [height].
  final double? width;

  /// Optional height of the flag widget. If null, sizes dynamically or respects [width].
  final double? height;

  /// The target aspect ratio (width / height) for the bounding area.
  /// Defaults to `null` so each flag is displayed in its own authentic official aspect ratio.
  /// Set to an explicit double (e.g. `1.5`) if you want to force a uniform bounding container.
  final double? aspectRatio;

  /// The border radius applied to clip the flag corners. Defaults to `BorderRadius.circular(8)`.
  final BorderRadius? borderRadius;

  /// How the SVG graphic should be inscribed into the box. Defaults to [BoxFit.contain] to prevent cropping.
  final BoxFit fit;

  /// Elevation of the drop shadow. Set to 0.0 for a flat flag.
  final double elevation;

  /// Custom shadow color. Defaults to the primary color of the flag or theme shadow color.
  final Color? shadowColor;

  /// Custom background color behind the SVG graphic when using [BoxFit.contain].
  final Color? backgroundColor;

  /// Whether to draw a subtle border around the flag.
  final bool showBorder;

  /// Color of the border. Defaults to a subtle white or grey overlay.
  final Color? borderColor;

  /// Width of the border stroke.
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final TurkicFlagProperties flag = flagProperties;
    final BorderRadius effectiveRadius =
        borderRadius ?? BorderRadius.circular(8.0);
    final Color defaultShadow =
        shadowColor ?? flag.primaryColors.first.withValues(alpha: 0.35);
    final Color effectiveBorderColor =
        borderColor ?? Theme.of(context).dividerColor.withValues(alpha: 0.2);

    final double targetRatio = aspectRatio ?? flag.aspectRatio;
    final double effectiveWidth =
        width ?? (height != null ? height! * targetRatio : 120.0);
    final double effectiveHeight =
        height ?? (width != null ? width! / targetRatio : 80.0);

    return Container(
      width: effectiveWidth,
      height: effectiveHeight,
      decoration: BoxDecoration(
        borderRadius: effectiveRadius,
        boxShadow: elevation > 0
            ? <BoxShadow>[
                BoxShadow(
                  color: defaultShadow,
                  blurRadius: elevation * 2.5,
                  offset: Offset(0, elevation * 0.75),
                  spreadRadius: elevation * 0.2,
                ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: elevation,
                  offset: Offset(0, elevation * 0.5),
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: effectiveRadius,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            border: showBorder
                ? Border.all(color: effectiveBorderColor, width: borderWidth)
                : null,
            borderRadius: effectiveRadius,
          ),
          child: SvgPicture.string(
            flag.svgData,
            width: effectiveWidth,
            height: effectiveHeight,
            fit: fit,
            placeholderBuilder: (BuildContext context) =>
                const _FlagPlaceholder(),
          ),
        ),
      ),
    );
  }
}

class _FlagPlaceholder extends StatelessWidget {
  const _FlagPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: const Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}
