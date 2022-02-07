import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:page_transition/page_transition.dart';
import 'ui.dart';

/// HomePage class.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

/// _HomeState internal class.
class _HomeState extends State<HomePage> {
  static final log = Logger('HomePage');

  late TextEditingController _searchText;

  String _resultText = '';

  @override
  void initState() {
    super.initState();
    _searchText = TextEditingController();
    log.fine('$this initState()');
  }

  @override
  void dispose() {
    log.fine('$this dispose()');
    _searchText.dispose();
    super.dispose();
  }

  // ----------------------------------------------------------------------

  /// Build widget tree.
  @override
  Widget build(BuildContext context) {
    final tr = t.homePage;
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.title),
        actions: [
          // search button
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: t.searchBar.open,
            onPressed: () => Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: SearchBar(
                  searchText: _searchText,
                  onChanged: (text) => setState(() {
                    _resultText = text;
                  }),
                ),
              ),
            ),
          ),

          // Thai language
          IconButton(
            icon: Image.asset('assets/locales/th.png'),
            tooltip: t.switchLocale.thai,
            onPressed: () {
              LocaleSettings.setLocaleRaw('th');
              setState(() {});
            },
          ),

          // English language
          IconButton(
            icon: Image.asset('assets/locales/en.png'),
            tooltip: t.switchLocale.english,
            onPressed: () {
              LocaleSettings.setLocaleRaw('en');
              setState(() {});
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Text('Search result: $_resultText'),
        ),
      ),
    );
  }
}
