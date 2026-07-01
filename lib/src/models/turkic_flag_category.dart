// Copyright (c) 2026, turkic_flags package. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Categorization of Turkic world flags based on political and historical status.
enum TurkicFlagCategory {
  /// Independent sovereign Turkic states (e.g., Turkey, Azerbaijan, Kazakhstan).
  independent(
    nameTr: 'Bağımsız Türk Devletleri',
    nameEn: 'Independent Turkic States',
  ),

  /// Autonomous Turkic republics and regions (e.g., Tatarstan, Gagauzia, Yakutia).
  autonomous(
    nameTr: 'Özerk Türk Cumhuriyetleri ve Bölgeleri',
    nameEn: 'Autonomous Turkic Republics & Regions',
  ),

  /// International Turkic organizations and unions (e.g., Organization of Turkic States).
  organization(
    nameTr: 'Uluslararası Kuruluşlar ve Birlikler',
    nameEn: 'International Organizations & Unions',
  ),

  /// Historical Turkic empires and communities (e.g., Göktürk, Seljuk, Ottoman, Iraqi Turkmen).
  historical(
    nameTr: 'Tarihi İmparatorluklar ve Topluluklar',
    nameEn: 'Historical Empires & Communities',
  );

  const TurkicFlagCategory({required this.nameTr, required this.nameEn});

  /// The Turkish display name of the category.
  final String nameTr;

  /// The English display name of the category.
  final String nameEn;
}
