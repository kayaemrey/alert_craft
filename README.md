# alert_craft

`alert_craft` is a Flutter package for managing various types of overlays and alerts in your Flutter application. It provides a simple API for displaying alert dialogs, loading dialogs, selection dialogs, toast messages, and custom widgets.

## Features

- **Show Alert Dialog**: Display customizable alert dialogs.
- **Show Loading Dialog**: Show a loading indicator.
- **Show Selection Dialog**: Display a dialog with selectable options.
- **Show Toast Message**: Show non-intrusive toast messages.
- **Show Custom Dialog**: Display custom widgets in dialogs.
- **Show Custom Alert**: Display custom alerts with custom widgets.
- **Close Alert**: Close the currently displayed overlay or alert.

### Show Alert Dialog

Displays a customizable alert dialog with a title, description, and optional button styling.

```dart

void showAlert() {
  ShowAlert().showAlertDialog(
    type: 1,
    title: 'Alert Title',
    description: 'This is an alert description.',
    buttonColor: Colors.blue,
    buttonText: 'OK',
    buttonTextColor: Colors.white,
    backgroundColor: Colors.black,
  );
}
```

### Show Loading Dialog

Shows a loading indicator on top of the current screen.

```dart

void showLoading(BuildContext context) {
  ShowAlert().showLoadingDialog(context);
}
```

### Show Selection Dialog

Displays a dialog with options and custom button actions.

```dart
void showSelection() {
  ShowAlert().showSelectionDialog(
    type: 1,
    title: 'Select an Option',
    description: 'Choose an option below.',
    buttonTextLeft: 'Cancel',
    buttonTextRight: 'Confirm',
    leftFunction: () {
      // Handle left button action
    },
    rightFunction: () {
      // Handle right button action
    },
  );
}
```

### Show Toast Message

Shows a non-intrusive toast message with a title and description.

```dart

void showToast() {
  ShowAlert().showToastMessage(
    type: 1,
    title: 'Toast Title',
    description: 'This is a toast message.',
    backgroundColor: Colors.green,
  );
}
```

### Show Custom Dialog

Displays a custom widget inside a dialog.

```dart

void showCustomDialog() {
  ShowAlert().showCustomDialog(
    MyCustomWidget(), // Replace with your custom widget
  );
}
```

### Show Custom Alert

Displays a custom alert with your own widget.

```dart

void showCustomAlert() {
  ShowAlert().showCustomAlert(
    MyCustomAlertWidget(), // Replace with your custom alert widget
  );
}
```

### Close Alert

Closes the currently displayed overlay or alert.

```dart

void closeAlert() {
  ShowAlert().closeAlert();
}
```

## Installation

Add `alert_craft` to your `pubspec.yaml` file:

```yaml
dependencies:
  alert_craft: ^1.0.0
