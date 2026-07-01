// Copyright (c) 2026, turkic_flags package. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'core/theme/app_theme.dart';
import 'presentation/bloc/flags_bloc.dart';
import 'presentation/bloc/flags_event.dart';
import 'presentation/bloc/flags_state.dart';
import 'presentation/screens/detail_screen.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TurkicFlagsExampleApp());
}

/// The root widget of the Turkic Flags demonstration application.
class TurkicFlagsExampleApp extends StatefulWidget {
  const TurkicFlagsExampleApp({super.key});

  @override
  State<TurkicFlagsExampleApp> createState() => _TurkicFlagsExampleAppState();
}

class _TurkicFlagsExampleAppState extends State<TurkicFlagsExampleApp> {
  late final GoRouter _router;
  late final FlagsBloc _flagsBloc;

  @override
  void initState() {
    super.initState();
    _flagsBloc = FlagsBloc()..add(const LoadFlags());
    _router = GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              const HomeScreen(),
        ),
        GoRoute(
          path: '/details/:code',
          builder: (BuildContext context, GoRouterState state) {
            final String codeName = state.pathParameters['code'] ?? 'tr';
            return DetailScreen(codeName: codeName);
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _flagsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FlagsBloc>.value(
      value: _flagsBloc,
      child: BlocBuilder<FlagsBloc, FlagsState>(
        builder: (BuildContext context, FlagsState state) {
          return MaterialApp.router(
            title: 'Turkic World Flags Catalog',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state.themeMode,
            routerConfig: _router,
          );
        },
      ),
    );
  }
}
