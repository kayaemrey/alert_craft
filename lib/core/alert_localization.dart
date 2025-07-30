class AlertLocalization {
  static AlertLocalization defaultLocalization = AlertLocalization();

  final String ok;
  final String cancel;
  final String loading;
  final String error;

  const AlertLocalization({
    this.ok = "OK",
    this.cancel = "Cancel",
    this.loading = "Loading...",
    this.error = "Error",
  });
}
