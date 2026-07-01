// Copyright (c) 2026, turkic_flags package. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui';
import '../models/turkic_flag_category.dart';
import '../models/turkic_flag_code.dart';
import '../models/turkic_flag_properties.dart';

/// Provides vector graphics and metadata for autonomous Turkic republics and regions.
class AutonomousFlagsData {
  AutonomousFlagsData._();

  /// List of all autonomous Turkic republics and regions flag properties.
  static const List<TurkicFlagProperties> flags = <TurkicFlagProperties>[
    _altai,
    _bashkortostan,
    _chuvashia,
    _gagauzia,
    _khakassia,
    _karachayCherkessia,
    _karakalpakstan,
    _nakhchivan,
    _sakha,
    _tatarstan,
    _tuva,
    _eastTurkestan,
    _crimeanTatars,
    _dagestan,
  ];

  static const TurkicFlagProperties _altai = TurkicFlagProperties(
    code: TurkicFlagCode.altai,
    nameTr: 'Altay Cumhuriyeti',
    nameEn: 'Altai Republic',
    category: TurkicFlagCategory.autonomous,
    descriptionTr: 'Beyaz ve açık mavi dört yatay şeritten oluşur.',
    descriptionEn: 'Consists of four horizontal bands of white and light blue.',
    primaryColors: <Color>[Color(0xFFFFFFFF), Color(0xFF0099FF)],
    aspectRatio: 2.0,
    svgData: r'''
<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="800" viewBox="0 0 150 100">
  <path fill="#fff" d="M0 0h150v100H0z"/>
  <path fill="#39F" d="M0 67h150v4H0zm0 8h150v25H0z"/>
</svg>
''',
  );

  static const TurkicFlagProperties _bashkortostan = TurkicFlagProperties(
    code: TurkicFlagCode.bashkortostan,
    nameTr: 'Başkurdistan Cumhuriyeti',
    nameEn: 'Republic of Bashkortostan',
    category: TurkicFlagCategory.autonomous,
    descriptionTr:
        'Mavi, beyaz ve yeşil şeritler ortasında yedi yapraklı altın kuray çiçeği.',
    descriptionEn:
        'Blue, white, and green stripes with a golden kurai flower of seven petals in the center.',
    primaryColors: <Color>[
      Color(0xFF0099B5),
      Color(0xFFFFFFFF),
      Color(0xFF1EB53A),
    ],
    aspectRatio: 2.0,
    svgData: r'''
<svg width="900" height="600" version="1.1" viewBox="0 0 900 600" xmlns="http://www.w3.org/2000/svg">
 <path d="m0 300h900v300h-900z" fill="#007000" stroke-width="2.4495"/>
 <path d="m0 0h900v300h-900z" fill="#0070ff" stroke-width="2.4495"/>
 <path d="m0 200h900v200h-900z" fill="#fff" stroke-width="2"/>
 <circle cx="450" cy="300" r="75" fill="none" stroke="#ffd700" stroke-width="10"/>
 <circle cx="450" cy="300" r="16" fill="#ffd700" stroke-width="2"/>
 <g transform="matrix(2,0,0,2,450,300)">
  <path d="m0 0h25" stroke="#ffd700" stroke-width="2"/>
  <circle cx="25" r="5" fill="#ffd700"/>
 </g>
 <g transform="matrix(1.7321 -1 1 1.7321 450 300)">
  <path d="m0 0h25" stroke="#ffd700" stroke-width="2"/>
  <circle cx="25" r="5" fill="#ffd700"/>
 </g>
 <g transform="matrix(1 -1.7321 1.7321 1 450 300)">
  <path d="m0 0h25" stroke="#ffd700" stroke-width="2"/>
  <circle cx="25" r="5" fill="#ffd700"/>
 </g>
 <g transform="matrix(0,-2,2,0,450,300)">
  <path d="m0 0h25" stroke="#ffd700" stroke-width="2"/>
  <circle cx="25" r="5" fill="#ffd700"/>
 </g>
 <g transform="matrix(-1 -1.7321 1.7321 -1 450 300)">
  <path d="m0 0h25" stroke="#ffd700" stroke-width="2"/>
  <circle cx="25" r="5" fill="#ffd700"/>
 </g>
 <g transform="matrix(-1.7321 -1 1 -1.7321 450 300)">
  <path d="m0 0h25" stroke="#ffd700" stroke-width="2"/>
  <circle cx="25" r="5" fill="#ffd700"/>
 </g>
 <g transform="matrix(-2,0,0,-2,450,300)">
  <path d="m0 0h25" stroke="#ffd700" stroke-width="2"/>
  <circle cx="25" r="5" fill="#ffd700"/>
 </g>
 <path d="m450 300v50" stroke="#ffd700" stroke-width="4"/>
</svg>
''',
  );

