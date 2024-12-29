import 'package:alert_craft/service/overlay_service.dart';
import 'package:flutter/material.dart';
import 'package:alert_craft/alert_craft.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final ShowAlert _showAlert = ShowAlert();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Craft Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _showAlert.showAlertDialog(
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
            ElevatedButton(
              onPressed: () {
                _showAlert.showLoadingDialog();
              },
              child: const Text('Show Loading Dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                _showAlert.showSelectionDialog(
                  type: 2,
                  title: 'Selection Dialog',
                  description: 'Choose an option:',
                  buttonTextLeft: 'Cancel',
                  buttonTextRight: 'Confirm',
                  buttonColor: Colors.green,
                  buttonTextColor: Colors.white,
                  backgroundColor: Colors.white,
                  leftFunction: () {},
                  rightFunction: () {} ,
                );
              },
              child: const Text('Show Selection Dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                _showAlert.showToastMessage(
                  type: 3,
                  title: 'Toast Message',
                  description: 'This is a toast message example.',
                  backgroundColor: Colors.black,
                );
              },
              child: const Text('Show Toast Message'),
            ),
            ElevatedButton(
              onPressed: () {
                _showAlert.showCustomDialog(
                  const CustomDialogWidget(),
                );
              },
              child: const Text('Show Custom Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Custom Dialog'),
      content: const Text('This is a custom dialog example.'),
      actions: [
        TextButton(
          onPressed: () => OverlayService().closeOverlay(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
