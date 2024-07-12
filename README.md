# Alert Craft Flutter Package

Alert Craft is a Flutter package designed to simplify the creation of customizable notification and selection dialogs for your Flutter applications. It provides intuitive APIs and pre-built components to enhance user interaction through clear and customizable alerts.

## Features

- **showAlertDialog**:
- **showLoadingDialog**:
- **showSelectionDialog**:
- **showToastMessage**:
- **closeAlert**:

**Description:** Shows an alert dialog overlay with customizable title, description, and button options.

**Parameters:**
- `context` (required): The build context where the dialog will be shown.
- `type` (required): Integer representing the type of alert.
- `title` (required): Title text displayed in the alert dialog.
- `description` (required): Description text displayed in the alert dialog.
- `buttonColor` (optional): Color of the button in the alert dialog.
- `buttonText` (optional): Text displayed on the button in the alert dialog.
- `buttonTextColor` (optional): Text color of the button in the alert dialog.
- `backgroundColor` (optional): Background color of the alert dialog.

**Usage Example:**
```dart
ShowAlert().showAlertDialog(
  context: context,
  type: 1,
  title: 'Alert',
  description: 'This is an alert message.',
  buttonColor: Colors.blue,
  buttonText: 'OK',
  buttonTextColor: Colors.white,
  backgroundColor: Colors.grey[200],
);

**Description:** Shows a loading dialog overlay.

**Parameters:**
- `context` (required): The build context where the loading dialog will be shown.

**Usage Example:**
```dart
ShowAlert().showLoadingDialog(context);

**Description:** Shows a selection dialog overlay with customizable title, description, and button options.

**Parameters:**
- `context` (required): The build context where the dialog will be shown.
- `type` (required): Integer representing the type of selection dialog.
- `title` (required): Title text displayed in the selection dialog.
- `description` (required): Description text displayed in the selection dialog.
- `buttonTextLeft` (optional): Text displayed on the left button in the selection dialog.
- `buttonTextRight` (optional): Text displayed on the right button in the selection dialog.
- `buttonColor` (optional): Color of the buttons in the selection dialog.
- `buttonTextColor` (optional): Text color of the buttons in the selection dialog.
- `backgroundColor` (optional): Background color of the selection dialog.
- `leftFunction` (optional): Function called when the left button is pressed.
- `rightFunction` (optional): Function called when the right button is pressed.

**Usage Example:**
```dart
ShowAlert().showSelectionDialog(
  context: context,
  type: 2,
  title: 'Confirmation',
  description: 'Are you sure you want to proceed?',
  buttonTextLeft: 'Cancel',
  buttonTextRight: 'Yes',
  buttonColor: Colors.green,
  buttonTextColor: Colors.white,
  backgroundColor: Colors.grey[200],
  leftFunction: () {
    // Handle cancellation logic here
    ShowAlert().closeAlert();
  },
  rightFunction: () {
    // Handle confirmation logic here
    ShowAlert().closeAlert();
  },
);

**Description:** Shows a toast message overlay with customizable title, description, and background color.

**Parameters:**
- `context` (required): The build context where the toast message will be shown.
- `type` (required): Integer representing the type of toast message.
- `title` (required): Title text displayed in the toast message.
- `description` (required): Description text displayed in the toast message.
- `backgroundColor` (optional): Background color of the toast message.

**Usage Example:**
```dart
ShowAlert().showToastMessage(
  context: context,
  type: 3,
  title: 'Success!',
  description: 'Operation completed successfully.',
  backgroundColor: Colors.green,
);

**Description:** Closes the currently displayed alert overlay.

**Usage Example:**
```dart
ShowAlert().closeAlert();


## Installation

Add the following dependency to your `pubspec.yaml`:

```yaml
dependencies:
  alert_craft: ^1.0.0  # Replace with the latest version