  static const TurkicFlagProperties _chuvashia = TurkicFlagProperties(
    code: TurkicFlagCode.chuvashia,
    nameTr: 'Çuvaşistan Cumhuriyeti',
    nameEn: 'Chuvash Republic',
    category: TurkicFlagCategory.autonomous,
    descriptionTr:
        'Sarı zemin üzerinde kırmızı hayat ağacı ve üstte üç sekiz köşeli yıldız.',
    descriptionEn:
        'Yellow field with a stylized red tree of life and three eight-pointed sun symbols.',
    primaryColors: <Color>[Color(0xFFFFD100), Color(0xFFCE1126)],
    aspectRatio: 1.6,
    svgData: r'''
<svg clip-rule="evenodd" fill-rule="evenodd" viewBox="0 0 2000 1250" xmlns="http://www.w3.org/2000/svg">
	<rect width="2000" height="1250" fill="#ffdf00"/>
	<path d="m1289.9 235.83 56.57-56.57v56.57h56.57l-56.57 56.57 56.57 56.57h-56.57v56.56l-56.57-56.57-56.56 56.57v-56.57h-56.57l56.57-56.56-56.57-56.57h56.56v-56.57zm-36.57 20v-28.29l36.57 36.57 36.57-36.56v28.28h28.29l-36.57 36.57 36.56 36.56h-28.28v28.29l-36.57-36.57-36.57 36.57v-28.29h-28.28l36.57-36.56-36.57-36.57z" fill="#a2260b"/>
	<path d="m710.06 235.83 56.57-56.57v56.57h56.57l-56.57 56.57 56.57 56.57-56.57-0.01 0.01 56.57-56.57-56.57-56.57 56.57v-56.57h-56.57l56.57-56.57-56.57-56.57h56.57v-56.56zm-36.57 19.99v-28.28l36.57 36.57 36.57-36.57v28.28h28.29l-36.57 36.57 36.56 36.57h-28.28v28.28l-36.56-36.56-36.58 36.57v-28.29h-28.27l36.56-36.57-36.57-36.57z" fill="#a2260b"/>
	<path d="m1e3 115.5 56.56-56.57 0.01 56.57h56.56l-56.56 56.57 56.57 56.57-56.57-0.01v56.57l-56.57-56.57-56.57 56.57v-56.57h-56.56l56.56-56.57-56.57-56.57 56.57 0.01v-56.57zm-36.57 19.99v-28.28l36.57 36.57 36.56-36.57v28.28h28.29l-36.57 36.57 36.57 36.57h-28.29v28.28l-36.56-36.56-36.57 36.57v-28.29h-28.28l36.56-36.57-36.57-36.57z" fill="#a2260b"/>
	<polygon points="1.035e3 9.7e2 2.0e3 9.7e2 2.0e3 9.4e2 1.065e3 9.4e2 1.065e3 644.61000 1.1414e3 568.19000 1.1909e3 617.69000 1.1626e3 645.97000 1.1485e3 631.83000 1.1626e3 617.69000 1.1414e3 596.48000 1.1061e3 631.83000 1.1697e3 695.47000 1.2121e3 653.05000 1.2121e3 596.48000 1.1414e3 525.77000 1.035e3 632.19000" fill="#a2260b"/>
	<polygon points="9.65e2 9.7e2 0 9.7e2 0 9.4e2 9.35e2 9.4e2 9.35e2 644.61000 858.58000 568.19000 809.08000 617.69000 837.37000 645.97000 851.51000 631.83000 837.37000 617.69000 858.58000 596.48000 893.93000 631.83000 830.29000 695.47000 787.87000 653.05000 787.87000 596.47000 858.58000 525.76000 9.65e2 632.19000" fill="#a2260b"/>
	<polygon points="9.65e2 6.039e2 787.87000 426.77000 724.23000 490.41000 773.73000 539.91000 802.01000 511.62000 787.87000 497.48000 773.73000 511.62000 752.52000 490.41000 787.87000 455.05000 844.44000 511.62000 794.94000 561.12000 738.38000 561.12000 667.66000 490.41000 752.52000 405.56000 809.09000 405.56000 9.65e2 561.47000" fill="#a2260b"/>
	<polygon points="1.035e3 6.039e2 1.2121e3 426.77000 1.2758e3 490.41000 1.2263e3 539.91000 1.198e3 511.62000 1.2121e3 497.48000 1.2263e3 511.62000 1.2475e3 490.41000 1.2121e3 455.05000 1.1556e3 511.62000 1.2051e3 561.12000 1.2616e3 561.12000 1.3323e3 490.41000 1.2475e3 405.56000 1.1909e3 405.56000 1.035e3 561.47000" fill="#a2260b"/>
	<polygon points="9.85e2 1.0e3 9.85e2 553.19000 823.23000 391.42000 823.23000 334.85000 908.08000 2.5e2 978.79000 320.71000 978.79000 377.27000 929.29000 426.77000 872.72000 3.702e2 908.08000 334.85000 929.29000 356.06000 915.15000 3.702e2 929.29000 384.34000 957.57000 356.06000 908.08000 306.56000 844.44000 3.702e2 1.0e3 525.76000 1.1556e3 3.702e2 1.0919e3 306.56000 1.0424e3 356.06000 1.0707e3 384.34000 1.0848e3 3.702e2 1.0707e3 356.06000 1.0919e3 334.85000 1.1273e3 3.702e2 1.0707e3 426.77000 1.0212e3 377.27000 1.0212e3 320.71000 1.0919e3 2.5e2 1.1768e3 334.85000 1.1768e3 391.42000 1.015e3 553.19000 1.015e3 1.0e3 2.0e3 1.0e3 2.0e3 1.25e3 0 1.25e3 0 1.0e3" fill="#a2260b"/>
</svg>
''',
  );

