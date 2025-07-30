# alert_craft

`alert_craft` is a Flutter package for managing various types of overlays and alerts in your Flutter application. It provides a simple API for displaying alert dialogs, loading dialogs, selection dialogs, toast messages, and custom widgets.

## Features

- **Show Alert Dialog**: Display customizable alert dialogs.
- **Show Loading Dialog**: Show a loading indicator.
- **Show Selection Dialog**: Display a dialog with selectable options.
- **Show Toast Message**: Show non-intrusive toast messages.
- **Show Custom Dialog**: Display custom widgets in dialogs.
- **Show Custom Alert**: Display custom alerts with your own widget.
- **Close Alert**: Close the currently displayed overlay or alert.

## Installation

Add `alert_craft` to your `pubspec.yaml` file:

```yaml
dependencies:
  alert_craft: ^0.0.15
```

---

## Türkçe Açıklama

`alert_craft`, Flutter uygulamanızda çeşitli overlay ve uyarı tiplerini yönetmek için geliştirilmiş bir pakettir. Basit bir API ile alert dialog, loading dialog, seçim dialogu, toast mesajı ve özel widget dialogları gösterebilirsiniz.

### Özellikler

- **Uyarı Diyaloğu Göster**: Özelleştirilebilir uyarı dialogları gösterin.
- **Yükleme Diyaloğu Göster**: Yüklenme göstergesi açın.
- **Seçim Diyaloğu Göster**: Seçim yapılabilen dialog açın.
- **Toast Mesajı Göster**: Kısa süreli bilgi mesajları gösterin.
- **Özel Dialog Göster**: Dialog içinde özel widget gösterin.
- **Özel Uyarı Göster**: Kendi widget’ınızla özel uyarı gösterin.
- **Uyarıyı Kapat**: Açık olan overlay veya alert’i kapatın.

### Kurulum

`pubspec.yaml` dosyanıza ekleyin:

```yaml
dependencies:
  alert_craft: ^0.0.15
```

---

## Examples

### Show Alert Dialog

```dart
AlertManager().showAlert(
  type: AlertType.warning,
  title: 'Alert Title',
  description: 'This is an alert description.',
  buttonText: 'OK',
  theme: AlertTheme(
    backgroundColor: Colors.black,
    buttonStyle: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
  ),
);
```

### Show Loading Dialog

```dart
AlertManager().showLoading(
  message: "Loading...",
);

// To close:
AlertManager().close();
```

### Show Selection Dialog

```dart
AlertManager().showSelection(
  type: AlertType.warning,
  title: 'Select Option',
  description: 'Please choose an option.',
  leftText: 'Cancel',
  rightText: 'Continue',
  onLeft: () => AlertManager().close(),
  onRight: () {
    // Continue action
    AlertManager().close();
  },
);
```

### Show Toast Message

```dart
AlertManager().showToast(
  type: AlertType.info,
  message: 'This is a toast message.',
);
```

### Show Custom Dialog

```dart
AlertManager().showCustom(
  child: MyCustomWidget(),
);
```

### Show Custom Alert

```dart
AlertManager().showCustom(
  child: MyCustomAlertWidget(),
);
```

### Close Alert

```dart
AlertManager().close();
```
