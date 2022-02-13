import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logging/logging.dart';
import '../localization.dart';

/// BeginPage class.
class BeginPage extends StatefulWidget {
  const BeginPage({Key? key}) : super(key: key);

  @override
  _BeginState createState() => _BeginState();
}

/// _BeginState internal class.
class _BeginState extends State<BeginPage> {
  static final log = Logger('BeginPage');

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
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(t.beginPage_title),
        actions: [
          // Thai language
          IconButton(
            icon: Image.asset('assets/locales/th.png'),
            tooltip: t.switchLanguage_th,
            onPressed: () =>
                Localization.instance().changeLocale(context, 'th'),
          ),

          // English language
          IconButton(
            icon: Image.asset('assets/locales/en.png'),
            tooltip: t.switchLanguage_en,
            onPressed: () =>
                Localization.instance().changeLocale(context, 'en'),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // begin
                ElevatedButton.icon(
                  icon: const Icon(Icons.star),
                  label: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(t.beginPage_next),
                  ),
                  onPressed: () => begin(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ----------------------------------------------------------------------

  // Begin

  Future<void> begin() async {
    await Navigator.pushNamed(context, '/next');
  }
}