  static const TurkicFlagProperties _gagauzia = TurkicFlagProperties(
    code: TurkicFlagCode.gagauzia,
    nameTr: 'Gagauzya Özerk Yeri',
    nameEn: 'Gagauzia Autonomous Territorial Unit',
    category: TurkicFlagCategory.autonomous,
    descriptionTr:
        'Mavi, beyaz, kırmızı şeritler ve sol üstte üç altın sarısı yıldız.',
    descriptionEn:
        'Blue, white, and red stripes with three golden stars in the upper hoist.',
    primaryColors: <Color>[
      Color(0xFF0033A0),
      Color(0xFFFFFFFF),
      Color(0xFFCE1126),
    ],
    aspectRatio: 2.0,
    svgData: r'''
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="1000" height="500">
<path fill="#ff001a" d="M0 0h1000v500H0z"/>
<path fill="#fff" d="M0 0h1000v400H0z"/>
<path fill="#004080" d="M0 0h1000v300H0z"/>
<g id="s" transform="translate(150 75) scale(37.5)">
<g id="e">
<path id="t" d="M0-1V0h.5z" transform="rotate(18 0-1)" fill="#ffe540"/>
<use xlink:href="#t" transform="scale(-1 1)"/>
</g>
<g id="f">
<use xlink:href="#e" transform="rotate(72)"/>
<use xlink:href="#e" transform="rotate(216)"/>
</g>
<use xlink:href="#f" transform="rotate(72)"/>
</g>
<use xlink:href="#s" y="150" />
<use xlink:href="#s" transform="rotate(60 150 225) rotate(12 150 75)"/>
</svg>
''',
  );

  static const TurkicFlagProperties _khakassia = TurkicFlagProperties(
    code: TurkicFlagCode.khakassia,
    nameTr: 'Hakasya Cumhuriyeti',
    nameEn: 'Republic of Khakassia',
    category: TurkicFlagCategory.autonomous,
    descriptionTr:
        'Sol tarafta yeşil şerit ve altın güneş sembolü, sağda mavi, beyaz, kırmızı şeritler.',
    descriptionEn:
        'Green vertical stripe with golden solar symbol on the left, horizontal blue, white, red stripes.',
    primaryColors: <Color>[
      Color(0xFF0033A0),
      Color(0xFFFFFFFF),
      Color(0xFFCE1126),
      Color(0xFF009A44),
    ],
    aspectRatio: 2.0,
    svgData: r'''
<svg xmlns="http://www.w3.org/2000/svg" width="1200px" height="600px" viewBox="0 0 360 180">
<rect fill="#d81e05" width="360" height="180"/>
<rect fill="#fff" width="360" height="120"/>
<rect fill="#0051ba" width="360" height="60"/>
<rect fill="#009847" width="60" height="180"/>
 <g fill="gold" transform="rotate(45, 30, 90)">
<path d="M30,120 51,90 30,60 9,90z"/>
<path d="M60,90 30,111 0,90 30,69z"/>
<circle cx="30" cy="90" r="24"/>
<circle fill="#009847" cx="30" cy="90" r="21"/>
<circle cx="30" cy="90" r="18"/>
<circle fill="#009847" cx="30" cy="90" r="12"/>
<circle cx="30" cy="90" r="10"/>
 </g>
</svg>
''',
  );

