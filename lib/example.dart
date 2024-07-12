import 'package:flutter/material.dart';
import 'alert_craft.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  ExampleScreen({super.key});

  final ShowAlert showAlert = ShowAlert();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Craft Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Show alert dialog example
                showAlert.showAlertDialog(
                  context: context,
                  type: 1,
                  title: 'Alert Dialog',
                  description: 'This is an alert dialog example.',
                  buttonColor: Colors.blue,
                  buttonText: 'OK',
                  buttonTextColor: Colors.white,
                  backgroundColor: Colors.grey[200],
                );
              },
              child: const Text('Show Alert Dialog'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Show loading dialog example
                showAlert.showLoadingDialog(context);
                
                // Simulating a delay and then closing the loading dialog
                Future.delayed(const Duration(seconds: 2), () {
                  showAlert.closeAlert();
                });
              },
              child: const Text('Show Loading Dialog'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Show selection dialog example
                showAlert.showSelectionDialog(
                  context: context,
                  type: 2,
                  title: 'Selection Dialog',
                  description: 'This is a selection dialog example.',
                  buttonTextLeft: 'Cancel',
                  buttonTextRight: 'Confirm',
                  buttonColor: Colors.green,
                  buttonTextColor: Colors.white,
                  backgroundColor: Colors.grey[200],
                  leftFunction: () {
                    showAlert.closeAlert();
                  },
                  rightFunction: () {
                    showAlert.closeAlert();
                  },
                );
              },
              child: const Text('Show Selection Dialog'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Show toast message example
                showAlert.showToastMessage(
                  context: context,
                  type: 3,
                  title: 'Toast Message',
                  description: 'This is a toast message example.',
                  backgroundColor: Colors.black54,
                );
              },
              child: const Text('Show Toast Message'),
            ),
          ],
        ),
      ),
    );
  }
}
