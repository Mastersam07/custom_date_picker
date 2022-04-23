import 'package:flutter/material.dart' hide showDatePicker;

import 'dater/sample.dart';

import 'dater/delegate.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Example());
}

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ExampleHome(),
    );
  }
}

class ExampleHome extends StatefulWidget {
  const ExampleHome({Key? key}) : super(key: key);

  @override
  State<ExampleHome> createState() => _ExampleHomeState();
}

class _ExampleHomeState extends State<ExampleHome> {
  DateTime _dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  key: const Key('Date Picker'),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.green, primary: Colors.white),
                  onPressed: () async {
                    var res = await showDatePicker(
                      context: context,
                      initialDate: _dateTime,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2099),
                      builder: (context, child) {
                        return Localizations.override(
                          context: context,
                          delegates: const [
                            CancelButtonLocalizationDelegate(),
                          ],
                          child: child,
                        );
                      },
                    );
                    if (res != null) {
                      setState(() {
                        _dateTime = res;
                      });
                    }
                  },
                  child: Text(_dateTime.toIso8601String())),
            ],
          ),
        ),
      ),
    );
  }
}