  static const TurkicFlagProperties _karachayCherkessia = TurkicFlagProperties(
    code: TurkicFlagCode.karachayCherkessia,
    nameTr: 'Karaçay-Çerkesya Cumhuriyeti',
    nameEn: 'Karachay-Cherkess Republic',
    category: TurkicFlagCategory.autonomous,
    descriptionTr:
        'Açık mavi, yeşil, kırmızı şeritler ortasında dağların ardından doğan güneş.',
    descriptionEn:
        'Light blue, green, and red stripes with a sun rising behind mountains in a golden circle.',
    primaryColors: <Color>[
      Color(0xFF0099FF),
      Color(0xFF009A44),
      Color(0xFFCE1126),
    ],
    aspectRatio: 2.0,
    svgData: r'''
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve" width="1200" height="600" viewBox="0 0 600 300">
<defs>
<path id="big" fill="#FFB000" d="M 0,-23 C 2,-37 3,-44 0,-44 C -3,-44 -2,-37 0,-23 Z" />
<path id="small" fill="#FFB000" d="M 0,-23 C 1,-33 1.5,-37 0,-37 C -1.5,-37 -1,-33 0,-23 Z" />
</defs>
<clipPath id="mid"><circle cx="300" cy="150" r="49" /></clipPath>
<rect fill="#E02010" width="600" height="300"/>
<rect fill="#007030" width="600" height="200"/>
<rect fill="#0090D0" width="600" height="100"/>
<circle fill="#FFB000" cx="300" cy="150" r="20" />
<path fill="white" clip-path="url(#mid)" d="M 300,145 C 285,130 222,185 222,185 L 391,189 C 391,189 323,127 301,145 Z" />
<path fill="#007030" clip-path="url(#mid)" d="M 301,162 C 281,144 263,178 241,166 C 252,216 366,221 356,164 C 338,166 321,139 301,162 Z" />
<circle cx="300" cy="150" r="48" stroke="#FFB000" stroke-width="4" fill="none" />
<g id="L">
<use transform="translate(300,150) rotate(-75)" xlink:href="#small" />
<use transform="translate(300,150) rotate(-64)" xlink:href="#big" />
<use transform="translate(300,150) rotate(-56)" xlink:href="#big" />
</g>
<use transform="rotate(30 300,150)" xlink:href="#L" />
<use transform="rotate(60 300,150)" xlink:href="#L" />
<use transform="rotate(90 300,150)" xlink:href="#L" />
<use transform="rotate(120 300,150)" xlink:href="#L" />
<use transform="translate(300,150) rotate(75)" xlink:href="#small" />
</svg>
''',
  );

  static const TurkicFlagProperties _karakalpakstan = TurkicFlagProperties(
    code: TurkicFlagCode.karakalpakstan,
    nameTr: 'Karakalpakistan Cumhuriyeti',
    nameEn: 'Republic of Karakalpakstan',
    category: TurkicFlagCategory.autonomous,
    descriptionTr: 'Mavi, sarı, yeşil şeritler ile beyaz hilal ve beş yıldız.',
    descriptionEn:
        'Blue, yellow, and green stripes with a white crescent and five stars.',
    primaryColors: <Color>[
      Color(0xFF0099B5),
      Color(0xFFFEC50C),
      Color(0xFF1EB53A),
    ],
    aspectRatio: 2.0,
    svgData: r'''
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="1200" height="600" viewBox="0 0 250 125" fill="#fff">
<path d="M0 0h250v125H0z" fill="#209c3a"/>
<path d="M0 0h250v50H0z" fill="#008eb7"/>
<path d="M0 42h250v41H0z"/>
<path d="M0 43h250v39H0z" fill="#da251d"/>
<path d="M0 45.5h250v34H0z" fill="#f7bd29"/>
<circle r="11" cx="31" cy="21"/>
<circle r="9.5" cx="35" cy="21" fill="#008eb7"/>
<path id="a" d="M42 26.40983l9.510565 0L43.816356 32l2.938926-9.045085L49.694209 32z"/>
<g id="b">
<use xlink:href="#a" x="5.122359" y="-5.954915"/>
<use xlink:href="#a" x="10.244717"/>
</g>
<use xlink:href="#b" x="10.244717"/>
</svg>
''',
  );

