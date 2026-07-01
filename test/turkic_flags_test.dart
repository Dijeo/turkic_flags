// Copyright (c) 2026, turkic_flags package. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:turkic_flags/turkic_flags.dart';

void main() {
  group('TurkicFlagsRepository Unit Tests', () {
    test('allFlags contains all TurkicFlagCode enum values', () {
      expect(
        TurkicFlagsRepository.allFlags.length,
        equals(TurkicFlagCode.values.length),
      );
      for (final TurkicFlagCode code in TurkicFlagCode.values) {
        final TurkicFlagProperties flag = TurkicFlagsRepository.getByCode(code);
        expect(flag.code, equals(code));
        expect(flag.svgData.isNotEmpty, isTrue);
        expect(flag.nameTr.isNotEmpty, isTrue);
        expect(flag.nameEn.isNotEmpty, isTrue);
      }
    });

    test('all 16 Great Turkic Empires exist in repository', () {
      final List<TurkicFlagCode> greatEmpires = <TurkicFlagCode>[
        TurkicFlagCode.hun,
        TurkicFlagCode.westernHun,
        TurkicFlagCode.europeanHun,
        TurkicFlagCode.whiteHun,
        TurkicFlagCode.gokturk,
        TurkicFlagCode.avar,
        TurkicFlagCode.khazar,
        TurkicFlagCode.uyghurKhaganate,
        TurkicFlagCode.karakhanid,
        TurkicFlagCode.ghaznavid,
        TurkicFlagCode.seljuk,
        TurkicFlagCode.khwarazmian,
        TurkicFlagCode.goldenHorde,
        TurkicFlagCode.timurid,
        TurkicFlagCode.mughal,
        TurkicFlagCode.ottoman,
      ];
      expect(greatEmpires.length, equals(16));
      for (final TurkicFlagCode code in greatEmpires) {
        final TurkicFlagProperties flag = TurkicFlagsRepository.getByCode(code);
        expect(flag.code, equals(code));
        expect(flag.category, equals(TurkicFlagCategory.historical));
      }
    });

    test('getByCategory correctly filters independent states', () {
      final List<TurkicFlagProperties> independent =
          TurkicFlagsRepository.getByCategory(TurkicFlagCategory.independent);
      expect(independent.isNotEmpty, isTrue);
      expect(
        independent.any(
          (TurkicFlagProperties f) => f.code == TurkicFlagCode.tr,
        ),
        isTrue,
      );
      expect(
        independent.any(
          (TurkicFlagProperties f) => f.code == TurkicFlagCode.az,
        ),
        isTrue,
      );
    });

    test('search returns matching flags case-insensitively', () {
      final List<TurkicFlagProperties> trResults = TurkicFlagsRepository.search(
        'TüRkiYe',
      );
      expect(trResults.isNotEmpty, isTrue);
      expect(trResults.first.code, equals(TurkicFlagCode.tr));

      final List<TurkicFlagProperties> azResults = TurkicFlagsRepository.search(
        'azerbaijan',
      );
      expect(azResults.isNotEmpty, isTrue);
      expect(azResults.first.code, equals(TurkicFlagCode.az));

      final List<TurkicFlagProperties> allResults =
          TurkicFlagsRepository.search('   ');
      expect(allResults.length, equals(TurkicFlagsRepository.allFlags.length));
    });

    test('TurkicFlagProperties equality and hashCode work correctly', () {
      final TurkicFlagProperties flag1 = TurkicFlagsRepository.getByCode(
        TurkicFlagCode.tr,
      );
      final TurkicFlagProperties flag2 = TurkicFlagsRepository.getByCode(
        TurkicFlagCode.tr,
      );
      final TurkicFlagProperties flag3 = TurkicFlagsRepository.getByCode(
        TurkicFlagCode.kz,
      );

      expect(flag1, equals(flag2));
      expect(flag1.hashCode, equals(flag2.hashCode));
      expect(flag1, isNot(equals(flag3)));
      expect(flag1.toString(), contains('TurkicFlagCode.tr'));
    });
  });

  group('Widget Tests', () {
    testWidgets('TurkicFlagWidget renders without errors', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TurkicFlagWidget(
              code: TurkicFlagCode.tr,
              width: 150,
              height: 100,
              elevation: 4,
            ),
          ),
        ),
      );

      expect(find.byType(TurkicFlagWidget), findsOneWidget);
    });

    testWidgets('TurkicFlagCard renders names and responds to taps', (
      WidgetTester tester,
    ) async {
      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TurkicFlagCard(
              code: TurkicFlagCode.az,
              showDescription: true,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      expect(find.text('Azerbaycan Cumhuriyeti'), findsOneWidget);
      expect(find.text('Bağımsız Türk Devletleri'), findsOneWidget);

      await tester.tap(find.byType(TurkicFlagCard));
      await tester.pumpAndSettle();
      expect(tapped, isTrue);
    });

    testWidgets(
      'TurkicFlagWidget sizes flags using natural aspect ratio by default',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: Column(
                children: <Widget>[
                  TurkicFlagWidget(
                    key: Key('tr_flag'),
                    code: TurkicFlagCode.tr, // Natural ratio 1.5
                    width: 120,
                  ),
                  TurkicFlagWidget(
                    key: Key('kz_flag'),
                    code: TurkicFlagCode.kz, // Natural ratio 2.0
                    width: 120,
                  ),
                ],
              ),
            ),
          ),
        );

        final Size trSize = tester.getSize(find.byKey(const Key('tr_flag')));
        final Size kzSize = tester.getSize(find.byKey(const Key('kz_flag')));

        // Each flag respects its own official aspect ratio by default
        expect(trSize.width, equals(120.0));
        expect(trSize.height, equals(80.0)); // 120 / 1.5 = 80
        expect(kzSize.width, equals(120.0));
        expect(kzSize.height, equals(60.0)); // 120 / 2.0 = 60
      },
    );

    testWidgets(
      'TurkicFlagWidget allows forcing a uniform aspectRatio override',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: Column(
                children: <Widget>[
                  TurkicFlagWidget(
                    key: Key('kz_uniform_flag'),
                    code: TurkicFlagCode.kz,
                    width: 120,
                    aspectRatio: 1.5, // Forced uniform ratio
                  ),
                ],
              ),
            ),
          ),
        );

        final Size kzSize = tester.getSize(
          find.byKey(const Key('kz_uniform_flag')),
        );
        expect(kzSize.width, equals(120.0));
        expect(kzSize.height, equals(80.0)); // 120 / 1.5 = 80
      },
    );
  });
}
