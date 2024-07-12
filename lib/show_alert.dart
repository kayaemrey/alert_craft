part of 'alert_craft.dart';

class ShowAlert {
  void showAlertDialog({
    required BuildContext context,
    required int type,
    required String title,
    required String description,
    Color? buttonColor,
    String? buttonText,
    Color? buttonTextColor,
    Color? backgroundColor,
  }) {
    OverlayService().showOverlay(
      context,
      AlertDialogWidget(
        type: type,
        title: title,
        description: description,
        buttonColor: buttonColor,
        buttonText: buttonText,
        buttonTextColor: buttonTextColor,
        backgroundColor: backgroundColor,
      ),
    );
  }

  void showLoadingDialog(BuildContext context) {
    OverlayService().showOverlay(context, const LoadingWidget());
  }

  void showSelectionDialog({
    required BuildContext context,
    required int type,
    required String title,
    required String description,
    String buttonTextLeft = 'Close',
    String buttonTextRight = 'Ok',
    Color? buttonColor,
    Color? buttonTextColor,
    Color? backgroundColor,
    Function()? leftFunction,
    Function()? rightFunction,
  }) {
    OverlayService().showOverlay(
      context,
      SelectionWidget(
        type: type,
        title: title,
        description: description,
        buttonTextLeft: buttonTextLeft,
        buttonTextRight: buttonTextRight,
        buttonColor: buttonColor,
        buttonTextColor: buttonTextColor,
        backgroundColor: backgroundColor,
        leftFunction: leftFunction ?? () => OverlayService().removeOverlay(),
        rightFunction: rightFunction ?? () => OverlayService().removeOverlay(),
      ),
    );
  }

  void showToastMessage({
    required BuildContext context,
    required int type,
    required String title,
    required String description,
    Color? backgroundColor,
  }) {
    OverlayService().showOverlay(
        context,
        ToastMessageWidget(
          type: type,
          title: title,
          description: description,
          backgroundColor: backgroundColor,
        ));
  }

  void closeAlert() {
    OverlayService().removeOverlay();
  }
}
