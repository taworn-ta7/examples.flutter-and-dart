import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import '../localization.dart';

/// NextPage class.
class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  _NextState createState() => _NextState();
}

/// _NextState internal class.
class _NextState extends State<NextPage> {
  static final log = Logger('NextPage');

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
        title: Text(t.nextPage_title),
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
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // show calendar
                ElevatedButton.icon(
                  icon: const Icon(Icons.calendar_today),
                  label: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(t.nextPage_show),
                  ),
                  onPressed: () => showCalendar(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ----------------------------------------------------------------------

  // Show Calendar

  Future<void> showCalendar() async {
    final now = DateTime.now();
    final value = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000, 1, 1),
      lastDate: DateTime(
        now.year + 1,
        1,
        1,
      ).subtract(
        const Duration(days: 1),
      ),
    );
    if (value != null) {
      final t = AppLocalizations.of(context)!;
      final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
      final string = formatter.format(value);
      final prefix = t.nextPage_output;
      log.info('$prefix: $string');
    }
  }
}