  static const TurkicFlagProperties _nakhchivan = TurkicFlagProperties(
    code: TurkicFlagCode.nakhchivan,
    nameTr: 'Nahçıvan Özerk Cumhuriyeti',
    nameEn: 'Nakhchivan Autonomous Republic',
    category: TurkicFlagCategory.autonomous,
    descriptionTr:
        'Azerbaycan bayrağı ile özdeş şeritler ve ay-yıldız sembolizmi.',
    descriptionEn:
        'Features horizontal blue, red, and green stripes with a crescent and eight-pointed star.',
    primaryColors: <Color>[
      Color(0xFF00B9E4),
      Color(0xFFED2939),
      Color(0xFF3F9C35),
    ],
    aspectRatio: 2.0,
    svgData: r'''
<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="600">
<rect width="1200" height="600" fill="#509e2f"/>
<rect width="1200" height="400" fill="#ef3340"/>
<rect width="1200" height="200" fill="#00b5e2"/>
<circle cx="570" cy="300" r="90" fill="#fff"/>
<circle cx="590" cy="300" r="75" fill="#ef3340"/>
<path d="M670 250l9.567 26.903 25.788-12.258-12.258 25.788L720 300l-26.903 9.567 12.258 25.788-25.788-12.258L670 350l-9.567-26.903-25.788 12.258 12.258-25.788L620 300l26.903-9.567-12.258-25.788 25.788 12.258z" fill="#fff"/>
</svg>
''',
  );

  static const TurkicFlagProperties _sakha = TurkicFlagProperties(
    code: TurkicFlagCode.sakha,
    nameTr: 'Saka (Yakutistan) Cumhuriyeti',
    nameEn: 'Sakha Republic (Yakutia)',
    category: TurkicFlagCategory.autonomous,
    descriptionTr:
        'Açık mavi, beyaz, kırmızı ve yeşil şeritler ile mavi alanda beyaz güneş dairesi.',
    descriptionEn:
        'Light blue field with a central white sun, above white, red, and green horizontal stripes.',
    primaryColors: <Color>[
      Color(0xFF0099FF),
      Color(0xFFFFFFFF),
      Color(0xFFCE1126),
      Color(0xFF009A44),
    ],
    aspectRatio: 2.0,
    svgData: r'''
<svg viewBox="0 0 128 64" xmlns="http://www.w3.org/2000/svg" fill="#fff"><path d="m0 0h128v64H0" fill="#090"/><path d="m0 0h128v56H0" fill="#f20"/><path d="m0 0h128v52H0"/><path d="m0 0h128v48H0" fill="#19f"/><circle cx="64" cy="24" r="13"/></svg>
''',
  );

  static const TurkicFlagProperties _tatarstan = TurkicFlagProperties(
    code: TurkicFlagCode.tatarstan,
    nameTr: 'Tataristan Cumhuriyeti',
    nameEn: 'Republic of Tatarstan',
    category: TurkicFlagCategory.autonomous,
    descriptionTr: 'Kırmızı ve yeşil yatay şeritleri ayıran ince beyaz şerit.',
    descriptionEn:
        'Horizontal bands of red and green separated by a narrow white stripe.',
    primaryColors: <Color>[
      Color(0xFFCE1126),
      Color(0xFF009A44),
      Color(0xFFFFFFFF),
    ],
    aspectRatio: 2.0,
    svgData: r'''
<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="600" height="300">
<rect fill="#008000" width="600" height="140"/>
<rect fill="#FFF" width="600" height="20" y="140"/>
<rect fill="#F00" width="600" height="140" y="160"/>
</svg>
''',
  );

