import 'package:everest_flutter_crypto_tests/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'project_texts.dart';

class SetupWidgetTester extends StatelessWidget {
  final Locale language;

  const SetupWidgetTester({Key? key, required this.language}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: const Material(
          child: MediaQuery(
            data: const MediaQueryData(),
            child: ProjectTexts(),
          ),
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: language,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}

Future<void> loadPageWithSpecificLanguage(
    WidgetTester tester, Locale language) async {
  var widget = SetupWidgetTester(language: language);
  await tester.pumpWidget(widget);
}
