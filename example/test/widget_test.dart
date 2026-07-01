// Copyright (c) 2026, turkic_flags package. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:example/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TurkicFlagsExampleApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const TurkicFlagsExampleApp());
    await tester.pumpAndSettle();

    expect(find.text('Türk Dünyası Bayrakları'), findsWidgets);
  });
}