  static const TurkicFlagProperties _tuva = TurkicFlagProperties(
    code: TurkicFlagCode.tuva,
    nameTr: 'Tuva Cumhuriyeti',
    nameEn: 'Tuva Republic',
    category: TurkicFlagCategory.autonomous,
    descriptionTr:
        'Açık mavi zemin üzerinde Yenisey nehirlerinin birleşmesini simgeleyen sarı ve beyaz şeritler.',
    descriptionEn:
        'Light blue field with yellow and white stripes representing the confluence of Yenisei rivers.',
    primaryColors: <Color>[
      Color(0xFF0099FF),
      Color(0xFFFEC50C),
      Color(0xFFFFFFFF),
    ],
    aspectRatio: 2.0,
    svgData: r'''
<svg width="900" height="600" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="m0 0h900v600H0" fill="#63b1e5"/><path d="m370 300-335-335v670l335-335h530" fill="#fff" stroke="#fff" stroke-width="100"/><path d="m35-35 335 335m-335 335 335-335h530" stroke="#63b1e5" stroke-width="33.3"/><path d="m0 0v600l300-300" fill="#fecb00"/></svg>
''',
  );

  static const TurkicFlagProperties _eastTurkestan = TurkicFlagProperties(
    code: TurkicFlagCode.eastTurkestan,
    nameTr: 'Doğu Türkistan (Uygur Bayrağı)',
    nameEn: 'East Turkestan (Uyghur Flag)',
    category: TurkicFlagCategory.autonomous,
    descriptionTr:
        'Gök mavisi (Kök bayrak) zemin üzerine beyaz hilal ve beş köşeli yıldız.',
    descriptionEn:
        'Sky blue field (Kökbayrak) with a white crescent and five-pointed star.',
    primaryColors: <Color>[Color(0xFF0099FF), Color(0xFFFFFFFF)],
    aspectRatio: 1.5,
    svgData: r'''
<svg xmlns="http://www.w3.org/2000/svg" width="900" height="600" viewBox="0 -30000 90000 60000"><path fill="#559EE2" d="m0-30000h90000v60000H0"/><path fill="#fff" d="m41750 0 13568-4408-8386 11541V-7133l8386 11541zm925 8021a15000 15000 0 1 1 0-16042 12000 12000 0 1 0 0 16042"/></svg>
''',
  );

  static const TurkicFlagProperties _crimeanTatars = TurkicFlagProperties(
    code: TurkicFlagCode.crimeanTatars,
    nameTr: 'Kırım Tatar Türkleri',
    nameEn: 'Crimean Tatars',
    category: TurkicFlagCategory.autonomous,
    descriptionTr:
        'Gökbayrak zemin üzerinde sol üstte altın sarısı Tarak Tamga sembolü.',
    descriptionEn:
        'Sky blue field with the golden Tarak Tamga (Crimean Tatar symbol) in the canton.',
    primaryColors: <Color>[Color(0xFF0099FF), Color(0xFFFEC50C)],
    aspectRatio: 2.0,
    svgData: r'''
<svg xmlns="http://www.w3.org/2000/svg" width="1400" height="780" viewBox="0 0 350 195"><path fill="#00a3dd" d="M0 0h350v195H0z"/><path d="M40 30v30H30v10h20V40h20v30H60v10h30V70H80V40h20v30h20V60h-10V30Z" style="fill:#f8d80e"/></svg>
''',
  );

  static const TurkicFlagProperties _dagestan = TurkicFlagProperties(
    code: TurkicFlagCode.dagestan,
    nameTr: 'Dağıstan Türkleri (Kumuk / Nogay)',
    nameEn: 'Dagestan (Kumyk / Nogai Turks)',
    category: TurkicFlagCategory.autonomous,
    descriptionTr: 'Yeşil, mavi ve kırmızı üç yatay şerit.',
    descriptionEn: 'Three horizontal stripes of green, blue, and red.',
    primaryColors: <Color>[
      Color(0xFF009A44),
      Color(0xFF0099FF),
      Color(0xFFCE1126),
    ],
    aspectRatio: 1.5,
    svgData: r'''
<svg xmlns="http://www.w3.org/2000/svg" width="900" height="600" viewBox="0 0 9 6">
<rect fill="#D81E05" width="9" height="6"/>
<rect fill="#0039a6" width="9" height="4"/>
<rect fill="#00923F" width="9" height="2"/>
</svg>
''',
  );
}
