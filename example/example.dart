import 'package:alert_craft/service/overlay_service.dart';
import 'package:flutter/material.dart';
import 'package:alert_craft/alert_craft.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final ShowAlert _showAlert = ShowAlert();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Craft Example'),
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
              child: Text('Show Alert Dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                _showAlert.showLoadingDialog(context);
              },
              child: Text('Show Loading Dialog'),
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
                  leftFunction: () => print('Cancelled'),
                  rightFunction: () => print('Confirmed'),
                );
              },
              child: Text('Show Selection Dialog'),
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
              child: Text('Show Toast Message'),
            ),
            ElevatedButton(
              onPressed: () {
                _showAlert.showCustomDialog(
                  CustomDialogWidget(),
                );
              },
              child: Text('Show Custom Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Custom Dialog'),
      content: Text('This is a custom dialog example.'),
      actions: [
        TextButton(
          onPressed: () => OverlayService().closeOverlay(),
          child: Text('Close'),
        ),
      ],
    );
  }
}
