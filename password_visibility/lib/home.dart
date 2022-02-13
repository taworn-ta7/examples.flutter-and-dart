import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'i18n/strings.g.dart';
import 'widgets/padding_between.dart';
import 'widgets/message_box.dart';

/// HomePage class.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

/// _HomeState internal class.
class _HomeState extends State<HomePage> {
  static final log = Logger('HomePage');

  // widgets
  late TextEditingController _usernameText;
  late TextEditingController _passwordText;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _usernameText = TextEditingController();
    _passwordText = TextEditingController();
    _obscureText = true;
    log.fine('$this initState()');
  }

  @override
  void dispose() {
    log.fine('$this dispose()');
    _passwordText.dispose();
    _usernameText.dispose();
    super.dispose();
  }

  // ----------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tr = t.homePage;
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.title),
        actions: [
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // username
              TextFormField(
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: tr.username,
                  prefixIcon: const Icon(Icons.person),
                ),
                controller: _usernameText,
              ),
              const PaddingBetween(),

              // password
              TextFormField(
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: tr.password,
                  prefixIcon: const Icon(Icons.lock_rounded),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                ),
                obscureText: _obscureText,
                controller: _passwordText,
              ),
              const PaddingBetween(),

              // login
              ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(tr.ok),
                ),
                onPressed: () {
                  final message =
                      'Username: ${_usernameText.text}\nPassword: ${_passwordText.text}';
                  MessageBox.info(context, message);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  // ----------------------------------------------------------------------

}
