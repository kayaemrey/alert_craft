part of 'alert_craft.dart';

class ShowAlert {
  void showAlertDialog({
    required int type,
    required String title,
    required String description,
    Color? buttonColor,
    String? buttonText,
    Color? buttonTextColor,
    Color? backgroundColor,
  }) {
    OverlayService().showCustomOverlay(
      child: AlertDialogWidget(
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

  void showLoadingDialog() {
    OverlayService().showCustomOverlay(child: const LoadingWidget());
  }

  void showSelectionDialog({
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
    OverlayService().showCustomOverlay(
      child: SelectionWidget(
        type: type,
        title: title,
        description: description,
        buttonTextLeft: buttonTextLeft,
        buttonTextRight: buttonTextRight,
        buttonColorRight: buttonColor,
        buttonTextColor: buttonTextColor,
        backgroundColor: backgroundColor,
        leftFunction: leftFunction ?? () => OverlayService().closeOverlay(),
        rightFunction: rightFunction ?? () => OverlayService().closeOverlay(),
      ),
    );
  }

  void showToastMessage({
    required int type,
    required String title,
    required String description,
    Color? backgroundColor,
  }) {
    OverlayService().showCustomOverlay(
        child: ToastMessageWidget(
      type: type,
      title: title,
      description: description,
      backgroundColor: backgroundColor,
    ));
  }

  void showCustomAlert(Widget widget) {
    OverlayService().showCustomOverlay(child: CustomAlertWidget(widget: widget));
  }

  void closeAlert() {
    OverlayService().closeOverlay();
  }
}
