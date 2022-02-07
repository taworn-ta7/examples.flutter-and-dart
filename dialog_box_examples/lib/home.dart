import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
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
              // message box
              Text(
                'MessageBox Test',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 16)),

              // close
              _buildButton(
                text: 'Close',
                onPressed: () async => _returnFromMessageBox(
                  await MessageBox.show(
                    context: context,
                    message: tr.messageBoxTest,
                    caption: 'Close',
                    options: MessageBoxOptions(
                      barrierDismissible: true,
                      type: MessageBoxType.close,
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 16)),

              // ok
              _buildButton(
                text: 'Ok',
                onPressed: () async => _returnFromMessageBox(
                  await MessageBox.show(
                    context: context,
                    message: tr.messageBoxTest,
                    caption: 'OK',
                    options: MessageBoxOptions(
                      barrierDismissible: true,
                      type: MessageBoxType.ok,
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 16)),

              // ok cancel
              _buildButton(
                text: 'Ok Cancel',
                onPressed: () async => _returnFromMessageBox(
                  await MessageBox.show(
                    context: context,
                    message: tr.messageBoxTest,
                    caption: 'OK Cancel',
                    options: MessageBoxOptions(
                      barrierDismissible: true,
                      type: MessageBoxType.okCancel,
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 16)),

              // yes no
              _buildButton(
                text: 'Yes No',
                onPressed: () async => _returnFromMessageBox(
                  await MessageBox.show(
                    context: context,
                    message: tr.messageBoxTest,
                    caption: 'Yes No',
                    options: MessageBoxOptions(
                      barrierDismissible: true,
                      type: MessageBoxType.yesNo,
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 16)),

              // retry cancel
              _buildButton(
                text: 'Retry Cancel',
                onPressed: () async => _returnFromMessageBox(
                  await MessageBox.show(
                    context: context,
                    message: tr.messageBoxTest,
                    caption: 'Retry Cancel',
                    options: MessageBoxOptions(
                      barrierDismissible: true,
                      type: MessageBoxType.retryCancel,
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 16)),

              // ----------------------------------------------------------------------

              // input box
              Text(
                'InputBox Test',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade800,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 16)),

              // input #1
              _buildButton(
                text: 'Input 1',
                onPressed: () async => _returnFromInputBox(
                  await InputBox.show(
                    context: context,
                    message: tr.inputBoxTest,
                    placeholder: tr.inputBoxHintTest,
                    options: InputBoxOptions(),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 16)),

              // input #2
              _buildButton(
                text: 'Input 2',
                onPressed: () async => _returnFromInputBox(
                  await InputBox.show(
                    context: context,
                    message: tr.inputBoxTest,
                    placeholder: tr.inputBoxHintTest,
                    options: InputBoxOptions(
                      button1Negative: true,
                      barrierDismissible: true,
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 16)),

              // input #3
              _buildButton(
                text: 'Input 3',
                onPressed: () async => _returnFromInputBox(
                  await InputBox.show(
                    context: context,
                    message: tr.inputBoxTest,
                    placeholder: tr.inputBoxHintTest,
                    options: InputBoxOptions(
                      initialValue: '10 max55555555555',
                      maxLength: 10,
                      button0Negative: true,
                      barrierDismissible: true,
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 16)),

              // ----------------------------------------------------------------------

              // wait box
              Text(
                'WaitBox Test',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 16)),

              // wait
              _buildButton(
                text: 'Wait',
                onPressed: () async => _returnFromWaitBox(
                  await WaitBox.show<bool>(
                    context,
                    () async {
                      await Future.delayed(const Duration(seconds: 2));
                      return true;
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required void Function() onPressed,
  }) {
    return ElevatedButton(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Text(text),
      ),
      onPressed: onPressed,
    );
  }

  // ----------------------------------------------------------------------

  void _returnFromMessageBox(bool? result) {
    MessageBox.info(context, 'You click: $result.');
  }

  void _returnFromInputBox(String? result) {
    final text = result != null ? '"' + result + '"' : null;
    MessageBox.info(context, 'You input: $text.');
  }

  void _returnFromWaitBox<T>(T result) {
    MessageBox.info(context, 'You can continue, result: $result.');
  }
}
