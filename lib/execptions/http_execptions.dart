class HttpExecption implements Exception {
  final String msg;
  final int statusCode;

  HttpExecption({
    required this.msg,
    required this.statusCode,
  });
  @override
  String toString() {
    return msg;
  }
}
