import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logging/logging.dart';
import 'localization.dart';
import 'pages/begin.dart';
import 'pages/next.dart';

/// App class.
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  static void refresh(BuildContext context) async =>
      context.findAncestorStateOfType<_AppState>()?.refresh();

  @override
  _AppState createState() => _AppState();
}

/// _AppState internal class.
class _AppState extends State<App> {
  static final log = Logger('App');

  @override
  void initState() {
    super.initState();
    log.fine('$this initState()');
  }

  @override
  void dispose() {
    log.fine('$this dispose()');
    super.dispose();
  }

  // ----------------------------------------------------------------------

  /// Build widget tree.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Localization.instance().list,
      locale: Localization.instance().current,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/next': (context) => const NextPage(),
        '/': (context) => const BeginPage(),
      },
      initialRoute: '/',
      title: 'Internationalization',
      debugShowCheckedModeBanner: false,
    );
  }

  // ----------------------------------------------------------------------

  void refresh() => setState(() {});
}
